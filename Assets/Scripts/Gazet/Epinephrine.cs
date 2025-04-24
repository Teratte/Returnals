using System.Collections;
using UnityEngine;

public class Epinephrine : GazetBase
{
    private Status status;  // �÷��̾� �������ͽ�

    private void Awake()
    {
        base.SetUp();
        status = FindAnyObjectByType<Status>();
        canUse = true;
    }
    public override void StartGazetAction()
    {
        if (status != null)
        {
            StartCoroutine(Adrenaline());
        }
    }

    private IEnumerator Adrenaline()
    {
        // 5�ʵ��� �ȴ� �ӵ�, �ٴ� �ӵ� 120%, ���¹̳� ����X
        gazetSetting.currentAbleCount--;
        float currentWalkSpeed = status.WalkSpeed;
        float currentRunSpeed = status.RunSpeed;

        status.WalkSpeed = currentWalkSpeed * 1.2f;
        status.RunSpeed = currentRunSpeed * 1.2f;
        status.OnAdrenaline = true;
        Debug.Log("���� �� : " + status.MoveSpeed);
        Debug.Log("���� �� : " + status.RunSpeed);
        yield return new WaitForSeconds(5.0f);

        status.WalkSpeed = currentWalkSpeed;
        status.RunSpeed = currentRunSpeed;
        status.OnAdrenaline= false;
        Debug.Log("���� �� : " + status.MoveSpeed);
        Debug.Log("���� �� : " + status.RunSpeed);
    }
}
