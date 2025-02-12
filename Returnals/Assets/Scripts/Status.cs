using UnityEngine;

public class Status : MonoBehaviour
{
    [SerializeField]
    private float playerHP = 150.0f;     // �÷��̾� HP
    [SerializeField]
    private float maxHP = 150.0f;        // �÷��̾� �ִ� HP
    [SerializeField]
    private float playerStamina = 100.0f;// �÷��̾� ���¹̳�
    [SerializeField]
    private float maxStamina = 100.0f;   // �÷��̾� �ִ� ���¹̳�
    [SerializeField]
    private float recoverRateHP = 5.0f;    // �÷��̾� HP ȸ�� ����
    [SerializeField]
    private float recoverRateStamina = 2.0f; // �÷��̾� ���¹̳� ȸ�� ����
    [SerializeField]
    private float walkSpeed = 2.0f;      // �ȴ� �ӵ�
    [SerializeField]
    private float runSpeed = 5.0f;       // �ٴ� �ӵ�
    [SerializeField]
    private float moveSpeed = 4.0f;      // �����̴� �ӵ�

    public float PlayerHP
    {
        set => playerHP = value;
        get => playerHP;
    }
    public float MaxHP => maxHP;
    public float PlayerStamina => playerStamina;
    public float MaxStamina => maxStamina;
    public float RecoverRateHP => recoverRateHP;
    public float RecoverRateStamina => recoverRateStamina;
    public float WalkSpeed => walkSpeed;
    public float RunSpeed => runSpeed;
    public float MoveSpeed
    {
        set => moveSpeed = Mathf.Max(0,value);
        get => moveSpeed;
    }

    private void Awake()
    {
        playerHP = maxHP;
        playerStamina = maxStamina;
    }

    private void Update()
    {
        playerStamina += Time.deltaTime * recoverRateStamina;

        // ���� ���¹̳��� �����ְ�, �̵� �ӵ��� 2���� Ŭ ��(�޸� ��)
        if(playerStamina > 0 && moveSpeed > 2.0f)
        {
            playerStamina -= Time.deltaTime * 5.0f;
        }

        playerStamina = Mathf.Clamp(playerStamina,0,maxStamina);
    }
}
