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
    [SerializeField] private float maxHealth = 100f;
    [SerializeField] private float moveSpeed = 3.5f;
    [SerializeField] private float rotationSpeed = 5f;
    [SerializeField] private float attackRange = 1f;
    [SerializeField] private float attackDelay = 1.5f;  // 공격 간 딜레이
    [SerializeField] private float defense = 1.5f;
    [SerializeField] private float monsterDamage = 40.0f;
    [SerializeField] private float postAttackDelay = 0.3f; // 공격 후 딜레이
    private float curHealth;
    private bool isPostDelay = false;

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

    float distance;
    Vector3 dirToTarget;
    float angle;

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
        if (currentState == EnemyState.Die || target == null || nav == null || isPostDelay) return;

        distance = Vector3.Distance(transform.position, target.position);
        dirToTarget = (target.position - transform.position).normalized;
        angle = Vector3.Angle(transform.forward, dirToTarget);

        // ✅ 공격 중에는 아무 상태 전환도 하지 않음
        if (currentState == EnemyState.Attack)
        {
            // 공격 딜레이가 끝난 경우에만 다음 단계로 넘어감
            if (Time.time >= lastAttackTime + attackDelay)
            {
                Attack(); // 이 안에서 EndAttack 호출
            }
            return;
        }

        if (currentState == EnemyState.Chase)
        {
            if (distance <= attackRange && angle <= detectionAngle * 0.5f)
            {
                if (Time.time >= lastAttackTime + attackDelay)
                {
                    StartAttack();
                }
            }
            else
            {
                nav.SetDestination(target.position);
            }
        }
    }

    void StartAttack()
    {
        
        if (currentState == EnemyState.Die || currentState == EnemyState.Attack) return;

        currentState = EnemyState.Attack;
        nav.isStopped = true;

        lastAttackTime = Time.time;

        if (weaponCollider != null)
        {
            weaponCollider.enabled = false; // 추가
            weaponCollider.enabled = true;
            weaponCollider.GetComponent<EnemyAttack>().ResetHit();
        }
    }

    private void Attack()
    {
        if (currentState == EnemyState.Die) return;
        Debug.Log("End Attack! 전환");
        EndAttack();
    }

    void EndAttack()
    {
        if (weaponCollider != null)
            weaponCollider.enabled = false;

        if (currentState == EnemyState.Die) return;

        Debug.Log("End Attack, Waiting for next state transition");
        StartCoroutine(WaitAfterAttack());

    }
    private IEnumerator WaitAfterAttack()
    {
        isPostDelay = true;

        yield return new WaitForSeconds(postAttackDelay); // 🔸 경직 시간

        isPostDelay = false;

        // ✅ 이 시점에서만 상태를 Chase로 전환
        distance = Vector3.Distance(transform.position, target.position);
        angle = Vector3.Angle(transform.forward, dirToTarget);

        if (distance > attackRange || angle > detectionAngle * 0.5f)
        {
            currentState = EnemyState.Chase;
            nav.isStopped = false;
        }
        else
        {
            // 여전히 조건을 만족하면 다음 공격 대기
            currentState = EnemyState.Attack;
            lastAttackTime = Time.time; // 다음 공격 타이밍 초기화
        }
    }

    public void OnDamage(float damage)
    {
        if (currentState == EnemyState.Die) return;

        float damageRange = 100 / (100 + defense);
        Debug.Log("Damage! : " + damage);
        curHealth -= (damage * damageRange); // 방어력에 따른 데미지 계산

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
