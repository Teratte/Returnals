using System.Collections;
using UnityEngine;

public class Crowbar : WeaponBase
{
    [SerializeField]
    private AudioClip fireClip;

    private void Awake()
    {
        base.Setup();
    }

    public override void StartWeaponAction(int type = 0)
    {
        if (type == 0)
        {
            if (weaponSetting.isAutomaticAttack == true)
            {
                StartCoroutine("OnAttackLoop");
            }
            else
            {
                OnAttack();
            }
        }
    }

    public override void StopWeaponAction(int type = 0)
    {
        if (type == 0)
        {
            StopCoroutine("OnAttackLoop");
        }
    }

    private void OnAttack()
    {
        if (Time.time >= lastAttackTime + weaponSetting.fireRate)
        {
            // 발사 사운드 재생
            PlaySound(fireClip);
        }
    }

    private IEnumerator OnAttackLoop()
    {
        while (true)
        {
            OnAttack();

            yield return null;
        }
    }

    public override void StartReload()
    {
    }
}
