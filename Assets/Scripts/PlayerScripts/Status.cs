using UnityEngine;

public class Status : MonoBehaviour
{
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

    bool isNotAttack = true;    // 공격 시점이 아닌 경우
    float notAttackTime = 0.0f; // 공격 중인 시간이 아닌 경우
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
    public float RecoverRateHP => recoverRateHP;
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
        if (isNotAttack && PlayerHP < MaxHP)
        {
            notAttackTime += Time.deltaTime;
        }

        if (notAttackTime >= recoverAbleTime)
        {
            notAttackTime = 0.0f;
            isRecover = true;
        }

        if (isRecover && PlayerHP < MaxHP)
        {
            PlayerHP += Time.deltaTime * 1.0f;
            if (PlayerHP >= MaxHP)
            {
                isRecover = false;
            }
        }
    }
}
