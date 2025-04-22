using UnityEngine;

public class HealingPack : GazetBase
{
    private Status status;
    public override void StartGazetAction()
    {
        status = FindAnyObjectByType<Status>();
        if(status != null )
        {
            if (Time.time >= lastUseTime + Rate && AbleCount > 0 && status.PlayerHP < status.MaxHP)
            {
                status.PlayerHP += Damage;
                lastUseTime = Time.time;
                AbleCount--;
                Debug.Log("heal");
            }
        }
        else
        {
            Debug.Log("Not");
        }
    }
}
