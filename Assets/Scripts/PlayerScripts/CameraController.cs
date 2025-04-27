using UnityEngine;

public class CameraController : MonoBehaviour
{
    [SerializeField]
    private Transform target;   // ī�޶� �Ѿƴٴϴ� ���

    private float distance;     // ��ǥ���� �Ÿ�

    private float xAxisSpeed = 400.0f;  // x�� ȸ�� �ӵ�
    private float yAxisSpeed = 1000.0f; // y�� ȸ�� �ӵ�
    private float xAxisLimitMin = 5.0f; // ȸ�� ������ x�� �ּ� ����
    private float xAxisLimitMax = 20.0f;// ȸ�� ������ x�� �ִ� ����
    private float x, y;

    private float distanceMin = 2.0f;   // target�� ī�޶��� �ּ� �Ÿ�
    private float distanceMax = 50.0f;  // target�� ī�޶��� �ִ� �Ÿ�
    private float wheelSpeed = 1000.0f; // ī�޶��� zoom �ӵ�

    private void Awake()
    {
        distance = Vector3.Distance(transform.position, target.position);

        Vector3 angles = transform.eulerAngles;
        x = angles.x;
        y = angles.y;
    }

    private void Update()
    {
        if(!GameManager.instance.isGameOver)
            UpdateRotate();
    }

    private void LateUpdate()
    {
        // �Ѿƴٴ� ����� ������ return
        if(!target) return;

        // ī�޶��� ��ġ = �÷��̾��� ��ġ���� ī�޶��� ���� ������ �������� �ڷ� distance��ŭ ������ �Ÿ�
        transform.position = target.position + transform.rotation * Vector3.back * distance;
    }

    void UpdateRotate()
    {
        // ���콺�� y�� ��ġ ��ȭ�� �������� ī�޶��� x�� ȸ�� �� ����
        x -= Input.GetAxisRaw("Mouse Y") * xAxisSpeed * Time.deltaTime;
        // ���콺�� x�� ��ġ ��ȭ�� �������� ī�޶��� y�� ȸ�� �� ����
        y += Input.GetAxisRaw("Mouse X") * yAxisSpeed * Time.deltaTime;

        // ī�޶��� x�� ȸ���� min ~ max ���̷θ� �����ϵ��� ����
        x = ClampAngle(x, xAxisLimitMin, xAxisLimitMax);

        transform.rotation = Quaternion.Euler(x, y, 0);
    }

    private float ClampAngle(float angle, float min, float max)
    {
        if (angle < -360) angle += 360;
        if (angle > 360) angle -= 360;

        return Mathf.Clamp(angle, min, max);
    }

    void UpdateZoom()
    {
        // ���콺 ��ũ�� �� ȸ������ target�� ī�޶��� �Ÿ�(distance) ����
        distance -= Input.GetAxisRaw("Mouse ScrollWheel") * wheelSpeed * Time.deltaTime;
        // distanceMin <= distance <= distanceMax
        distance = Mathf.Clamp(distance, distanceMin, distanceMax);
    }
}
