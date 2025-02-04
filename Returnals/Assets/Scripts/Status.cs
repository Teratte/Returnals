using UnityEngine;

public class Status : MonoBehaviour
{
    [SerializeField]
    private float playerHP = 150.0f;     // 플레이어 HP
    [SerializeField]
    private float recoverRate = 5.0f;    // 플레이어 HP 회복 비율

    public float PlayerHP => PlayerHP;
    public float RecoverRate => RecoverRate;
}
