using UnityEngine;

public class HealingPack : GazetBase
{
    private Status status;

    private void Awake()
    {
        base.SetUp();
    }
    public override void StartGazetAction()
    {
        status = FindAnyObjectByType<Status>();
        if (status != null )
        {
            if (Time.time >= lastUseTime + Rate && CurrentAbleCount > 0 && status.PlayerHP < status.MaxHP)
            {
                status.PlayerHP += Damage;
                lastUseTime = Time.time;
                gazetSetting.currentAbleCount--;
                Debug.Log("heal");
            }
        }
        else
        {
            Debug.Log("Not");
        }
    }
}
