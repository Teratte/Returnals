using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class InventoryUI : MonoBehaviour
{
    public static bool inventoryActivated = false;

    [SerializeField]
    private GameObject InventoryObject; // �κ��丮 â
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
    private Image currentWeaponIcon;                // ���� ���� ������
    [SerializeField]
    private TextMeshProUGUI currentWeaponName;      // ���� ���� �̸�
    [SerializeField]
    private TextMeshProUGUI currentWeaponDetails;   // ���� ���� ������
    [SerializeField]
    private TextMeshProUGUI currentWeaponStatus;    // ���� ���� ����

    private UIWeapon currentWeapon;                 // ���� ����

    [Header("Holding Weapon List")]
    [SerializeField]
    private Image supportWeapon;        // ���� ����
    [SerializeField]
    private Image mainWeapon_1;         // ���� ����1
    [SerializeField]
    private Image mainWeapon_2;         // ���� ����2
    [SerializeField]
    private Image gazet;                // ����

    public Slot[] Slots => slots;

    private void Awake()
    {
        slots = slotsParent.GetComponentsInChildren<Slot>();
        playerAnimator = FindObjectOfType<PlayerAnimator>();
        InventoryObject.SetActive(false);
    }

    private void Update()
    {
        // �κ��丮 â ����
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