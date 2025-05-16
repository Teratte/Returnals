using System.Collections;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public enum SceneNames { BaseCamp = 0, InGame}

namespace UnityNote
{
    public class SceneLoader : MonoBehaviour
    {
        public static SceneLoader Instance { get; private set; }

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
            if(Instance != null && Instance != this)
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

        public void LoadScene(string name)
        {
            int index = Random.Range(0, loadingSprites.Length);
            loadingBackGround.sprite = loadingSprites[index];
            loadingProgress.value = 0.0f;
            loadingScreen.SetActive(false);

            StartCoroutine(LoadSceneAsync(name));
        }

        public void LoadScene(SceneNames name)
        {
            LoadScene(name.ToString());
        }

        private IEnumerator LoadSceneAsync(string name)
        {
            AsyncOperation asyncOperation = SceneManager.LoadSceneAsync(name);

            // 비동기 작업(씬 불러오기)이 완료될 때까지 반복
            while(asyncOperation.isDone == false)
            {
                // 비동기 작업의 진행 사항(0.0~1.0)
                loadingProgress.value = asyncOperation.progress;
                textProgress.text = $"{Mathf.RoundToInt(asyncOperation.progress * 100)}%";

                yield return null;
            }

            yield return waitChangeDelay;

            loadingScreen.SetActive(false);
        }
    }
}
