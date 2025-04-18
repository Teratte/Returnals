using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class UIBaseCamp : MonoBehaviour
{
    public static bool inventoryActivated = false;

    [SerializeField]
    private GameObject InventoryObject; // 인벤토리 창
    [SerializeField]
    private GameObject slotsParent;
    private Slot[] slots;                           // 보관된 아이템
    public Dictionary<Item, int>items = new Dictionary<Item, int>();

    [Header("Current Weapon")]
    [SerializeField]
    private Image currentWeaponIcon;                // 현재 무기 아이콘
    [SerializeField]
    private TextMeshProUGUI currentWeaponName;      // 현재 무기 이름
    [SerializeField]
    private TextMeshProUGUI currentWeaponDetails;   // 현재 무기 상세정보
    [SerializeField]
    private TextMeshProUGUI currentWeaponStatus;    // 현재 무기 스탯
    [SerializeField]
    private GameObject panelDetail;                 // 무기 상세 정보 창

    private UIWeapon currentWeapon;                 // 현재 무기

    [Header("Holding Weapon List")]
    [SerializeField]
    private Image supportWeapon;        // 보조 무기
    [SerializeField]
    private Image mainWeapon;         // 메인 무기
    [SerializeField]
    private Image gazet;                // 가젯

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
        // 인벤토리 창 열기
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