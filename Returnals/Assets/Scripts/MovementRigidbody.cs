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
        // 좌, 우 입력
        float AxisH = Input.GetAxisRaw("Horizontal");

        // 상, 하 입력
        float AxisV = Input.GetAxisRaw("Vertical");

        // 속력 = 이동 방향 * 이동 속도
        rbody.velocity = new Vector3(AxisH, rbody.velocity.y, AxisV) * moveSpeed;
    }

    private void OnCollisionEnter(Collision collision)
    {
        Debug.Log($"{collision.gameObject.name} 오브젝트와 충돌");
    }
}
