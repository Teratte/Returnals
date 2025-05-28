using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using System.Collections.Generic;
using TMPro;
using System.Collections;

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

    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(gameObject);
        }
        else
        {
            blurVolume.SetActive(true);
            postProcessVolume.SetActive(false);
            PanelTitle.SetActive(true);
            Instance = this;
            waitChangeDelay = new WaitForSeconds(0.5f);
            DontDestroyOnLoad(gameObject);
        }
    }

    private void Update()
    {
        if(Input.GetKeyDown(KeyCode.Escape) && !PanelPause.activeSelf && !GameManager.instance.isUIOn)
        {
            GameManager.instance.ActiveUI();
            PanelPause.SetActive(true);
        }
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
        if(name == "BaseCamp")
        {
            GameManager.instance.isGameStart = false;
            GameManager.instance.isUIOn = false;
        }
        int index = Random.Range(0, loadingSprites.Length);
        loadingBackGround.sprite = loadingSprites[index];
        loadingProgress.value = 0.0f;
        loadingScreen.SetActive(true);

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
        GameManager.instance.isUIOn = false;
        blurVolume.SetActive(false);
        postProcessVolume.SetActive(true);
        PanelTitle.SetActive(false);
    }

    public void GoToTitle()
    {
        LoadScene("BaseCamp");
        GameManager.instance.isUIOn = true;
        blurVolume.SetActive(true);
        postProcessVolume.SetActive(false);
        PanelTitle.SetActive(true);
    }

    public void ShowSavePanel()
    {
        PanelSave.SetActive(true);
        PanelTitle.SetActive(false);
    }

    public void LoadData()
    {
        DataManager.instance.LoadData();
        GameManager.instance.isUIOn = false;
        blurVolume.SetActive(false);
        postProcessVolume.SetActive(true);
        PanelSave.SetActive(false);
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
