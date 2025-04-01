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
        if(type == 0)
        {
            if(weaponSetting.isAutomaticAttack)
            {
                StartCoroutine("OnAttackLoop");
            }
            else
            {
                OnAttack();
            }
        }
    }

    public void OnAttack()
    {
        if(Time.time >= lastAttackTime + weaponSetting.fireRate)
        {
            // ������ �� �߻� ���� ����
            lastAttackTime = Time.time;
            // �߻� ���� ���
            PlaySound(fireClip);
        }
    }

    private IEnumerator OnAttackLoop()
    {
        while(true)
        {
            OnAttack();

            yield return null;
        }
    }

    public override void StopWeaponAction(int type = 0)
    {
        if(type == 0)
        {
            StopCoroutine("OnAttackLoop");
        }
    }

    public override void StartReload()
    {
    }
}
