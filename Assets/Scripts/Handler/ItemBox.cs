using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class ItemBox : KeyPressHandler
{
    [SerializeField]
    private List<Item> items;
    private InventoryUI ui; // ¿Œ∫•≈‰∏Æ UI

    private void Awake()
    {
        textInteract = GameObject.Find("InteractionText").GetComponent<TextMeshProUGUI>();
        ui = FindAnyObjectByType<InventoryUI>();
    }

    private void Update()
    {
        if(isNearby && Input.GetKeyDown(KeyCode.F))
        {
            Interact();
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if(other.GetComponent<PlayerController>() != null)
        {
            isNearby = true;
            textInteract.text = "F≈∞∏¶ ¥≠∑Ø ∑£¥˝ æ∆¿Ã≈€ »πµÊ";
            textInteract.enabled = true;
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.GetComponent<PlayerController>() != null)
        {
            isNearby = false;
            textInteract.enabled = false;
        }
    }

    public override void Interact()
    {
        if(!isUsed)
        {
            int index = Random.Range(0, items.Count);
            textInteract.text = $"{items[index].itemName} »πµÊ";

            // «ÿ¥Á æ∆¿Ã≈€ »πµÊ
            ui.AcquireItem(items[index]);
            GameManager.instance.AddItem(items[index]);

            isUsed = true;
        }
        else
        {
            textInteract.text = "¿ÃπÃ ªÁøÎµ ";
        }
    }
}
