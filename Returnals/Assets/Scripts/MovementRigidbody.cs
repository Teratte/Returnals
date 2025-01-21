using UnityEngine;

public class MovementRigidbody : MonoBehaviour
{
    private Rigidbody rbody;

    [SerializeField]
    private float moveSpeed = 5.0f;

    private void Awake()
    {
        rbody = GetComponent<Rigidbody>();
    }

    private void Update()
    {
        // ��, �� �Է�
        float AxisH = Input.GetAxisRaw("Horizontal");

        // ��, �� �Է�
        float AxisV = Input.GetAxisRaw("Vertical");

        // �ӷ� = �̵� ���� * �̵� �ӵ�
        rbody.velocity = new Vector3(AxisH, rbody.velocity.y, AxisV) * moveSpeed;
    }

    private void OnCollisionEnter(Collision collision)
    {
        Debug.Log($"{collision.gameObject.name} ������Ʈ�� �浹");
    }
}
