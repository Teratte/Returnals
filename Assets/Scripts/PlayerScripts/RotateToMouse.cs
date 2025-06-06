using UnityEngine;

public class RotateToMouse : MonoBehaviour
{
    [SerializeField]
    private float rotCamXAxisSpeed = 5; // 카메라 x축 회전속도
    [SerializeField]
    private float rotCamYAxisSpeed = 3; // 카메라 y축 회전속도

    private float limitMinX = -80;  // 카메라 x축 회전 범위 (최소)
    private float limitMaxX = 50;   // 카메라 x축 회전 범위 (최대)
    private float eulerAngleX;
    private float eulerAngleY;

    public void UpdateRotate(float mouseX, float mouseY)
    {
        if (GameManager.instance.isUIOn || GameManager.instance.isGameOver)
            return;

        eulerAngleY += mouseX * rotCamYAxisSpeed; // 마우스 좌/우 이동으로 카메라 y축 회전
        eulerAngleX -= mouseY * rotCamXAxisSpeed; // 마우스 위/아래 이도으로 카메라 x축 회전

        // 카메라 x축 회전의 경우 회전 범위를 설정
        eulerAngleX = ClampAngle(eulerAngleX, limitMinX, limitMaxX);

        if(!GameManager.instance.isUIOn)
            transform.rotation = Quaternion.Euler(eulerAngleX, eulerAngleY, 0);
    }

    private float ClampAngle(float angle, float min, float max)
    {
        if (angle < -360) angle += 360;
        if (angle > 360) angle -= 360;

        return Mathf.Clamp(angle, min, max);
    }
}