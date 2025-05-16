using UnityEngine;

[System.Serializable]
public class HPEvent : UnityEngine.Events.UnityEvent<float, float> { }
public class Status : MonoBehaviour
{
    [HideInInspector]
    public HPEvent onHPEvent = new HPEvent();

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
    [SerializeField]
    private float defense = 50.0f;         // ����
    [SerializeField]
    private float recoverAbleTime = 3.0f;   // ȸ������ �ð�

    public bool OnAdrenaline = false;

    public bool isNotAttack = true;    // ���� �޴� ���� �ƴ� ���
    float notAttackTime = 0.0f; // ���� ���� �ʴ� �ð�
    bool isRecover = false;     // HP ȸ�� ���� ���

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
    public float RecoverRateStamina => recoverRateStamina;
    public float WalkSpeed
    {
        set => walkSpeed = value;
        get => walkSpeed;
    }
    public float RunSpeed
    {
        set => runSpeed = value;
        get => runSpeed;
    }
    public float MoveSpeed
    {
        set => moveSpeed = Mathf.Max(0,value);
        get => moveSpeed;
    }

    public float Defense => defense;

    private void Awake()
    {
        playerHP = maxHP;
        playerStamina = maxStamina;
    }

    private void Update()
    {
        if(!GameManager.instance.isGameOver)
        {
            // ���� �޴� ���� �ƴϸ� �ִ� ü���� �ƴϸ� ���� ���� �ʴ� �ð� ���
            if (isNotAttack && PlayerHP < MaxHP)
            {
                isRecover = false;
                notAttackTime += Time.deltaTime;
            }

            // ���� ���� �ʴ� �ð��� �ڵ� ��� �ð� �Ķ�� ȸ��
            if (notAttackTime >= recoverAbleTime)
            {
                isNotAttack = false;
                notAttackTime = 0.0f;
                isRecover = true;
            }

            if (isRecover && PlayerHP < MaxHP)
            {
                PlayerHP += Time.deltaTime * recoverRateHP;
                if (PlayerHP >= MaxHP)
                {
                    isRecover = false;
                }
            }
        }
    }

    public bool DecreaseHP(float damage)
    {
        float previousHP = PlayerHP;

        playerHP = playerHP - damage > 0 ? playerHP - damage : 0;

        onHPEvent.Invoke(previousHP, playerHP);

        if(playerHP == 0)
        {
            return true;
        }

        return false;
    }
}
