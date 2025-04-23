using UnityEngine;

public class HealingPack : GazetBase
{
    private void Awake()
    {
        base.SetUp();
    }

    public override void StartGazetAction()
    {
        Debug.Log("°¡Á¬ »ç¿ë °¡´É È½¼ö: " + gazetSetting.currentAbleCount);
        if (Time.time >= lastUseTime + Rate)
        {
            lastUseTime = Time.time;
            if (gazetSetting.currentAbleCount <= 0)
                return;
            gazetSetting.currentAbleCount--;
            Debug.Log("heal");
        }
    }
}
