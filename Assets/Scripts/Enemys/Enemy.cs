using System.Collections;
using UnityEngine;

public class Enemy : MonoBehaviour, IDamageable
{
    public int maxHealth;
    public int curHealth;

    Rigidbody rigid;
    CapsuleCollider capsuleCollider;

    void Awake()
    {
        rigid = GetComponent<Rigidbody>();
        capsuleCollider = GetComponent<CapsuleCollider>();
    }

    public void OnDamage(float damage)
    {
        Debug.Log("데미지 입음! : " + damage);
        curHealth -= (int)damage;

        if(curHealth <= 0)
        {
            // 죽는 애니메이션 재생
            // Destroy(gameObject);
        }
    }
}