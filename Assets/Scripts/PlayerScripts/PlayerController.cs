using UnityEngine;

public class PlayerController : MonoBehaviour
{
    private MovementCharacter character;
    private Status status;
    private RotateToMouse rotateToMouse;

    private void Awake()
    {
        character = GetComponent<MovementCharacter>();
        status = GetComponent<Status>();
        rotateToMouse = GetComponent<RotateToMouse>();
        Cursor.visible = false;
        Cursor.lockState = CursorLockMode.Locked;
    }

    private void Update()
    {
        if(!GameManager.instance.isGameOver)
        {
            character.UpdateMovement();
            UpdateRotate();
        }
        status.PlayerHP = Mathf.Clamp(status.PlayerHP,0,status.MaxHP);

        // 현재 스태미나가 남아있고, 이동 속도가 2보다 클 때(달릴 때)
        if (status.MoveSpeed > 2.0f && !status.OnAdrenaline && (Input.GetAxis("Horizontal") != 0.0f || Input.GetAxis("Vertical") != 0.0f))
        {
            status.PlayerStamina -= Time.deltaTime * 10.0f;
        }

        status.PlayerStamina = Mathf.Clamp(status.PlayerStamina, 0, status.MaxStamina);
    }

    private void UpdateRotate()
    {
        float mouseX = Input.GetAxis("Mouse X");
        float mouseY = Input.GetAxis("Mouse Y");

        rotateToMouse.UpdateRotate(mouseX, mouseY);
    }
}
