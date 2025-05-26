using UnityEngine;
using System.IO;

public class DataManager : MonoBehaviour
{
    public static DataManager instance;
    private string path; // ���� ���     
    [SerializeField]
    private string dataName; // ���� �̸�

    GameData gameData = new GameData();

    private void Awake()
    {
        #region �̱���
        if (instance != this &&  instance != null)
        {
            Destroy(gameObject);
        }
        else
        {
            path = Path.Combine(Application.dataPath, dataName +".json");   // ���� �̸� ����
            Debug.Log(path);
            DontDestroyOnLoad(gameObject);
        }
        #endregion
    }

    public void SaveData()
    {
        SaveGameData();
        string data = JsonUtility.ToJson(gameData, true);
        File.WriteAllText(path, data);
    }

    public void LoadData()
    {
        string jsonData = File.ReadAllText(path);
        gameData = JsonUtility.FromJson<GameData>(jsonData);
        LoadGameData();
    }

    public void SaveGameData()
    {
        gameData.selectWeaponList = GameManager.instance.selectWeaponList;
        gameData.isFirstStage = GameManager.instance.isFirstStage;
        gameData.MaxAmmo = GameManager.instance.MaxAmmo;
        gameData.Items = GameManager.instance.Items;
        gameData._stage = GameManager.instance.Stage;
        gameData._bestWaveCount = GameManager.instance.BestWaveCount;
        gameData._bestKillCount = GameManager.instance.BestKillCount;
    }

    public void LoadGameData()
    {
        GameManager.instance.selectWeaponList = gameData.selectWeaponList;
        GameManager.instance.isFirstStage = gameData.isFirstStage;
        GameManager.instance.MaxAmmo = gameData.MaxAmmo;
        GameManager.instance.Items = gameData.Items;
        GameManager.instance.Stage = gameData._stage;
        GameManager.instance.BestKillCount = gameData._bestKillCount;
        GameManager.instance.BestWaveCount = gameData._bestWaveCount;
    }
}
