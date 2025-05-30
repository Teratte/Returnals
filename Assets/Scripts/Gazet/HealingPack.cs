using UnityEngine;

public class HealingPack : GazetBase
{
    //private Status status;

    private void Awake()
    {
        base.SetUp();
        //status = FindAnyObjectByType<Status>();
    }

    private void Update()
    {
        if(Status.Instance.PlayerHP < Status.Instance.MaxHP)
            canUse = true;
        else
            canUse = false;
    }

    public override void StartGazetAction()
    {
        Debug.Log("°¡Á¬ »ç¿ë °¡´É È½¼ö: " + gazetSetting.currentAbleCount);
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
