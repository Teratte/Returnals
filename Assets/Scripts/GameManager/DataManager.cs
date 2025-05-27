using UnityEngine;
using System.IO;
using Newtonsoft.Json;
using System.Collections.Generic;
using GDS.Core.Events;

public class DataManager : MonoBehaviour
{
    public static DataManager instance;
    private string gameDataPath; // ���� ���
    private string weaponDataPath;// ���� ���� ���
    [SerializeField]
    private string gameDataName; // ���� �̸�
    private string weaponDataName = "WeaponList";

    [Header("Item List")]
    [SerializeField]
    private Item[] items;

    [Header("UI BaseCamp")]
    [SerializeField]
    private UIBaseCamp uiBaseCamp;

    GameData gameData = new GameData();
    Weapon weaponList = new Weapon();

    private FurnitureManager furnitureManager;

    private void Awake()
    {
        #region �̱���
        if (instance != null && instance != this)
        {
            Destroy(gameObject);

            return;
        }
        instance = this;
        gameDataPath = Path.Combine(Application.dataPath, gameDataName + ".json");   // ���� �̸� ����
        weaponDataPath = Path.Combine(Application.dataPath, weaponDataName + ".json"); // ���⸮��Ʈ ���� �̸� ����
        furnitureManager = FindAnyObjectByType<FurnitureManager>();
        Debug.Log(gameDataPath);
        DontDestroyOnLoad(gameObject);
        #endregion
    }

    public void SaveData()
    {
        SaveGameData();
        string data = JsonConvert.SerializeObject(gameData);
        string weaponData = JsonUtility.ToJson(weaponList, true);
        File.WriteAllText(gameDataPath, data);
        File.WriteAllText(weaponDataPath, weaponData);
    }

    public void LoadData()
    {
        if (File.Exists(gameDataPath) && File.Exists(weaponDataPath))
        {
            string jsonData = File.ReadAllText(gameDataPath);
            string weaponJsonData = File.ReadAllText(weaponDataPath);
            gameData = JsonConvert.DeserializeObject<GameData>(jsonData);
            weaponList = JsonUtility.FromJson<Weapon>(weaponJsonData);

            LoadGameData();
        }
        else
        {
            Debug.LogWarning("���� ������ �����ϴ�.");
        }
    }

    public void SaveGameData()
    {
        weaponList.weapons = GameManager.instance.selectWeaponList;
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
        GameManager.instance.selectWeaponList = weaponList.weapons;
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
        foreach(var item in GameManager.instance.Items)
        {
            gameData.Items.Add(item.Key.itemName, item.Value);
        }
    }

    public void CheckItem()
    {
        foreach(var item in items)
        {
            if(gameData.Items.ContainsKey(item.itemName))
            {
                GameManager.instance.AddItem(item, gameData.Items[item.itemName]);
                Debug.Log("������ �ε�!");
            }
        }

        foreach (var item in GameManager.instance.Items)
            uiBaseCamp.AcquireItem(item.Key, item.Value);
    }
}
