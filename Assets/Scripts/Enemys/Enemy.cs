using System.Collections;
using Unity.VisualScripting.Antlr3.Runtime;
using UnityEngine;
using UnityEngine.AI;

public class Enemy : MonoBehaviour, IDamageable
{
    [SerializeField] private int maxHealth = 100;
    private int curHealth;

    [SerializeField] private float moveSpeed = 3.5f;
    [SerializeField] private float rotationSpeed = 5f;

    public Transform Target;
    private bool isChase;

    private NavMeshAgent nav;
    private Animator anim;
    private Rigidbody rigid;
    private CapsuleCollider capsuleCollider;

    void Awake()
    {
        curHealth = maxHealth;

        rigid = GetComponent<Rigidbody>();
        capsuleCollider = GetComponent<CapsuleCollider>();
        anim = GetComponent<Animator>();
        nav = GetComponent<NavMeshAgent>();

        nav.speed = moveSpeed;
        nav.angularSpeed = rotationSpeed * 100f; // NavMesh는 angularSpeed를 degree/second 기준으로 받음
        nav.acceleration = 8f;

        Invoke("ChaseStart", 2f);
    }

    void ChaseStart()
    {
        isChase = true;
        anim.SetBool("isRun", true);
    }

    void FreezeVelocity()
    {
        if (isChase)
        {
            rigid.linearVelocity = Vector3.zero;
            rigid.angularVelocity = Vector3.zero;
        }
    }

    void FixedUpdate()
    {
        FreezeVelocity();
    }

    void Update()
    {

        if(nav.enabled)
        { 
        }
        if (!isChase || Target == null) return;

        if(nav.enabled)
        {
            nav.SetDestination(Target.position);
            nav.isStopped = !isChase;
        }

        // 회전 보간 처리 (자연스러운 회전)
        Vector3 direction = (Target.position - transform.position).normalized;
        direction.y = 0f;

        if (direction.magnitude > 0.1f)
        {
            Quaternion toRotation = Quaternion.LookRotation(direction);
            transform.rotation = Quaternion.Slerp(transform.rotation, toRotation, Time.deltaTime * rotationSpeed);
        }
    }

    public void OnDamage(float damage)
    {
        Debug.Log("Damage! : " + damage);
        curHealth -= (int)damage;

        if (curHealth <= 0)
        {
            gameObject.layer = 15;
            isChase = false;
            nav.enabled = false;
            capsuleCollider.enabled = false;
            rigid.isKinematic = true;

            anim.SetTrigger("doDie");

            StartCoroutine(DieRoutine());

            // 물리 충돌 해제 -> 혹시나 필요하면
            /*
            capsuleCollider.enabled = false;
            rigid.isKinematic = true;
            */
        }
    }

    IEnumerator DieRoutine()
    {
        yield return new WaitForSeconds(3f);
        Destroy(gameObject);
    }    
}
