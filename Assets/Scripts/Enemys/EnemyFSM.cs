using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class EnemyFSM : MonoBehaviour, IDamageable
{
    [Header("몬스터 데이터")]
    [SerializeField] private EnemyData enemyData;

    [Header("몬스터 무기")]
    [Tooltip("몬스터의 무기를 등록")]
    public Collider weaponCollider; // 몬스터의 무기 콜라이더

    private EnemyState currentState; // 현재 상태

    public float MonsterDamage => enemyData.monsterDamage; // 몬스터 공격력
    private float curHealth; // 현재 체력
    private bool isPostDelay = false; // 공격 후 딜레이 유무
    private float idleTimer; // 대기 타이머
    private float idleWaitTime; // 대기 시간

    private float patrolTimer;  // 순찰 타이머
    private float patrolDuration;   // 순찰 시간
    private Vector3 patrolDestination; // 순찰 목적지

    private Transform player; // 플레이어 트랜스폼
    private NavMeshAgent nav;
    private Animator anim;
    private Rigidbody rigid;
    private CapsuleCollider capsuleCollider;
    private EnemyAttack enemyAttack; // 공격 스크립트

    private string currentPlayingAnimation = string.Empty; // 현재 재생중인 애니메이션 이름


    private void Awake()
    {
        curHealth = enemyData.maxHealth; // 최대 체력으로 초기화

        nav = GetComponent<NavMeshAgent>();
        anim = GetComponent<Animator>();
        rigid = GetComponent<Rigidbody>();
        capsuleCollider = GetComponent<CapsuleCollider>();

        rigid.isKinematic = true;                 // NavMeshAgent용 Rigidbody
        capsuleCollider.isTrigger = false;         // 충돌 O

        if (weaponCollider != null)
            enemyAttack = weaponCollider.GetComponent<EnemyAttack>();

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
        player = GameObject.FindWithTag("Player")?.transform;

        if (weaponCollider != null) // 무기 콜라이더가 있다면 비활성화 (비벼져서 데미지 받는걸 방지)
            weaponCollider.enabled = false;
    }

    // Update is called once per frame
    private void Update()
    {
        if (currentState == EnemyState.None) return; // 상태 없으면 애니메이션 재생x, 자원 낭비 방지

        StateUpdate(); // 상태 업데이트

        Debug.Log("Current State: " + currentState); // 현재 상태 출력
    }

    private void FixedUpdate()
    {
        FreezeVelocity(); // Rigidbody 정지 처리
    }

    private void LateUpdate()
    {
        if (currentState == EnemyState.None) return; // 상태 없으면 애니메이션 재생x, 자원 낭비 방지
        UpdateAnimation(); // 애니메이션 업데이트
    }

    void FreezeVelocity()
    {
        if (currentState == EnemyState.Die) return;

        // NavMeshAgent가 이동 중이지만, Rigidbody가 튕기는 경우 방지
        if (nav.enabled && nav.velocity.sqrMagnitude > 0.01f)
        {
            rigid.linearVelocity = Vector3.zero;
            rigid.angularVelocity = Vector3.zero;
        }
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
            case EnemyState.Search:
                Search();
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
        [대기 상태 규칙]
         - 대기 시간: 대기 중 2~3초 동안 대기 후 Patrol 상태로 전환.
         - 플레이어 감지:
             - 정면 시야각 (60° ~ 120°) 내에서 플레이어가 감지되면 Chase 상태로 전환.
             - 후면 시야각 (120° ~ 180°) 내에서 플레이어가 감지되면, 뒤로 돌아서 Chase 상태로 전환.
             - 정면 시야각 내에서 공격 사거리 내에 플레이어가 들어오면 Attack 상태로 전환.
         - 좀비가 감지 범위 밖에서 플레이어의 공격을 받으면, 공격 받은 부위에 따라 회전하며, Chase 상태로 전환하여 플레이어를 추격.
         - 공격 사거리 내 플레이어 감지:
             - 정면 시야각 내에서 공격 사거리 내에 플레이어가 들어오면 Attack 상태로 전환.
        */

    }

    void Patrol()
    {
        // 순찰 상태 처리
        /*
        [순찰 상태 규칙]
         - 임의 위치를 2~3초 동안 이동 후 Idle 상태로 전환.
         - 플레이어 감지:
             - 정면 시야각 (60° ~ 120°) 내에서 플레이어가 감지되면 Chase 상태로 전환.
             - 후면 시야각 (120° ~ 180°) 내에서 플레이어가 감지되면, 뒤로 돌아서 Chase 상태로 전환.
             - 정면 시야각 내에서 공격 사거리 내에 플레이어가 들어오면 Attack 상태로 전환.
         - 좀비가 감지 범위 밖에서 플레이어의 공격을 받으면, 공격 받은 부위에 따라 회전 후 3초 이동하며 Chase 상태로 전환.
        */

    }

    void Chase()
    {
        // 추격 상태 처리
        /*
        [추격 상태 규칙]
         - 플레이어 추격:
             - 플레이어가 정면 시야각 내에 있으면 추격을 계속한다.
             - 플레이어가 후면 시야각 내에 있으면 뒤로 돌아서 추격을 계속한다.
         - 플레이어가 공격 사거리 내에 있으면 Attack 상태로 전환.
         - 플레이어가 감지 범위 밖으로 나가면 Search 상태로 전환.
         - 플레이어가 장애물 뒤로 숨으면 Search 상태로 전환.
         - 좀비가 감지 범위 밖에서 플레이어의 공격을 받으면, 공격 받은 부위에 따라 회전 후 3초 이동하며 Chase 상태로 재개.
        */
    }

    void Search()
    {
        // 탐색 상태 처리
        /*
        [탐색 상태 규칙]
         - 플레이어의 마지막 위치를 추적하며 2~3초 동안 수색.
         - 플레이어를 찾으면 Chase 상태로 전환.
         - 플레이어를 찾지 못하면 Idle 상태로 전환.
        */

        
    }

    void Attack()
    {
        if (currentState == EnemyState.Die) return;

        // 플레이어가 공격 범위로 들어오면 swich문으로 공격 타입에 따라 공격 처리 if문 처리 필요
        switch (enemyData.enemyAttackType)
        {
            case EnemyAttackType.Melee:
                // 근접 공격 처리
                /*
                [근접 공격 규칙]
                 - 플레이어가 공격 범위 내에 들어오면 근접 공격을 실행.
                 - 공격 시 무기 콜라이더가 on되어 플레이어에게 충돌하면 데미지를 입힘
                 - 공격 후 몇 초간 경직(enemyData.attackDelay)
                 - 공격 후 만약 플레이어가 여전히 공격사거리(감지 범위, 정면 및 후면 시야각도 충족 필요) 안에 있으면 공격, 만약 이때 좀비가 바라보는 곳은 플레이어 방향으로 회전후 공격
                 - 공격 후 플레이어가 공격 사거리 밖으로 나가고 감지 범위 이내에 있으면 Chase 상태로 전환
                 - 공격 후 플레이어가 감지 범위 밖으로 나가면 Idle 상태로 전환 
                */
                
            case EnemyAttackType.Ranged:
                // 원거리 공격 처리
                /*
                    - 플레이어가 원거리 공격 범위 내에 들어오면 원거리 공격을 준비.
                    - 공격은 투사체를 던지는 원거리 공격으로 처리 (투사체는 따로 구현 할것이며, 바닥이나 플레이어에게 닿았을 때 폭발 후 범위 데미지)
                    - 공격 후 만약 플레이어가 여전히 공격사거리(감지 범위, 정면 및 후면 시야각도 충족 필요) 안에 있으면 공격, 만약 이때 좀비가 바라보는 곳은 플레이어 방향으로 회전후 공격
                    - 공격 후 플레이어가 공격 사거리 밖으로 나가고 감지 범위 이내에 있으면 Chase 상태로 전환
                    - 공격 후 플레이어가 감지 범위 밖으로 나가면 Idle 상태로 전환 
                */
                break;
            case EnemyAttackType.SelfBomb:
                // 자폭 공격 처리
                /*
                 [자폭 공격 규칙]
                  - 플레이어가 공격 범위 내에 들어오면 자폭 공격을 실행
                  - 자폭 범위 내 모든 객체(플레이어, 몬스터)에게 피해 적용 <범위 데미지>
                  - 자폭 후 적은 사망 상태로 전환
                 */
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
        // currentState가 Die가 되면 더이상 다른 State로 전환되면 안됨

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

    // 애니메이션 업데이트, 애니메이션 클립 이름으로 애니메이션 재생
    private void UpdateAnimation()
    {
        // currenState에 따라 애니메이션 재생
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
            case EnemyState.Search:
                PlayAnimation(enemyData.searchAnimation); // Search 애니메이션 재생
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
        None = -1, // 상태 없음
        Idle, // 대기 상태
        Patrol, // 순찰 상태
        Chase, // 추격 상태
        Search, // 탐색 상태
        Attack, //  공격 상태
        Die,    // 사망 상태

    }

    // 몬스터 공격 타입
    public enum EnemyAttackType
    {
        Melee,  // 근접 공격
        Ranged, // 원거리 공격
        SelfBomb,   // 자폭 공격
    }
}
