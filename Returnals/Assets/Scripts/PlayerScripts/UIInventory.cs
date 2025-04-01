using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class UIInventory : MonoBehaviour
{
    [Header("Inventory")]
    [SerializeField]
    private GameObject inventoryPanel;  // �κ��丮
    [SerializeField]
    private GameObject detailsPanel;     // ������ �� ����
    [SerializeField]
    private UIItem[] items;             // �κ��丮�� �ִ� �����۵�
    [SerializeField]
    private Status status;

    [Header("Current Item")]
    [SerializeField]
    private Image currentItemIcon;
    [SerializeField]
    private TextMeshProUGUI currentItemName;
    [SerializeField]
    private TextMeshProUGUI currentItemCount;
    [SerializeField]
    private TextMeshProUGUI currentItemDetails;

    private UIItem currentItem;

    private void Update()
    {
        if(Input.GetKey(KeyCode.Tab))
        {
            inventoryPanel.SetActive(true);
        }
        else if(Input.GetKeyUp(KeyCode.Tab))
        {
            inventoryPanel.SetActive(false);
        }

        if(Input.GetKeyDown(KeyCode.Escape) && detailsPanel.activeSelf == true)
        {
            detailsPanel.SetActive(false);
        }
    }

    public void GetItem(int index)
    {
        items[index].Count++;
    }

    public void UpdateCurrentItem(UIItem current)
    {
        detailsPanel.SetActive(true);

        currentItem = current;

        currentItemIcon.sprite = currentItem.Icon;
        currentItemName.text = currentItem.Name;
        currentItemCount.text = $"{currentItem.Count}/9999";
        currentItemDetails.text = currentItem.Details;
    }

    public void OnClickUse()
    {
        if(currentItem.Count > 0)
        {
            currentItem.Count--;
            status.PlayerHP += currentItem.HPRecovery;
        }
    }
}
