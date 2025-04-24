using System.Collections;
using UnityEngine;

public class Epinephrine : GazetBase
{
    private Status status;  // 플레이어 스테이터스

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
        // 5초동안 걷는 속도, 뛰는 속도 120%, 스태미나 감소X
        gazetSetting.currentAbleCount--;
        float currentWalkSpeed = status.WalkSpeed;
        float currentRunSpeed = status.RunSpeed;

        status.WalkSpeed = currentWalkSpeed * 1.2f;
        status.RunSpeed = currentRunSpeed * 1.2f;
        status.OnAdrenaline = true;
        Debug.Log("변경 후 : " + status.MoveSpeed);
        Debug.Log("변경 후 : " + status.RunSpeed);
        yield return new WaitForSeconds(5.0f);

        status.WalkSpeed = currentWalkSpeed;
        status.RunSpeed = currentRunSpeed;
        status.OnAdrenaline= false;
        Debug.Log("변경 후 : " + status.MoveSpeed);
        Debug.Log("변경 후 : " + status.RunSpeed);
    }
}
