using TMPro;
using UnityEngine;

public class SaveSlot : MonoBehaviour
{
    [SerializeField]
    private TextMeshProUGUI slotName;

    private string fileName = "Empty";    // ������ �̸�(����� ������ �ҷ��� �� ���)

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
            DataManager.instance.LoadData(fileName);    // �ش� ���Կ� �����Ͱ� ����Ǿ������� �ش� �̸��� ���� �ҷ�����
            SceneManagerScript.Instance.LoadData();     // ���� ��Ȱ��ȭ �� �ε�� �����ͷ� ���� ����
        }
        else if(SceneManagerScript.Instance.IsSavePanel)
        {
            if(fileName != "Empty")
            {
                DataManager.instance.DeleteData(fileName);
            }
            // ���Կ� ������ ����
            fileName = DataManager.instance.SaveData();
            slotName.text = fileName;
        }
    }

    public void UpdateSlotName()
    {
        slotName.text = fileName;
    }    
}
