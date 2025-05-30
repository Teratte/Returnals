using TMPro;
using UnityEngine;

public class VendingMachine : KeyPressHandler
{
    [SerializeField]
    private float heal = 30.0f; // ����

    private void Awake()
    {
        textInteract = GameObject.Find("InteractionText").GetComponent<TextMeshProUGUI>();
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
            textInteract.text = "FŰ�� ���� ü�� ȸ��";
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
        if(!isUsed && Status.Instance.PlayerHP < Status.Instance.MaxHP)
        {
            Status.Instance.PlayerHP += heal;
            textInteract.text = $"�÷��̾��� ü�� {heal}ȸ��";
            isUsed = true;
        }
        else if(isUsed)
        {
            textInteract.text = "�̹� ����";
        }
        else if(Status.Instance.PlayerHP >= Status.Instance.MaxHP)
        {
            textInteract.text = "ü���� �� ������.";
        }
    }
}
