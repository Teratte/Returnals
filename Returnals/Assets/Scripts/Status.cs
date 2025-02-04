using UnityEngine;

public class Status : MonoBehaviour
{
    [SerializeField]
    private float playerHP = 150.0f;     // �÷��̾� HP
    [SerializeField]
    private float recoverRate = 5.0f;    // �÷��̾� HP ȸ�� ����

    public float PlayerHP => PlayerHP;
    public float RecoverRate => RecoverRate;
}
