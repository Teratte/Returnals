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
    public string returnScene = "MainScene"; // ��� �� �湮 �� ���ƿ� ��

    [SerializeField]
    private GameObject loadingScreen;   // �ε� ȭ��
    [SerializeField]
    private Image loadingBackGround;    // �ε� ȭ�鿡 ��µǴ� ��� �̹���
    [SerializeField]
    private Sprite[] loadingSprites;    // ��� �̹��� ���
    [SerializeField]
    private Slider loadingProgress;     // �ε� ���൵
    [SerializeField]
    private TextMeshProUGUI textProgress; // �ε� ���൵ �ؽ�Ʈ
    [SerializeField]
    private GameObject blurVolume;        // �� ó�� ���ӿ�����Ʈ
    [SerializeField]
    private GameObject postProcessVolume; // ���� ����
    [SerializeField]
    private GameObject PanelTitle;        // ���� Ÿ��Ʋ
    [SerializeField]
    private GameObject PanelSave;         // ���� ���� �г�
    [SerializeField]
    private GameObject PanelPause;        // �Ͻ����� �г�

    private WaitForSeconds waitChangeDelay;// �� ���� ���� �ð�

    [Header("SaveSlots")]
    [SerializeField]
    private Transform saveSlotsParent;  // ������ ���� ���Ե��� �θ� ������Ʈ
    private bool _isSavePanel = false;  // ���� ������ ������ ���� �г��ΰ�
    private bool _isLoadPanel = false;  // ���� ������ ������ �ε� �г��ΰ�
    private SaveSlot[] slots;           // ������ ���� ���Ե�

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
        GameManager.instance.Weapons.Clear();           // ���� �ʱ�ȭ
        GameManager.instance.Items.Clear();             // ������ �ʱ�ȭ
        GameManager.instance.Furnitures.Clear();        // ���� �ʱ�ȭ
        WeaponObjectPooling.instance.SetUp();           // �⺻ ���⸦ ������ �ٸ� ���� ��Ȱ��ȭ
        WeaponObjectPooling.instance.SetActiveSelf();   // ���� ��Ƽ��
        UIBaseCamp.instance.InitialSlots();             // ���̽�ķ�� ������ �ʱ�ȭ
        FurnitureManager.instance.ResetFurnitures();    // ���� ���ġ
        GameManager.instance.BestKillCount = 0;         // �ְ� ų �� �ʱ�ȭ
        GameManager.instance.BestWaveCount = 0;         // �ְ� ���̺� �� �ʱ�ȭ
        GameManager.instance.BestItemCount = 0;         // �ְ� ������ ȹ�� �� �ʱ�ȭ
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
            LoadScene(returnScene); // ��� ���� �湮�ϸ� Ư�� ������ �̵�
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

        // �񵿱� �۾�(�� �ҷ�����)�� �Ϸ�� ������ �ݺ�
        while (asyncOperation.isDone == false)
        {
            // �񵿱� �۾��� ���� ����(0.0~1.0)
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

    // �����ϱ� ���� �г� Ȱ��ȭ
    public void ShowSaveDataSlot()
    {
        _isSavePanel = true;
        _isLoadPanel = false;
        PanelSave.SetActive(true);
        PanelPause.SetActive(false);
        ReadAllSavedFile();
    }


    // ������ �ҷ����⸦ ���� �г� Ȱ��ȭ
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
            Debug.Log("���� ������.");
        }

        foreach(SaveSlot slot in slots)
        {
            slot.FileName = "Empty";
            slot.UpdateSlotName();
        }
    }

    public void ExitGame()
    {
        // �����Ϳ��� ���� ���� ��� (������)
#if UNITY_EDITOR
        UnityEditor.EditorApplication.isPlaying = false;
#else
        // ����� ���ӿ����� �� �ڵ尡 �����
        Application.Quit();
#endif
    }
}
