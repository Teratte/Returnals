using UnityEngine;

public class Status : MonoBehaviour
{
    [SerializeField]
    private float playerHP = 150.0f;     // 플레이어 HP
    [SerializeField]
    private float recoverRate = 5.0f;    // 플레이어 HP 회복 비율
    [SerializeField]
    private float walkSpeed = 2.0f;
    [SerializeField]
    private float runSpeed = 5.0f;
    [SerializeField]
    private float moveSpeed = 4.0f;

    public float PlayerHP => PlayerHP;
    public float RecoverRate => RecoverRate;
    public float WalkSpeed => walkSpeed;
    public float RunSpeed => runSpeed;
    public float MoveSpeed
    {
        set => moveSpeed = value;
        get => moveSpeed;
    }
}
