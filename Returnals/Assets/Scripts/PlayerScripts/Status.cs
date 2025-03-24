using UnityEngine;

public class Status : MonoBehaviour
{
    [SerializeField]
    private float playerHP = 150.0f;     // �÷��̾� HP
    [SerializeField]
    private float maxHP = 150.0f;        // �÷��̾� �ִ� HP
    [SerializeField]
    private float playerStamina = 50.0f;// �÷��̾� ���¹̳�
    [SerializeField]
    private float maxStamina = 50.0f;   // �÷��̾� �ִ� ���¹̳�
    [SerializeField]
    private float recoverRateHP = 5.0f;    // �÷��̾� HP ȸ�� ����
    [SerializeField]
    private float recoverRateStamina = 5.0f; // �÷��̾� ���¹̳� ȸ�� ����
    [SerializeField]
    private float walkSpeed = 2.0f;      // �ȴ� �ӵ�
    [SerializeField]
    private float runSpeed = 5.0f;       // �ٴ� �ӵ�
    [SerializeField]
    private float moveSpeed = 4.0f;      // �����̴� �ӵ�

    public float PlayerHP
    {
        set => playerHP = Mathf.Clamp(value,0,maxHP);
        get => playerHP;
    }
    public float MaxHP => maxHP;
    public float PlayerStamina
    {
        set => playerStamina = value;
        get => playerStamina;
    }
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
}
