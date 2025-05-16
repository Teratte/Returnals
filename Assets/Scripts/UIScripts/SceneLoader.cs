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
        private GameObject loadingScreen;   // �ε� ȭ��
        [SerializeField]
        private Image loadingBackGround;    // �ε� ȭ�鿡 ��µǴ� ��� �̹���
        [SerializeField]
        private Sprite[] loadingSprites;    // ��� �̹��� ���
        [SerializeField]
        private Slider loadingProgress;     // �ε� ���൵
        [SerializeField]
        private TextMeshProUGUI textProgress; // �ε� ���൵ �ؽ�Ʈ

        private WaitForSeconds waitChangeDelay;// �� ���� ���� �ð�

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

            // �񵿱� �۾�(�� �ҷ�����)�� �Ϸ�� ������ �ݺ�
            while(asyncOperation.isDone == false)
            {
                // �񵿱� �۾��� ���� ����(0.0~1.0)
                loadingProgress.value = asyncOperation.progress;
                textProgress.text = $"{Mathf.RoundToInt(asyncOperation.progress * 100)}%";

                yield return null;
            }

            yield return waitChangeDelay;

            loadingScreen.SetActive(false);
        }
    }
}
