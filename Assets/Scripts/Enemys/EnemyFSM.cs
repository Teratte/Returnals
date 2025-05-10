using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class EnemyFSM : MonoBehaviour, IDamageable
{
    [Header("몬스터 데이터")]
    [SerializeField] private EnemyData enemyData;

    private EnemyState currentState; // 현재 상태

    public float MonsterDamage => enemyData.monsterDamage; // 몬스터 공격력
    private float curHealth; // 현재 체력
    private bool isPostDelay = false; // 공격 후 딜레이 유무

    private NavMeshAgent nav;
    private Animator anim;
    private Rigidbody rigid;
    private CapsuleCollider capsuleCollider;


    // Start is called once before the first execution of Update after the MonoBehaviour is created

    private void Awake()
    {
        curHealth = enemyData.maxHealth; // 최대 체력으로 초기화
        nav = GetComponent<NavMeshAgent>();
        anim = GetComponent<Animator>();
        rigid = GetComponent<Rigidbody>();
        capsuleCollider = GetComponent<CapsuleCollider>();

        nav.speed = enemyData.moveSpeed; // 이동 속도
        nav.angularSpeed = enemyData.rotationSpeed * 100f; // 회전속도
        nav.acceleration = 8f; // 가속도
        nav.updateRotation = true; // 회전 업데이트(자동 회전)
        nav.obstacleAvoidanceType = ObstacleAvoidanceType.HighQualityObstacleAvoidance; // 장애물 회피 타입 설정(고품질 회피 사용)
        nav.avoidancePriority = Random.Range(30, 70); // 장애물 회피 우선순위 설정(랜덤값으로 설정), 낮을 수록 우선순위가 높음, 여러 AI가 몰릴 때 충돌 방지
    }
    private void Start()
    {
        currentState = EnemyState.Idle; // 상태 초기화
    }

    // Update is called once per frame
    private void Update()
    {

    }

    private void FixedUpdate()
    { 
    }

    private void LateUpdate()
    {
        
    }



    public void OnDamage(float damage)
    {
        if (currentState == EnemyState.Die) return;

        float damageRange = 100 / (100 + enemyData.defense);
        Debug.Log("Damage! : " + damage);
        curHealth -= (damage * damageRange); // 방어력에 따른 데미지 계산

        if (curHealth <= 0)
        {
            Die();

        }
    }
    void Idle()
    {
        // 대기 상태 처리
    }
    void Patrol()
    {
        // 순찰 상태 처리
    }
    void Chase()
    {
        // 추격 상태 처리
    }
    void Attack()
    {
        switch(enemyData.enemyAttackType)
        {
            case EnemyAttackType.Melee:
                // 근접 공격 처리
                break;
            case EnemyAttackType.Ranged:
                // 원거리 공격 처리
                break;
            case EnemyAttackType.Bomb:
                // 자폭 공격 처리
                break;
        }
    }

    void Die()
    {
        // 사망 처리
    }
    public enum EnemyState
    {
        Idle,
        Patrol,
        Chase,
        Attack,
        Die,
    }

    // 몬스터 공격 타입
    public enum EnemyAttackType
    {
        Melee,
        Ranged,
        Bomb,
    }
}
