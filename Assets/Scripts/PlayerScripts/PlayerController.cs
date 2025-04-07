using UnityEngine;
using UnityEngine.SceneManagement;

public class PlayerController : MonoBehaviour
{
    private MovementCharacter character;
    private Status status;

    bool isNotAttack = true;
    float notAttackTime = 0.0f;
    [SerializeField]
    private float recoverAbleTime = 3.0f;
    bool isRecover = false;

    private void Awake()
    {
        character = GetComponent<MovementCharacter>();
        status = GetComponent<Status>();
        Cursor.visible = false;
        Cursor.lockState = CursorLockMode.Locked;
    }

    private void Update()
    {
        if(isNotAttack && status.PlayerHP < status.MaxHP)
        {
            notAttackTime += Time.deltaTime;
        }

        if (notAttackTime >= recoverAbleTime)
        {
            notAttackTime = 0.0f;
            isRecover = true;
        }

        if(isRecover &&  status.PlayerHP < status.MaxHP)
        {
            status.PlayerHP += Time.deltaTime * 5.0f;
            if(status.PlayerHP >= status.MaxHP)
            {
                isRecover = false;
            }
        }

        character.UpdateMovement();
        status.PlayerHP = Mathf.Clamp(status.PlayerHP,0,status.MaxHP);

        status.PlayerStamina += Time.deltaTime * status.RecoverRateStamina;

        // ���� ���¹̳��� �����ְ�, �̵� �ӵ��� 2���� Ŭ ��(�޸� ��)
        if (status.PlayerStamina > 0 && status.MoveSpeed > 2.0f)
        {
            status.PlayerStamina -= Time.deltaTime * 10.0f;
        }

        status.PlayerStamina = Mathf.Clamp(status.PlayerStamina, 0, status.MaxStamina);

        if (Input.GetKeyDown(KeyCode.T))
        {
            GameManager.instance.isGameStart = false;
            SceneManager.LoadScene("BaseCampTest");
        }
    }
}
