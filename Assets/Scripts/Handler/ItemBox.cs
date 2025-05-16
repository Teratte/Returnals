using System.Collections.Generic;
using UnityEngine;

public class ItemBox : KeyPressHandler
{
    [SerializeField]
    private List<Item> items;
    [SerializeField]
    private InventoryUI ui;

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
            textInteract.text = "FŰ�� ���� ���� ������ ȹ��";
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
            textInteract.text = $"{items[index].itemName} ȹ��";

            // �ش� ������ ȹ��
            ui.AcquireItem(items[index]);
            GameManager.instance.AddItem(items[index]);

            isUsed = true;
        }
        else
        {
            textInteract.text = "�̹� ����";
        }
    }
}
