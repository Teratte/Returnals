using TMPro;
using UnityEngine;

public class VendingMachine : KeyPressHandler
{
    [SerializeField]
    private float heal = 30.0f; // 힐량

    private Status status;  // 플레이어의 스테이터스

    private void Awake()
    {
        status = FindAnyObjectByType<Status>();
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
            textInteract.text = "F키를 눌러 체력 회복";
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
            status.PlayerHP += heal;
            textInteract.text = $"플레이어의 체력 {heal}회복";
            isUsed = true;
        }
        else
        {
            textInteract.text = "이미 사용됨";
        }
    }
}
