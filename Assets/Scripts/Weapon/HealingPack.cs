using UnityEngine;

public class HealingPack : GazetBase
{
    private Status status;
    public override void StartGazetAction()
    {
        status = FindObjectOfType<Status>();
        if(status != null )
        {
            if (Time.time >= lastUseTime + gazetSetting.rate)
            {
                status.PlayerHP += Damage;
                lastUseTime = Time.time;
                Debug.Log("heal");
            }
        }
        else
        {
            Debug.Log("Not");
        }
    }
}
