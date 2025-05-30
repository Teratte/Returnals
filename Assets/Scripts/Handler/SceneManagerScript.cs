using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using System.Collections.Generic;
using TMPro;
using System.Collections;
using System.IO;

public class SceneManagerScript : MonoBehaviour
{
    public static SceneManagerScript Instance { get; private set; }
    private HashSet<string> visitedScenes = new HashSet<string>();

    [SerializeField]
    public List<string> availableScenes = new List<string> { "Scene1", "Scene2", "Scene3", "Scene4", "Scene5" };

    [SerializeField]
    public string returnScene = "MainScene"; // 모든 씬 방문 후 돌아올 씬

    [SerializeField]
    private GameObject loadingScreen;   // 로딩 화면
    [SerializeField]
    private Image loadingBackGround;    // 로딩 화면에 출력되는 배경 이미지
    [SerializeField]
    private Sprite[] loadingSprites;    // 배경 이미지 목록
    [SerializeField]
    private Slider loadingProgress;     // 로딩 진행도
    [SerializeField]
    private TextMeshProUGUI textProgress; // 로딩 진행도 텍스트
    [SerializeField]
    private GameObject blurVolume;        // 블러 처리 게임오브젝트
    [SerializeField]
    private GameObject postProcessVolume; // 게임 시작
    [SerializeField]
    private GameObject PanelTitle;        // 게임 타이틀
    [SerializeField]
    private GameObject PanelSave;         // 저장 슬롯 패널
    [SerializeField]
    private GameObject PanelPause;        // 일시정지 패널

    private WaitForSeconds waitChangeDelay;// 씬 변경 지연 시간

    [Header("SaveSlots")]
    [SerializeField]
    private Transform saveSlotsParent;  // 데이터 저장 슬롯들의 부모 오브젝트
    private bool _isSavePanel = false;  // 현재 슬롯은 데이터 저장 패널인가
    private bool _isLoadPanel = false;  // 현재 슬롯은 데이터 로드 패널인가
    private SaveSlot[] slots;           // 데이터 저장 슬롯들

    public bool IsSavePanel => _isSavePanel;
    public bool IsLoadPanel => _isLoadPanel;
    public int VisitedSceneCount => visitedScenes.Count;

    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(gameObject);
            return;
        }
        Instance = this;
        blurVolume.SetActive(true);
        postProcessVolume.SetActive(false);
        PanelTitle.SetActive(true);
        Instance = this;
        waitChangeDelay = new WaitForSeconds(0.5f);
        slots = saveSlotsParent.GetComponentsInChildren<SaveSlot>();
        DontDestroyOnLoad(gameObject);
    }

    private void Update()
    {
        if(Input.GetKeyDown(KeyCode.Escape) && !PanelPause.activeSelf && !GameManager.instance.isUIOn)
        {
            GameManager.instance.ActiveUI();
            PanelPause.SetActive(true);
        }
    }

    private void ResetGame()
    {
        GameManager.instance.Weapons.Clear();           // 무기 초기화
        GameManager.instance.Items.Clear();             // 아이템 초기화
        GameManager.instance.Furnitures.Clear();        // 가구 초기화
        WeaponObjectPooling.instance.SetUp();           // 기본 무기를 제외한 다른 무기 비활성화
        WeaponObjectPooling.instance.SetActiveSelf();   // 무기 액티브
        UIBaseCamp.instance.InitialSlots();             // 베이스캠프 아이템 초기화
        FurnitureManager.instance.ResetFurnitures();    // 가구 재배치
        GameManager.instance.BestKillCount = 0;         // 최고 킬 수 초기화
        GameManager.instance.BestWaveCount = 0;         // 최고 웨이브 수 초기화
        GameManager.instance.BestItemCount = 0;         // 최고 아이템 획득 수 초기화
    }

    public void DeactivePanelPause()
    {
        if(GameManager.instance.isGameStart)
        {
            GameManager.instance.DeactiveUI();
        }
        else
        {
            Time.timeScale = 1.0f;
            GameManager.instance.isUIOn = false;
        }

        PanelPause.SetActive(false);
    }

    public void LoadRandomScene()
    {
        if (visitedScenes.Count >= availableScenes.Count)
        {
            visitedScenes.Clear();
            LoadScene(returnScene); // 모든 씬을 방문하면 특정 씬으로 이동
            return;
        }

        List<string> remainingScenes = new List<string>();

        foreach (var scene in availableScenes)
        {
            if (!visitedScenes.Contains(scene))
            {
                remainingScenes.Add(scene);
            }
        }

        if (remainingScenes.Count > 0)
        {
            string nextScene = remainingScenes[Random.Range(0, remainingScenes.Count)];
            visitedScenes.Add(nextScene);
            LoadScene(nextScene);
        }
    }

    public void LoadScene(string name)
    {
        PanelPause.SetActive(false);
        if (name == "BaseCamp")
        {
            GameManager.instance.Stage = 0;
            GameManager.instance.isGameStart = false;
            GameManager.instance.isUIOn = false;
            postProcessVolume.SetActive(true);
            visitedScenes.Clear();
        }
        int index = Random.Range(0, loadingSprites.Length);
        loadingBackGround.sprite = loadingSprites[index];
        loadingProgress.value = 0.0f;
        
        if(name != "BaseCamp")
        {
            postProcessVolume.SetActive(false);
            loadingScreen.SetActive(true);
        }

        StartCoroutine(LoadSceneAsync(name));
    }

    private IEnumerator LoadSceneAsync(string name)
    {
        AsyncOperation asyncOperation = SceneManager.LoadSceneAsync(name);

        // 비동기 작업(씬 불러오기)이 완료될 때까지 반복
        while (asyncOperation.isDone == false)
        {
            // 비동기 작업의 진행 사항(0.0~1.0)
            loadingProgress.value = asyncOperation.progress;
            textProgress.text = $"{Mathf.RoundToInt(asyncOperation.progress * 100)}%";

            yield return null;
        }

        loadingScreen.SetActive(false);
    }

    public void StartNewGame()
    {
        ResetGame();
        GameManager.instance.isUIOn = false;
        blurVolume.SetActive(false);
        postProcessVolume.SetActive(true);
        PanelTitle.SetActive(false);
    }

    public void GoToTitle()
    {
        LoadScene("BaseCamp");
        GameManager.instance.isUIOn = true;
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
        blurVolume.SetActive(true);
        postProcessVolume.SetActive(false);
        PanelTitle.SetActive(true);
    }

    // 저장하기 위한 패널 활성화
    public void ShowSaveDataSlot()
    {
        _isSavePanel = true;
        _isLoadPanel = false;
        PanelSave.SetActive(true);
        PanelPause.SetActive(false);
        ReadAllSavedFile();
    }


    // 데이터 불러오기를 위한 패널 활성화
    public void ShowLoadDataSlot()
    {
        _isSavePanel = false;
        _isLoadPanel = true;
        PanelTitle.SetActive(false);
        PanelSave.SetActive(true);
        ReadAllSavedFile();
    }

    public void DeactiveSaveDataSlot()
    {
        if(_isSavePanel)
        {
            PanelSave.SetActive(false);
            PanelPause.SetActive(true);
        }
        else if(_isLoadPanel)
        {
            PanelSave.SetActive(false);
            PanelTitle.SetActive(true);
        }
    }

    public void LoadData()
    {
        GameManager.instance.isUIOn = false;
        blurVolume.SetActive(false);
        postProcessVolume.SetActive(true);
        PanelSave.SetActive(false);
    }

    public void ReadAllSavedFile()
    {
#if UNITY_EDITOR
        string targetPath = Application.dataPath;
#else
        string targetPath = Application.persistentDataPath;
#endif
        string[] files = Directory.GetFiles(targetPath, "*.json");

        for(int i = 0;i < files.Length; i++)
        {
            files[i] = Path.GetFileNameWithoutExtension(files[i]);
        }

        for(int i = 0, j = 0;i < slots.Length && j < files.Length; i++, j++)
        {
            slots[i].FileName = files[j];
            slots[i].UpdateSlotName();
        }
    }

    public void DeleteAllData()
    {
#if UNITY_EDITOR
        string targetPath = Application.dataPath;
#else
        string targetPath = Application.persistentDataPath;
#endif
        string[] files = Directory.GetFiles(targetPath, "*.json");

        foreach(string file in files)
        {
            File.Delete(file);
            Debug.Log("파일 삭제됨.");
        }

        foreach(SaveSlot slot in slots)
        {
            slot.FileName = "Empty";
            slot.UpdateSlotName();
        }
    }

    public void ExitGame()
    {
        // 에디터에서 실행 중일 경우 (디버깅용)
#if UNITY_EDITOR
        UnityEditor.EditorApplication.isPlaying = false;
#else
        // 빌드된 게임에서는 이 코드가 실행됨
        Application.Quit();
#endif
    }
}
