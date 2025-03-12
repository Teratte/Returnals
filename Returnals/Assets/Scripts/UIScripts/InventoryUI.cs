using UnityEngine;

public class InventoryUI : MonoBehaviour
{
    public static InventoryUI Instance { get; private set; }
    public static bool inventoryActivated = false;

    [SerializeField]
    private GameObject InventoryObject;
    [SerializeField]
    private GameObject slotsParent;

    private Slot[] slots;

    private void Awake()
    {
        Instance = this;
        slots = slotsParent.GetComponentsInChildren<Slot>();
        InventoryObject.SetActive(false);

        DontDestroyOnLoad(gameObject);
    }

    private void Update()
    {
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