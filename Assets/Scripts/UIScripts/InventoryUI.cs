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
    private TextMeshProUGUI timer;      // Ÿ�̸�
    [SerializeField]
    private TextMeshProUGUI ammoText;   // źâ ��

    private Slot[] slots;
    private PlayerAnimator playerAnimator;

    public Slot[] Slots => slots;       // ȹ�� ������ ����Ʈ

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
            GameManager.instance.ActiveUI();
        }
        else
        {
            inventoryActivated = false;
            InventoryObject.SetActive(false);
            GameManager.instance.DeactiveUI();
        }

        if (GameManager.instance.isGameStart)
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
}