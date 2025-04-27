using UnityEngine;

public class PlayerController : MonoBehaviour
{
    private MovementCharacter character;
    private Status status;

    private void Awake()
    {
        character = GetComponent<MovementCharacter>();
        status = GetComponent<Status>();
        Cursor.visible = false;
        Cursor.lockState = CursorLockMode.Locked;
    }

    private void Update()
    {
        if(!GameManager.instance.isGameOver)
            character.UpdateMovement();
        status.PlayerHP = Mathf.Clamp(status.PlayerHP,0,status.MaxHP);

        // ���� ���¹̳��� �����ְ�, �̵� �ӵ��� 2���� Ŭ ��(�޸� ��)
        if (status.MoveSpeed > 2.0f && !status.OnAdrenaline)
        {
            status.PlayerStamina -= Time.deltaTime * 10.0f;
        }

        status.PlayerStamina = Mathf.Clamp(status.PlayerStamina, 0, status.MaxStamina);
    }
}
