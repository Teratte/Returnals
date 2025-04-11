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
        Debug.Log("������ ����! : " + damage);
        curHealth -= (int)damage;

        if(curHealth <= 0)
        {
            // �״� �ִϸ��̼� ���
            // Destroy(gameObject);
        }
    }
}