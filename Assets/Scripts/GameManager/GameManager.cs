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

        set => m_instance = value;
    }

    private static GameManager m_instance; // 싱글톤이 할당될 static 변수

    [SerializeField]
    private float timer = 900.0f;

    public float Timer => timer;

    public bool isGameOver = false;

    public bool isGameStart = false;
    public GameObject mainWeapon;                   // 메인 무기
    public GameObject subWeapon;                    // 보조 무기
    public GameObject holdingGazet;                 // 보유 가젯
    public bool isFirstStage = true;                       // 첫 스테이지 진입 여부

    private Dictionary<string, int> maxAmmo = new Dictionary<string, int>();  // 탄알 종류별로 최대 가지고 있는 탄알 수 보관
    public Dictionary<string, int> MaxAmmo
    {
        set => maxAmmo = value;
        get => maxAmmo;
    }

    [Header("Items")]
    private Dictionary<Item, int> items = new Dictionary<Item, int>();  // 아이템 보관 딕셔너리

    [Header("Furniture")]
    private Dictionary<string,bool> furnitures = new Dictionary<string,bool>(); // 가구 딕셔너리(활성, 비활성 상태로 보유)
    public Dictionary<Item, int> Items
    {
        set=> items = value;
        get => items;
    }

    public Dictionary<string, bool> Furnitures
    {
        set => furnitures = value;
        get => furnitures;
    }

    [Header("Weapons & Gazet")]
    public Dictionary<string, bool> Weapons = new Dictionary<string,bool>();    // 무기 딕셔너리(활성, 비활성 상태로 보유)

    public bool isUIOn = false;
    private int _stage = 0;     // 스테이지 수
    private int _waveCount = 0; // 웨이브 수
    private int _killCount = 0; // 적 처치 수
    private int _bestWaveCount = 0; // 최고 웨이브 돌파 수
    private int _bestKillCount = 0; // 한 게임에서 최고 처치 수
    private float _playTime = 0.0f; // 총 플레이 타임
    private int _bestItemCount = 0; // 총 얻었던 아이템 개수
    public int WaveCount => _waveCount;
    public int KillCount => _killCount;
    public int BestWaveCount
    {
        set => _bestWaveCount = value;
        get => _bestWaveCount;
    }
    public int BestKillCount
    {
        set => _bestKillCount = value;
        get => _bestKillCount;
    }

    public int BestItemCount
    {
        set => _bestItemCount = value;
        get => _bestItemCount;
    }

    public int Stage
    {
        set => _stage = value;
        get => _stage;
    }

    public float PlayTime => _playTime;

    [Header("InventoryUI")]
    [SerializeField]
    private InventoryUI _inventoryUI;

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
            _playTime += Time.deltaTime;
            if (Timer <= 0)
            {
                isGameOver = true;
                // 게임 종료 패널 출력
                ItemManager.Instance.ClearItem();   // 시간이 종료되어도 아이템 전부 잃기
                _inventoryUI.ActiveClosingPanel();
                timer = 900.0f;
            }
        }
        else
        {
            return;
        }
    }

    void OnSceneLoaded(Scene scene, LoadSceneMode mode)
    {
        isGameOver = false;
        if (isGameStart)
        {
            _inventoryUI = FindAnyObjectByType<InventoryUI>();
            EnemyFSM.OnKilled.AddListener(PlusKillCount);
            _stage++;
            timer = 900.0f;
            Debug.Log("인 게임 씬 로드");
        }
        else if(SceneManager.GetActiveScene().name == "BaseCamp")
        {
            EnemyFSM.OnKilled.RemoveListener(PlusKillCount);
            RenewalBestWaveCount();
            RenewalBestKillCount();
            Time.timeScale = 1.0f;
            mainWeapon = null;
            subWeapon = null;
            holdingGazet = null;
            isGameStart = false;
            _playTime = 0.0f;   // 플레이 타임 초기화
            _waveCount = 0;     // 웨이브 초기화
            _killCount = 0;     // 킬 카운트 0으로 초기화
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

    private void PlusWaveCount()
    {
        _waveCount++;
    }

    private void PlusKillCount()
    {
        _killCount++;
    }
    public void RenewalBestWaveCount()
    {
        if(_waveCount > _bestWaveCount)
        {
            _bestWaveCount = _waveCount;
        }
    }

    public void RenewalBestKillCount()
    {
        _bestKillCount += _killCount;
    }
    private void OnEnable()
    {
        WaveManager.OnWavePlus += PlusWaveCount;
    }

    private void OnDisable()
    {
        WaveManager.OnWavePlus -= PlusWaveCount;
    }
}

public class GameData
{
    public bool isFirstStage = true;                       // 첫 스테이지 진입 여부
    public Dictionary<string, bool> weapons = new Dictionary<string, bool>(); // 무기 보관 딕셔너리
    private Dictionary<string, int> maxAmmo = new Dictionary<string, int>();  // 탄알 종류별로 최대 가지고 있는 탄알 수 보관
    public Dictionary<string, int> MaxAmmo{ get => maxAmmo; set => maxAmmo = value; }

    [Header("Items")]
    private Dictionary<string, int> items = new Dictionary<string, int>();  // 아이템 보관 딕셔너리

    public Dictionary<string, int> Items { get => items; set => items = value; }
    public Dictionary<string, bool> Furnitures = new Dictionary<string, bool>();

    public bool isUIOn = false;
    public int _bestWaveCount = 0; // 최고 웨이브 돌파 수
    public int _bestKillCount = 0; // 한 게임에서 최고 처치 수
    public int _bestItemCount = 0; // 최고 아이템 개수
}