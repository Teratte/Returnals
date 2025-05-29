using UnityEngine;
using System.IO;
using Newtonsoft.Json;
using System.Collections.Generic;

public class DataManager : MonoBehaviour
{
    public static DataManager instance { get; private set; }
    private string gameDataPath; // ���� ���

    [SerializeField]
    private string gameDataName; // ���� �̸�

    [Header("Item List")]
    [SerializeField]
    private Item[] items;

    [Header("UI BaseCamp")]
    [SerializeField]
    private UIBaseCamp uiBaseCamp;

    GameData gameData = new GameData();

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
        Debug.Log(gameDataPath);
        DontDestroyOnLoad(gameObject);
        #endregion
    }

    // ������ ����
    public string SaveData()
    {
        SaveGameData();
        string data = JsonConvert.SerializeObject(gameData);
        string fileName = System.DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss");
        gameDataPath = Path.Combine(Application.dataPath, fileName + ".json");
        File.WriteAllText(gameDataPath, data);

        return fileName;
    }

    public void LoadData(string fileName)
    {
        gameDataPath = Path.Combine(Application.dataPath, fileName + ".json");  // ���� �̸� ����
        if (File.Exists(gameDataPath))
        {
            string jsonData = File.ReadAllText(gameDataPath);
            gameData = JsonConvert.DeserializeObject<GameData>(jsonData);

            LoadGameData();
        }
        else
        {
            Debug.LogWarning("���� ������ �����ϴ�.");
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
        FurnitureManager.instance.ActiveFurnitures();
        GameManager.instance.Stage = gameData._stage;
        GameManager.instance.BestKillCount = gameData._bestKillCount;
        GameManager.instance.BestWaveCount = gameData._bestWaveCount;
    }

    public void DeleteData(string fileName)
    {
        string path = Path.Combine(Application.dataPath, fileName + ".json");

        if(File.Exists(path))
        {
            File.Delete(path);
            Debug.Log("���� ���� �Ϸ�");
        }
        else
        {
            Debug.Log("�ش� ������ �����Ƿ� ���� �Ұ�");
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
                Debug.Log("������ �ε�!");
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
