using UnityEngine;
using System.IO;
using Newtonsoft.Json;

public class DataManager : MonoBehaviour
{
    public static DataManager instance { get; private set; }
    private string gameDataPath; // 파일 경로

    [SerializeField]
    private string gameDataName; // 파일 이름

    [Header("Item List")]
    [SerializeField]
    private Item[] items;

    GameData gameData = new GameData();

    private void Awake()
    {
        #region 싱글톤
        if (instance != null && instance != this)
        {
            Destroy(gameObject);

            return;
        }
        instance = this;
#if UNITY_EDITOR
        gameDataPath = Path.Combine(Application.dataPath, gameDataName + ".json");   // 파일 이름 설정
#else
        gameDataPath = Path.Combine(Application.persistentDataPath, gameDataName + ".json");   // 파일 이름 설정
#endif
        Debug.Log(gameDataPath);
        DontDestroyOnLoad(gameObject);
        #endregion
    }

    // 데이터 저장
    public string SaveData()
    {
        SaveGameData();
        string data = JsonConvert.SerializeObject(gameData);
        string fileName = System.DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss");
#if UNITY_EDITOR
        gameDataPath = Path.Combine(Application.dataPath, fileName + ".json");
#else
        gameDataPath = Path.Combine(Application.persistentDataPath, fileName + ".json");
#endif
        File.WriteAllText(gameDataPath, data);

        return fileName;
    }

    public void LoadData(string fileName)
    {
#if UNITY_EDITOR
        gameDataPath = Path.Combine(Application.dataPath, fileName + ".json");          // 파일 이름 추적
#else
        gameDataPath = Path.Combine(Application.persistentDataPath, fileName + ".json");
#endif
        if (File.Exists(gameDataPath))
        {
            string jsonData = File.ReadAllText(gameDataPath);
            gameData = JsonConvert.DeserializeObject<GameData>(jsonData);

            LoadGameData();
        }
        else
        {
            Debug.LogWarning("저장 파일이 없습니다.");
        }
    }

    public void SaveGameData()
    {
        gameData.weapons = GameManager.instance.Weapons;
        gameData.isFirstStage = GameManager.instance.isFirstStage;
        gameData.MaxAmmo = GameManager.instance.MaxAmmo;
        AddItem();
        gameData.Furnitures = GameManager.instance.Furnitures;
        gameData._bestWaveCount = GameManager.instance.BestWaveCount;
        gameData._bestKillCount = GameManager.instance.BestKillCount;
        gameData._bestItemCount = GameManager.instance.BestItemCount;
    }

    public void LoadGameData()
    {
        GameManager.instance.Weapons = gameData.weapons;
        GameManager.instance.isFirstStage = gameData.isFirstStage;
        GameManager.instance.MaxAmmo = gameData.MaxAmmo;
        CheckItem();
        GameManager.instance.Furnitures = gameData.Furnitures;
        FurnitureManager.instance.ActiveFurnitures();
        GameManager.instance.BestKillCount = gameData._bestKillCount;
        GameManager.instance.BestWaveCount = gameData._bestWaveCount;
        GameManager.instance.BestItemCount = gameData._bestItemCount;
    }

    public void DeleteData(string fileName)
    {
#if UNITY_EDITOR
        string path = Path.Combine(Application.dataPath, fileName + ".json");
#else
        string path = Path.Combine(Application.persistentDataPath, fileName + ".json");
#endif
        if (File.Exists(path))
        {
            File.Delete(path);
            Debug.Log("파일 삭제 완료");
        }
        else
        {
            Debug.Log("해당 파일이 없으므로 삭제 불가");
        }
    }
    public void AddItem()
    {
        gameData.Items.Clear();
        foreach(var item in GameManager.instance.Items)
        {
            gameData.Items.Add(item.Key.itemName, item.Value);
        }
    }

    public void CheckItem()
    {
        GameManager.instance.Items.Clear();
        foreach(var item in items)
        {
            if(gameData.Items.ContainsKey(item.itemName))
            {
                GameManager.instance.AddItem(item, gameData.Items[item.itemName]);
                Debug.Log("아이템 로드!");
            }
        }

        // 베이스캠프에 남아있던 아이템 목록들 초기화
        UIBaseCamp.instance.InitialSlots();
        // 게임 매니저에 들어있는 아이템으로 채우기
        foreach (var item in GameManager.instance.Items)
            UIBaseCamp.instance.AcquireItem(item.Key, item.Value);
    }
}
