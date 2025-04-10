using System.Collections;
using UnityEngine;

public class Enemy : MonoBehaviour
{
    public int maxHealth;
    public int curHealth;

    Rigidbody rigid;
    CapsuleCollider capsuleCollider;
    Material mat;


    void Awake()
    {
        rigid = GetComponent<Rigidbody>();
        capsuleCollider = GetComponent<CapsuleCollider>();
        mat = GetComponent<MeshRenderer>().material;
    }

    private void OnTriggerEnter(Collider collision)
    {
        if (collision.gameObject.tag == "CrowBar")
        {
            // ���Ͱ� ũ�ο�ٿ� �¾����� ó���� �̰���
            // ����
            /*
            Weapon weapon = collision.GetComponent<Weapon>();
            curHealth -= weapon.damage;
            */
            curHealth -= 1;
            StartCoroutine(OnDamage());
        }
    }

    IEnumerator OnDamage()
    {
        mat.color = Color.red;
        yield return new WaitForSeconds(0.1f);

        if (curHealth > 0)
        {
            mat.color = Color.white;
        }
        else
        {
            mat.color = Color.gray;
            gameObject.layer = 15;
            Destroy(gameObject, 4);
        }
    }

}