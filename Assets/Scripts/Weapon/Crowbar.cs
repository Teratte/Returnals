using System.Collections;
using UnityEngine;

public class Crowbar : WeaponBase
{
    [SerializeField]
    private AudioClip fireClip;

    private SphereCollider sphereCollider;

    private void Awake()
    {
        base.Setup();
        sphereCollider = GetComponent<SphereCollider>();
        sphereCollider.enabled = false;
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
            ActiveSphereCollider();
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

    private void OnTriggerEnter(Collider other)
    {
        if(other.GetComponent<HitableObject>() != null)
        {
            other.GetComponent<HitableObject>().TakeDamage((int)(weaponSetting.damage));
        }
    }

    void ActiveSphereCollider()
    {
        StartCoroutine(ActiveCollision());
    }

    private IEnumerator ActiveCollision()
    {
        sphereCollider.enabled = true;

        yield return new WaitForSeconds(0.5f);

        sphereCollider.enabled = false;
    }
}
