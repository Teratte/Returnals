using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class InventoryUI : MonoBehaviour
{
    public static bool inventoryActivated = false;

    [SerializeField]
    private GameObject InventoryObject; // 인벤토리 창
    [SerializeField]
    private GameObject slotsParent;
    [SerializeField]
    private TextMeshProUGUI timer;
    [SerializeField]
    private TextMeshProUGUI ammoText;

    private Slot[] slots;
    private PlayerAnimator playerAnimator;

    [Header("Current Weapon")]
    [SerializeField]
    private Image currentWeaponIcon;                // 현재 무기 아이콘
    [SerializeField]
    private TextMeshProUGUI currentWeaponName;      // 현재 무기 이름
    [SerializeField]
    private TextMeshProUGUI currentWeaponDetails;   // 현재 무기 상세정보
    [SerializeField]
    private TextMeshProUGUI currentWeaponStatus;    // 현재 무기 스탯

    private UIWeapon currentWeapon;                 // 현재 무기

    [Header("Holding Weapon List")]
    [SerializeField]
    private Image supportWeapon;        // 보조 무기
    [SerializeField]
    private Image mainWeapon_1;         // 메인 무기1
    [SerializeField]
    private Image mainWeapon_2;         // 메인 무기2
    [SerializeField]
    private Image gazet;                // 가젯

    public Slot[] Slots => slots;

    private void Awake()
    {
        slots = slotsParent.GetComponentsInChildren<Slot>();
        playerAnimator = FindObjectOfType<PlayerAnimator>();
        InventoryObject.SetActive(false);
    }

    private void Update()
    {
        // 인벤토리 창 열기
        if (Input.GetKey(KeyCode.Tab))
        {
            inventoryActivated = true;
            InventoryObject.SetActive(true);
        }
        else
        {
            inventoryActivated = false;
            InventoryObject.SetActive(false);
        }

        if(GameManager.instance.isGameStart)
        {
            timer.text = $"{(int)GameManager.instance.Timer}";
            ammoText.text = $"{playerAnimator.Weapon.CurrentAmmo} / {playerAnimator.Weapon.MaxAmmo}";
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
                return;
            }
        }
    }

    public void UpdateCurrentWeapon(UIWeapon current)
    {
        currentWeapon = current;

        currentWeaponIcon.sprite = current.Icon;
        currentWeaponName.text = current.Name;
        currentWeaponDetails.text = current.Details;
        currentWeaponStatus.text = current.WeaponStatus;

        if(current.WeaponType == WeaponAttribute.Support)
        {
            supportWeapon.sprite = current.Icon;
        }
    }
}