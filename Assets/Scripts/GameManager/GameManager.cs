using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections.Generic;

// 점수와 게임 오버 여부를 관리하는 게임 매니저
public class GameManager : MonoBehaviour
{
    // 싱글톤 접근용 프로퍼티
    public static GameManager instance
    {
        get
        {
            // 만약 싱글톤 변수에 아직 오브젝트가 할당되지 않았다면
            if (m_instance == null)
            {
                // 씬에서 GameManager 오브젝트를 찾아 할당
                m_instance = FindObjectOfType<GameManager>();
            }

            // 싱글톤 오브젝트를 반환
            return m_instance;
        }
    }

    private static GameManager m_instance; // 싱글톤이 할당될 static 변수

    [SerializeField]
    private float timer = 900.0f;

    public float Timer => timer;

    public bool isGameOver = false;

    public bool isGameStart = false;
    public List<GameObject> holdingWeaponPrefabs;   // 보유 무기 리스트
    public GameObject mainWeapon;                   // 메인 무기
    public GameObject subWeapon;                    // 보조 무기
    public GameObject holdingGazet;                 // 보유 가젯

    [Header("Items")]
    public List<Item> items;

    public List<Item> Items => items;

    public bool isUIOn = false;

    private void Awake()
    {
        // 씬에 싱글톤 오브젝트가 된 다른 GameManager 오브젝트가 있다면
        if (instance != this && instance != null)
        {
            // 자신을 파괴
            Destroy(gameObject);

            return;
        }
        DontDestroyOnLoad(gameObject);

        // 씬이 로드될 때 실행할 함수 등록
        SceneManager.sceneLoaded += OnSceneLoaded;
    }

    private void Update()
    {
        if (SceneManager.GetActiveScene().name == "Yuno's Test" && !isGameOver)
        {
            timer -= Time.deltaTime;

            if(Timer <= 0)
            {
                isGameOver = true;
                timer = 900.0f;
            }
        }
    }

    void OnSceneLoaded(Scene scene, LoadSceneMode mode)
    {
        if(SceneManager.GetActiveScene().name == "Yuno's Test")
        {
            timer = 900.0f;
            Debug.Log("인 게임 씬 로드");
            //Slots = FindObjectOfType<InventoryUI>().Slots;
        }
        else if(SceneManager.GetActiveScene().name == "BaseCampTest")
        {
            holdingWeaponPrefabs.Clear();
        }
    }

    private void OnDestroy()
    {
        // 이벤트 해제 (메모리 누수 방지)
        SceneManager.sceneLoaded -= OnSceneLoaded;
    }

    public void AddItem(Item item)
    {
        items.Add(item);
    }

    public void ActiveUI()
    {
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
        isUIOn = true;
        Time.timeScale = 0.0f;
    }

    public void DeactiveUI()
    {
        Cursor.visible = false;
        Cursor.lockState = CursorLockMode.Locked;
        isUIOn = false;
        Time.timeScale = 1.0f;
    }
}