using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections.Generic;

public class SceneManagerScript : MonoBehaviour
{
    public static SceneManagerScript Instance;
    private HashSet<string> visitedScenes = new HashSet<string>();

    [SerializeField]
    public List<string> availableScenes = new List<string> { "Scene1", "Scene2", "Scene3", "Scene4", "Scene5" };

    [SerializeField]
    public string returnScene = "MainScene"; // ��� �� �湮 �� ���ƿ� ��

    private void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject);
        }
        else
        {
            Destroy(gameObject);
        }
    }

    public void LoadRandomScene()
    {
        if (visitedScenes.Count >= availableScenes.Count)
        {
            visitedScenes.Clear();
            SceneManager.LoadScene(returnScene); // ��� ���� �湮�ϸ� Ư�� ������ �̵�
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
            SceneManager.LoadScene(nextScene);
        }
    }
}
