using KINEMATION.FPSAnimationPack.Scripts.Player;
using System.Collections;
using UnityEngine;

public class SubMagazine : GazetBase
{
    private FPSPlayer player;
    private bool onFever = false;
    private float feverTime = 0.0f;

    private void Awake()
    {
        base.SetUp();
        player = FindAnyObjectByType<FPSPlayer>();
        canUse = true;
    }

    private void Update()
    {
        if(onFever)
        {
            player.GetActiveWeapon().OnSubMagazine = true;
            feverTime += Time.deltaTime;
            if(feverTime >= 8.0f)
            {
                onFever = false;
                feverTime = 0.0f;
            }
        }
        else
        {
            player.GetActiveWeapon().OnSubMagazine = false;
        }
    }
    public override void StartGazetAction()
    {
        if(player != null)
        {
            if (isFirstTimeUse)
            {
                isFirstTimeUse = false;
                OnSubMagazine();
            }
            else if(Time.time >= lastUseTime + Rate)
            {
                OnSubMagazine();
            }
        }
    }

    private void OnSubMagazine()
    {
        lastUseTime = Time.time;
        gazetSetting.currentAbleCount--;
        onFever = true;
    }
}
