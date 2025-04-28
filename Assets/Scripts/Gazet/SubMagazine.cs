using System.Collections;
using UnityEngine;

public class SubMagazine : GazetBase
{
    private PlayerAnimator playerAnimator;
    private bool onFever = false;
    private float feverTime = 0.0f;

    private void Awake()
    {
        base.SetUp();
        playerAnimator = FindAnyObjectByType<PlayerAnimator>();
        canUse = true;
    }

    private void Update()
    {
        if(onFever)
        {
            playerAnimator.Weapon.onSubMagazine = true;
            feverTime += Time.deltaTime;
            if(feverTime >= 8.0f)
            {
                onFever = false;
                feverTime = 0.0f;
            }
        }
        else
        {
            playerAnimator.Weapon.onSubMagazine = false;
        }
    }
    public override void StartGazetAction()
    {
        if(playerAnimator != null)
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
