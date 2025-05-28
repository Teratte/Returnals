using UnityEngine;
using System.IO;
using Newtonsoft.Json;
using System.Collections.Generic;

public class DataManager : MonoBehaviour
{
    public static DataManager instance;
    private string gameDataPath; // 파일 경로

    [SerializeField]
    private string gameDataName; // 파일 이름

    [Header("Item List")]
    [SerializeField]
    private Item[] items;

    [Header("UI BaseCamp")]
    [SerializeField]
    private UIBaseCamp uiBaseCamp;

    GameData gameData = new GameData();

    private FurnitureManager furnitureManager;  // 가구 매니저

    private void Awake()
    {
        #region 싱글톤
        if (instance != null && instance != this)
        {
            Destroy(gameObject);

            return;
        }
        instance = this;
        gameDataPath = Path.Combine(Application.dataPath, gameDataName + ".json");   // 파일 이름 설정
        furnitureManager = FindAnyObjectByType<FurnitureManager>();
        Debug.Log(gameDataPath);
        DontDestroyOnLoad(gameObject);
        #endregion
    }

    public void SaveData()
    {
        SaveGameData();
        string data = JsonConvert.SerializeObject(gameData);
        File.WriteAllText(gameDataPath, data);
    }

    public void LoadData()
    {
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
        AddWeapon();
        gameData.isFirstStage = GameManager.instance.isFirstStage;
        gameData.MaxAmmo = GameManager.instance.MaxAmmo;
        AddItem();
        gameData.Furnitures = GameManager.instance.Furnitures;
        gameData._stage = GameManager.instance.Stage;
        gameData._bestWaveCount = GameManager.instance.BestWaveCount;
        gameData._bestKillCount = GameManager.instance.BestKillCount;
    }

    public void LoadGameData()
    {
        CheckWeapon();
        GameManager.instance.isFirstStage = gameData.isFirstStage;
        GameManager.instance.MaxAmmo = gameData.MaxAmmo;
        CheckItem();
        GameManager.instance.Furnitures = gameData.Furnitures;
        furnitureManager.ActiveFurnitures();
        GameManager.instance.Stage = gameData._stage;
        GameManager.instance.BestKillCount = gameData._bestKillCount;
        GameManager.instance.BestWaveCount = gameData._bestWaveCount;
    }

    public void AddItem()
    {
        gameData.Items.Clear();
        foreach(var item in GameManager.instance.Items)
        {
            gameData.Items.Add(item.Key.itemName, item.Value);
        }
    }

    public void AddWeapon()
    {
        gameData.weapons.Clear();
        foreach(var weapon in WeaponObjectPooling.instance.GameObjects)
        {
            if(weapon.activeSelf)
            {
                UIWeapon uiWeapon = weapon.GetComponent<UIWeapon>();
                gameData.weapons.Add(uiWeapon.Name);
            }
        }
    }

    public void CheckItem()
    {
        foreach(var item in items)
        {
            if(gameData.Items.ContainsKey(item.itemName))
            {
                GameManager.instance.AddItem(item, gameData.Items[item.itemName]);
                Debug.Log("아이템 로드!");
            }
        }

        foreach (var item in GameManager.instance.Items)
            uiBaseCamp.AcquireItem(item.Key, item.Value);
    }

    public void CheckWeapon()
    {
        WeaponObjectPooling.instance.DeactivePooling();
        foreach(var weapon in gameData.weapons)
        {
            WeaponObjectPooling.instance.ActivePooling(weapon);
        }
    }
}
