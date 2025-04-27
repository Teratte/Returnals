using UnityEngine;

public class HealingPack : GazetBase
{
    private Status status;

    private void Awake()
    {
        base.SetUp();
        status = FindAnyObjectByType<Status>();
    }

    private void Update()
    {
        if(status.PlayerHP < status.MaxHP)
            canUse = true;
        else
            canUse = false;
    }

    public override void StartGazetAction()
    {
        Debug.Log("°¡Á¬ »ç¿ë °¡´É È½¼ö: " + gazetSetting.currentAbleCount);
        if (status != null)
        {
            if(isFirstTimeUse)
            {
                UseHealingPack();
                isFirstTimeUse=false;
            }
            else if (Time.time >= lastUseTime + Rate && status.PlayerHP < status.MaxHP)
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
        Damage = status.MaxHP * 0.3f;
        status.PlayerHP += Damage;
        gazetSetting.currentAbleCount--;
        Debug.Log("heal");
    }
}
