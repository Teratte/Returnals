using GLTF.Schema;
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

    private string currentPlayingAnimation = string.Empty; // 현재 재생중인 애니메이션 이름


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
        
        if (enemyData.weaponCollider != null) // 무기 콜라이더가 있다면 비활성화 (비벼져서 데미지 받는걸 방지)
            enemyData.weaponCollider.enabled = false;
    }

    // Update is called once per frame
    private void Update()
    {
        if (currentState == EnemyState.None) return; // 상태 없으면 애니메이션 재생x, 자원 낭비 방지

        StateUpdate(); // 상태 업데이트
    }

    private void FixedUpdate()
    { 
    }

    private void LateUpdate()
    {
        if(currentState == EnemyState.None) return; // 상태 없으면 애니메이션 재생x, 자원 낭비 방지
        UpdateAnimation(); // 애니메이션 업데이트
    }

    private void StateUpdate()
    {
        switch (currentState)
        {
            case EnemyState.Idle:
                Idle();
                break;
            case EnemyState.Patrol:
                Patrol();
                break;
            case EnemyState.Chase:
                Chase();
                break;
            case EnemyState.Attack:
                Attack();
                break;
            case EnemyState.Die:
                Die();
                break;
        }
    }

    public void OnDamage(float damage)
    {
        if (currentState == EnemyState.Die) return;

        float damageRange = 100 / (100 + enemyData.defense);
        Debug.Log("Damage! : " + damage);
        curHealth -= (damage * damageRange); // 방어력에 따른 데미지 계산

        if (curHealth <= 0)
        {
            currentState = EnemyState.Die; // 사망 상태로 전환
        }
    }

    void Idle()
    {
        // 대기 상태 처리
        /*
         [대기 방법]
         대기 상태에서 2~3초 대기 후 현재 상태를 Patrol 상태로 전환 [else]
         대기 중에 플레이어가 감지되면 현재상태를 Chase 상태로 전환
         플레이어가 감지되는 조건 : 정면시야각도 및 탐지범위 내에서 플레이어가 감지되면 Chase 상태로 전환
         만약 이때 공격 사거리 안에 들어와 있으면 Attack 상태로 전환
         몬스터가 감지하는 범위 밖에서 플레이어가 먼저 공격하여 피격된 경우, 몬스터가 맞은 부위에 따라 그 방향으로 회전 및 이동
         */

    }
    void Patrol()
    {
        // 순찰 상태 처리
        /*
         [순찰 방법]
         임의 위치 순찰하는 방식
         임의 위치로 2~3초 이동 후 Idle 상태로 전환
         순찰 중 플레이어가 감지되면 현재 상태를 Chase 상태로 전환
         플레이어가 감지되는 조건 : 정면시야각도 및 탐지범위 내에서 플레이어가 감지되면 Chase 상태로 전환
         만약 이때 공격 사거리 안에 들어와 있으면 Attack 상태로 전환
         몬스터가 감지하는 범위 밖에서 플레이어가 먼저 공격하여 피격된 경우, 몬스터가 맞은 부위에 따라 그 방향으로 회전 및 3초 이동
         */
    }
    void Chase()
    {
        // 추격 상태 처리
        /*
         [추격 방법]
         플레이어를 추격, 이때 이동 속도 증가(추격 속도)
         만약 이때 공격 사거리 안에 들어와 있으면 Attack 상태로 전환
         몬스터가 감지하는 범위(정면 시야 각 및 탐지 범위)를 플레이어가 벗어나면 Idle 상태로 전환
         */
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

    private void DropItem()
    {
        float percent = Random.Range(0, 100);
        if (percent >= 100 - enemyData.DropPercent)
        {
            int itemIndex = Random.Range(0, enemyData.itemList.Count);
            Instantiate(enemyData.itemList[itemIndex].itemPrefab, transform.position, Quaternion.identity);
        }
    }

    // 사망 처리
    void Die()
    {
        gameObject.layer = 15;  // 죽은 오브젝트 레이어

        nav.enabled = false;
        capsuleCollider.enabled = false;
        rigid.isKinematic = true;

        StartCoroutine(DieRoutine());
    }
    IEnumerator DieRoutine()
    {
        yield return new WaitForSeconds(3f);
        Destroy(gameObject);
        DropItem();
    }

    private void PlayAnimation(AnimationClip _clip, float _blendTime = 0.1f)
    {
        if (currentPlayingAnimation == _clip.name) return;  // 중복 재생 방지

        anim.CrossFade(_clip.name, _blendTime);             // 애니메이션 재생
        currentPlayingAnimation = _clip.name;               // 현재 재생중인 애니메이션 이름 저장
    }

    private void UpdateAnimation()
    {
        switch (currentState)
        {
            case EnemyState.Idle:
                PlayAnimation(enemyData.idleAnimation);   // Idle 애니메이션 재생
                break;
            case EnemyState.Patrol:
                PlayAnimation(enemyData.patrolAnimation); // Patrol 애니메이션 재생
                break;
            case EnemyState.Chase:
                PlayAnimation(enemyData.chaseAnimation);   // Chase 애니메이션 재생
                break;
            case EnemyState.Attack:
                PlayAnimation(enemyData.attackAnimation); // Attack 애니메이션 재생
                break;
            case EnemyState.Die:
                PlayAnimation(enemyData.dieAnimation);    // Die 애니메이션 재생
                currentState = EnemyState.None;           // 사망 애니메이션 재생 후 State를 None으로
                break;
        }
    }

    public enum EnemyState
    {
        None = -1,
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
