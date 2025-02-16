using UnityEngine;

public class Status : MonoBehaviour
{
    [SerializeField]
    private float playerHP = 150.0f;     // 플레이어 HP
    [SerializeField]
    private float maxHP = 150.0f;        // 플레이어 최대 HP
    [SerializeField]
    private float playerStamina = 100.0f;// 플레이어 스태미나
    [SerializeField]
    private float maxStamina = 100.0f;   // 플레이어 최대 스태미나
    [SerializeField]
    private float recoverRateHP = 5.0f;    // 플레이어 HP 회복 비율
    [SerializeField]
    private float recoverRateStamina = 2.0f; // 플레이어 스태미나 회복 비율
    [SerializeField]
    private float walkSpeed = 2.0f;      // 걷는 속도
    [SerializeField]
    private float runSpeed = 5.0f;       // 뛰는 속도
    [SerializeField]
    private float moveSpeed = 4.0f;      // 움직이는 속도

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

        // 현재 스태미나가 남아있고, 이동 속도가 2보다 클 때(달릴 때)
        if(playerStamina > 0 && moveSpeed > 2.0f)
        {
            playerStamina -= Time.deltaTime * 5.0f;
        }

        playerStamina = Mathf.Clamp(playerStamina,0,maxStamina);
    }
}
