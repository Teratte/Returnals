using UnityEngine;

[System.Serializable]
public class HPEvent : UnityEngine.Events.UnityEvent<float, float> { }
public class Status : MonoBehaviour
{
    [HideInInspector]
    public HPEvent onHPEvent = new HPEvent();

    [SerializeField]
    private float playerHP = 150.0f;     // 플레이어 HP
    [SerializeField]
    private float maxHP = 150.0f;        // 플레이어 최대 HP
    [SerializeField]
    private float playerStamina = 50.0f;// 플레이어 스태미나
    [SerializeField]
    private float maxStamina = 50.0f;   // 플레이어 최대 스태미나
    [SerializeField]
    private float recoverRateHP = 5.0f;    // 플레이어 HP 회복 비율
    [SerializeField]
    private float recoverRateStamina = 5.0f; // 플레이어 스태미나 회복 비율
    [SerializeField]
    private float walkSpeed = 2.0f;      // 걷는 속도
    [SerializeField]
    private float runSpeed = 5.0f;       // 뛰는 속도
    [SerializeField]
    private float moveSpeed = 4.0f;      // 움직이는 속도
    [SerializeField]
    private float defense = 50.0f;         // 방어력
    [SerializeField]
    private float recoverAbleTime = 3.0f;   // 회복가능 시간

    public bool OnAdrenaline = false;

    public bool isNotAttack = true;    // 공격 받는 중이 아닌 경우
    float notAttackTime = 0.0f; // 공격 받지 않는 시간
    bool isRecover = false;     // HP 회복 중인 경우

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
            // 공격 받는 중이 아니며 최대 체력이 아니면 공격 받지 않는 시간 계산
            if (isNotAttack && PlayerHP < MaxHP)
            {
                isRecover = false;
                notAttackTime += Time.deltaTime;
            }

            // 공격 받지 않는 시간이 자동 재생 시간 후라면 회복
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
