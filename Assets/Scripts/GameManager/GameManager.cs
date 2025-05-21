using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections.Generic;
using KINEMATION.FPSAnimationPack.Scripts.Player;

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
                m_instance = FindAnyObjectByType<GameManager>();
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
    public List<GameObject> selectWeaponList;       // 무기 선택 리스트
    public bool isFirstStage = true;                       // 첫 스테이지 진입 여부
    private FPSPlayer player;

    private Dictionary<string,int> maxAmmo = new Dictionary<string,int>();  // 탄알 종류별로 최대 가지고 있는 탄알 수 보관
    public Dictionary<string, int>MaxAmmo => maxAmmo;

    [Header("AssaultBullet")]
    public int currentAssaultAmmo;
    public int maxAssuaultAmmo;

    [Header("ShotgunBullet")]
    public int currentShotgunAmmo;
    public int maxShotgunAmmo;

    [Header("Machinegun")]
    public int currentMachinegunAmmo;
    public int maxMachinegunAmmo;

    [Header("SMGBullet")]
    public int currentSMGAmmo;
    public int maxSMGAmmo;

    [Header("SniperBullet")]
    public int currentSniperAmmo;
    public int maxSniperAmmo;

    [Header("Items")]
    private Dictionary<Item, int> items = new Dictionary<Item, int>();  // 아이템 보관 딕셔너리

    public Dictionary<Item, int> Items => items;

    public bool isUIOn = false;
    private int _stage = 0; // 스테이지 수
    private int _killCount = 0; // 적 처치 수
    private int _waveCount = 0; // 웨이브 수
    public int Stage => _stage;
    public int KillCount => _killCount;
    public int WaveCount
    {
        set => _waveCount = value;
        get => _waveCount;
    }
    private void Awake()
    {
        // 씬에 싱글톤 오브젝트가 된 다른 GameManager 오브젝트가 있다면
        if (instance != this && instance != null)
        {
            // 자신을 파괴
            Destroy(gameObject);

            return;
        }
        // 최대 탄약 세팅
        maxAmmo.Add("AssaultRifle", 999);
        maxAmmo.Add("Shotgun", 999);
        maxAmmo.Add("Sniper", 999);
        maxAmmo.Add("SmallMachinegun", 999);
        maxAmmo.Add("HeavyWeapon", 999);
        maxAmmo.Add("Handgun", 999);
        DontDestroyOnLoad(gameObject);

        // 씬이 로드될 때 실행할 함수 등록
        SceneManager.sceneLoaded += OnSceneLoaded;
    }

    private void Update()
    {
        if (isGameStart && !isGameOver)
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
        isGameOver = false;
        if (isGameStart)
        {
            _stage++;
            timer = 900.0f;
            Debug.Log("인 게임 씬 로드");
            //Slots = FindObjectOfType<InventoryUI>().Slots;
            player = FindAnyObjectByType<FPSPlayer>();
            if(player != null)
            {
                player.playerSettings.weaponPrefabs.Clear();
                player.playerSettings.weaponPrefabs.Add(mainWeapon);
                player.playerSettings.weaponPrefabs.Add(subWeapon);
            }
        }
        else if(SceneManager.GetActiveScene().name == "BaseCampTest")
        {
            _waveCount = 0;
            holdingWeaponPrefabs.Clear();
            mainWeapon = null;
            subWeapon = null;
            holdingGazet = null;
        }
    }

    private void OnDestroy()
    {
        // 이벤트 해제 (메모리 누수 방지)
        SceneManager.sceneLoaded -= OnSceneLoaded;
    }

    public void AddItem(Item item, int count=1)
    {
        if (!items.ContainsKey(item))
            items.Add(item, count);
        else
            items[item] += count;
    }

    public void ActiveUI()
    {
        Time.timeScale = 0.0f;
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
        isUIOn = true;
    }

    public void DeactiveUI()
    {
        Cursor.visible = false;
        Cursor.lockState = CursorLockMode.Locked;
        isUIOn = false;
        Time.timeScale = 1.0f;
    }
}