using System.Collections;
using UnityEngine;
using UnityEngine.AI;

public class Enemy : MonoBehaviour, IDamageable
{
    public enum EnemyState
    {
        Idle,     // 대기 상태
        Chase,    // 추격 상태
        Attack,   // 공격 상태
        Die       // 사망 상태
    }

    [Header("Status")]
    [Tooltip("몬스터 스테이터스를 설정")]
    [SerializeField] private int maxHealth = 100;
    [SerializeField] private float moveSpeed = 3.5f;
    [SerializeField] private float rotationSpeed = 5f;
    [SerializeField] private float attackRange = 1f;
    [SerializeField] private float attackDelay = 1.5f;
    [SerializeField] private float defense = 1.5f;
    [SerializeField] private float monsterDamage = 40.0f;
    private int curHealth;

    public float MonsterDamage => monsterDamage;

    [Header("Detection")]
    [SerializeField] private float detectionAngle = 90f; // 정면 인식 각도

    [Header("Weapon")]
    [SerializeField] private BoxCollider weaponCollider;

    private Transform target;
    private EnemyState currentState;  // 현재 상태

    private NavMeshAgent nav;
    private Animator anim;
    private Rigidbody rigid;
    private CapsuleCollider capsuleCollider;

    private float lastAttackTime;


    void Awake()
    {
        curHealth = maxHealth;

        rigid = GetComponent<Rigidbody>();
        capsuleCollider = GetComponent<CapsuleCollider>();
        anim = GetComponent<Animator>();
        nav = GetComponent<NavMeshAgent>();

        rigid.isKinematic = true;                 // NavMeshAgent용 Rigidbody
        capsuleCollider.isTrigger = false;         // 충돌 O

        nav.speed = moveSpeed;
        nav.angularSpeed = rotationSpeed * 100f;
        nav.acceleration = 8f;
        nav.updateRotation = true;
        nav.obstacleAvoidanceType = ObstacleAvoidanceType.HighQualityObstacleAvoidance;
        nav.avoidancePriority = Random.Range(30, 70);

        GameObject player = GameObject.FindGameObjectWithTag("Player");
        if (player != null)
            target = player.transform;

        if (weaponCollider != null)
            weaponCollider.enabled = false;

        currentState = EnemyState.Idle;  // 기본 상태는 Idle
        Invoke("ChaseStart", 2f);
    }

    void ChaseStart()
    {
        if (currentState == EnemyState.Die) return;
        currentState = EnemyState.Chase;
    }

 
    void FreezeVelocity()
    {
        if (currentState == EnemyState.Die) return;

        if (currentState == EnemyState.Chase && currentState != EnemyState.Attack)
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
        if (currentState == EnemyState.Die || target == null || nav == null) return;

        float distance = Vector3.Distance(transform.position, target.position);
        Vector3 dirToTarget = (target.position - transform.position).normalized;
        float angle = Vector3.Angle(transform.forward, dirToTarget);

        if (currentState == EnemyState.Chase)
        {
            if (distance <= attackRange && angle <= detectionAngle * 0.5f)
            {
                StartAttack();
                Debug.Log("Chase Start!");
            }
            else if (distance > attackRange || angle > detectionAngle * 0.5f)
            {
                nav.SetDestination(target.position);
            }
        }

        if (currentState == EnemyState.Attack && Time.time >= lastAttackTime + attackDelay)
        {
            Attack();
        }
    }

    void StartAttack()
    {
        if (currentState == EnemyState.Die) return;

        currentState = EnemyState.Attack;
        nav.isStopped = true;

        lastAttackTime = Time.time;

        if (weaponCollider != null)
        {
            weaponCollider.enabled = true;
            weaponCollider.GetComponent<EnemyAttack>().ResetHit(); // ⭐ 여기 필수!
        }
    }

    private void Attack()
    {
        if (currentState == EnemyState.Die) return;
        EndAttack();
    }

    void EndAttack()
    {
        if (weaponCollider != null)
            weaponCollider.enabled = false;

        if (currentState == EnemyState.Die) return;

        currentState = EnemyState.Chase;  // 공격이 끝나면 추격 상태로

        float distance = Vector3.Distance(transform.position, target.position);
        Vector3 dirToTarget = (target.position - transform.position).normalized;
        float angle = Vector3.Angle(transform.forward, dirToTarget);

        if (distance > attackRange || angle > detectionAngle * 0.5f)
        {
            currentState = EnemyState.Chase;  // 범위 벗어나면 추격 상태로 돌아감
            nav.isStopped = false;
        }
        else
        {
            StartAttack(); // 계속 공격 상태로 유지
        }
    }

    public void OnDamage(float damage)
    {
        if (currentState == EnemyState.Die) return;

        Debug.Log("Damage! : " + damage);
        curHealth -= (int)damage;

        if (curHealth <= 0)
        {
            Die();
        }
    }

    void Die()
    {
        if (currentState == EnemyState.Die) return;

        currentState = EnemyState.Die;
        gameObject.layer = 15;  // 죽은 오브젝트 레이어

        nav.enabled = false;
        capsuleCollider.enabled = false;
        rigid.isKinematic = true;

        if (weaponCollider != null)
            weaponCollider.enabled = false;

        StartCoroutine(DieRoutine());
    }

    IEnumerator DieRoutine()
    {
        yield return new WaitForSeconds(3f);
        Destroy(gameObject);
    }

    // 애니메이션 처리 (LateUpdate에서 호출)
    void LateUpdate()
    {
        

        switch (currentState)
        {
            case EnemyState.Chase:
                anim.SetBool("isRun", true);
                anim.SetBool("isAttack", false);
                break;

            case EnemyState.Attack:
                anim.SetBool("isRun", false);
                anim.SetBool("isAttack", true);
                if (weaponCollider != null)
                    weaponCollider.enabled = true;
                break;

            case EnemyState.Idle:
                anim.SetBool("isRun", false);
                anim.SetBool("isAttack", false);
                break;
            case EnemyState.Die:
                anim.SetBool("isRun", false);
                anim.SetBool("isAttack", false);
                anim.SetTrigger("doDie");
                Die();
                break;
        }
    }
}
