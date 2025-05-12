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

    private WaitForSeconds waitChangeDelay;// 씬 변경 지연 시간

    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(gameObject);
        }
        else
        {
            Instance = this;
            waitChangeDelay = new WaitForSeconds(0.5f);
            DontDestroyOnLoad(gameObject);
        }
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
        int index = Random.Range(0, loadingSprites.Length);
        loadingBackGround.sprite = loadingSprites[index];
        loadingProgress.value = 0.0f;
        loadingScreen.SetActive(true);

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
}
