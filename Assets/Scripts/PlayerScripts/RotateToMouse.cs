using UnityEngine;

public class RotateToMouse : MonoBehaviour
{
    [SerializeField]
    private float rotCamXAxisSpeed = 5; // ī�޶� x�� ȸ���ӵ�

    private float limitMinX = -80;  // ī�޶� x�� ȸ�� ���� (�ּ�)
    private float limitMaxX = 50;   // ī�޶� x�� ȸ�� ���� (�ִ�)
    private float eulerAngleX;
    //private float eulerAngleY;

    private void Update()
    {
        float mouseY = Input.GetAxis("Mouse Y");

        UpdateRotate(mouseY);
    }

    public void UpdateRotate(float mouseY)
    {
        //eulerAngleY += mouseX * rotCamYAxisSpeed; // ���콺 ��/�� �̵����� ī�޶� y�� ȸ��
        eulerAngleX -= mouseY * rotCamXAxisSpeed; // ���콺 ��/�Ʒ� �̵����� ī�޶� x�� ȸ��

        // ī�޶� x�� ȸ���� ��� ȸ�� ������ ����
        eulerAngleX = ClampAngle(eulerAngleX, limitMinX, limitMaxX);

        transform.rotation = Quaternion.Euler(0, 0, eulerAngleX);
    }

    private float ClampAngle(float angle, float min, float max)
    {
        if (angle < -360) angle += 360;
        if (angle > 360) angle -= 360;

        return Mathf.Clamp(angle, min, max);
    }
}