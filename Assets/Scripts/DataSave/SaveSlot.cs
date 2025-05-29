using TMPro;
using UnityEngine;

public class SaveSlot : MonoBehaviour
{
    [SerializeField]
    private TextMeshProUGUI slotName;

    private string fileName = "Empty";    // 슬롯의 이름(저장된 파일을 불러올 때 사용)

    public string FileName
    {
        set => fileName = value;
        get => fileName;
    }

    public void InteractSaveSlot()
    {
        if(SceneManagerScript.Instance.IsLoadPanel)
        {
            if (fileName == "Empty")
                return;
            DataManager.instance.LoadData(fileName);    // 해당 슬롯에 데이터가 저장되어있으면 해당 이름의 파일 불러오기
            SceneManagerScript.Instance.LoadData();     // 슬롯 비활성화 및 로드된 데이터로 게임 시작
        }
        else if(SceneManagerScript.Instance.IsSavePanel)
        {
            if(fileName != "Empty")
            {
                DataManager.instance.DeleteData(fileName);
            }
            // 슬롯에 데이터 저장
            fileName = DataManager.instance.SaveData();
            slotName.text = fileName;
        }
    }

    public void UpdateSlotName()
    {
        slotName.text = fileName;
    }    
}
