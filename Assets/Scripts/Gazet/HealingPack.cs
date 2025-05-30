using UnityEngine;

public class HealingPack : GazetBase
{
    private void Awake()
    {
        base.SetUp();
    }

    private void Update()
    {
        if(Status.Instance.PlayerHP < Status.Instance.MaxHP)
            canUse = true;
        // Ǯ���̸鼭 ��Ÿ���� á�� ���,
        else if (Status.Instance.PlayerHP >= Status.Instance.MaxHP && Time.time >= lastUseTime + Rate)
            canUse = false;
    }

    public override void StartGazetAction()
    {
        Debug.Log("���� ��� ���� Ƚ��: " + gazetSetting.currentAbleCount);
        if (Status.Instance != null && canUse)
        {
            if(isFirstTimeUse)
            {
                UseHealingPack();
                isFirstTimeUse=false;
            }
            else if (Time.time >= lastUseTime + Rate && Status.Instance.PlayerHP < Status.Instance.MaxHP)
            {
                UseHealingPack();
            }
        }
        
    }

    private void UseHealingPack()
    {
        lastUseTime = Time.time;
        if (gazetSetting.currentAbleCount <= 0)
            return;
        Damage = Status.Instance.MaxHP * 0.3f;
        Status.Instance.PlayerHP += Damage;
        gazetSetting.currentAbleCount--;
        Debug.Log("heal");
    }
}
