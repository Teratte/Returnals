using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class UIBaseCamp : MonoBehaviour
{
    public static bool inventoryActivated = false;

    [SerializeField]
    private GameObject InventoryObject; // �κ��丮 â
    [SerializeField]
    private GameObject slotsParent;
    private Slot[] slots;                           // ������ ������
    public Dictionary<Item, int>items = new Dictionary<Item, int>();

    [Header("Current Weapon")]
    [SerializeField]
    private Image currentWeaponIcon;                // ���� ���� ������
    [SerializeField]
    private TextMeshProUGUI currentWeaponName;      // ���� ���� �̸�
    [SerializeField]
    private TextMeshProUGUI currentWeaponDetails;   // ���� ���� ������
    [SerializeField]
    private TextMeshProUGUI currentWeaponStatus;    // ���� ���� ����
    [SerializeField]
    private GameObject panelDetail;                 // ���� �� ���� â

    private UIWeapon currentWeapon;                 // ���� ����

    [Header("Holding Weapon List")]
    [SerializeField]
    private Image supportWeapon;        // ���� ����
    [SerializeField]
    private Image mainWeapon;         // ���� ����
    [SerializeField]
    private Image gazet;                // ����

    public Slot[] Slots => slots;

    private void Awake()
    {
        slots = slotsParent.GetComponentsInChildren<Slot>();
        InventoryObject.SetActive(false);
        panelDetail.SetActive(false);

        foreach (Item item in GameManager.instance.Items)
            AcquireItem(item);
    }

    private void Update()
    {
        // �κ��丮 â ����
        if (Input.GetKey(KeyCode.Tab) && !GameManager.instance.isUIOn)
        {
            inventoryActivated = true;
            InventoryObject.SetActive(true);
            GameManager.instance.ActiveUI();
        }
        else if(Input.GetKeyUp(KeyCode.Tab) && InventoryObject.activeSelf)
        {
            inventoryActivated = false;
            InventoryObject.SetActive(false);
            GameManager.instance.DeactiveUI();
        }
    }

    public void UpdateCurrentWeapon(UIWeapon current)
    {
        panelDetail.SetActive(true);
        currentWeapon = current;

        currentWeaponIcon.sprite = current.Icon;
        currentWeaponName.text = current.Name;
        currentWeaponDetails.text = current.Details;
        currentWeaponStatus.text = current.WeaponStatus;
    }

    public void AddWeapon(UIWeapon current)
    {
        if(current.WeaponPrefab.GetComponent<WeaponBase>()==null)
            GameManager.instance.holdingGazet = current.WeaponPrefab;

        if (current.WeaponType == WeaponAttribute.Support)
        {
            GameManager.instance.subWeapon = current.WeaponPrefab;
            supportWeapon.sprite = current.Icon;
        }
        else if (current.WeaponType == WeaponAttribute.Main)
        {
            GameManager.instance.mainWeapon = current.WeaponPrefab;
            mainWeapon.sprite = current.Icon;
        }
        else if(current.WeaponType == WeaponAttribute.Gazet)
        {
            gazet.sprite = current.Icon;
        }
    }

    public void AcquireItem(Item _item, int _count = 1)
    {
        if (Item.ItemType.Equipment != _item.itemType)
        {
            for (int i = 0; i < slots.Length; i++)
            {
                if (slots[i].item != null)
                {
                    if (slots[i].item.itemName == _item.itemName)
                    {
                        slots[i].SetSlotCount(_count);
                        items[_item] = _count;
                        return;
                    }
                }
            }
        }

        for (int i = 0; i < slots.Length; i++)
        {
            if (slots[i].item == null)
            {
                slots[i].AddItem(_item, _count);
                items.Add(_item, _count);
                return;
            }
        }
    }
}