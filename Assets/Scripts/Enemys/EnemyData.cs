using System.Collections.Generic;
using UnityEngine;
using static EnemyFSM;

[CreateAssetMenu(fileName = "새 몬스터 데이터", menuName = "몬스터", order = 999)]
public class EnemyData : ScriptableObject
{
    [Header("몬스터 이름")]
    public string enemyName = "좀비";

    [Header("기본 정보")][Tooltip("몬스터 스테이터스를 설정")]
    public float maxHealth = 100f; // 최대 체력
    public float moveSpeed = 3.5f; // 평상시 이동 속도
    public float chaseSpeed = 5f; // 추격 시 속도
    public float rotationSpeed = 5f; // 회전 속도 (타겟 방향 전환 속도)
    public float attackRange = 1f; // 공격 범위 (공격 가능한 거리)
    public float defense = 1.5f; // 방어력
    public float monsterDamage = 40.0f; // 몬스터 공격력
    public float attackDelay = 1.5f; // 공격 후 경직 (한번 공격 후 딜레이[경직]상태)

    [Header("공격 타입")]
    public EnemyAttackType enemyAttackType = EnemyAttackType.Melee;

    [Header("애니메이션")]
    public AnimationClip idleAnimation; // 대기 애니메이션
    public AnimationClip patrolAnimation;   // 순찰 애니메이션
    public AnimationClip chaseAnimation;    // 추적 애니메이션
    public AnimationClip attackAnimation;   // 공격 애니메이션
    public AnimationClip dieAnimation;  //  사망 애니메이션
    public AnimationClip searchAnimation; // 탐색 애니메이션

    [Header("자폭 몬스터 전용 설정")]
    public float selfDestructDelay = 1.5f;       // 자폭 전 대기 시간
    public float selfDestructRadius = 3f;        // 자폭 범위
    public float selfDestructDamage = 80f;       // 자폭 데미지

    [Header("AI 감지 반응 설정")]
    public float detectionAngle = 90f; // 정면 인식 각도
    public float rearDetectionAngle = 180f; // 후방 시야각 (180도, 즉 후방 전역)
    public float rearDetectionRange = 5f;        // 후방 감지 가능 거리
    public float detectionRange = 10f; // 정면 기준 탐지 거리 (플레이어를 감지하는 범위, 정면 인식 각도와 함께 사용됨)

    [Header("대기 및 탐색 시간")]
    public float idleWaitTimeMin = 2f;           // 대기 상태 최소 시간
    public float idleWaitTimeMax = 3f;           // 대기 상태 최대 시간
    public float patrolTimeMin = 2f;             // 순찰 상태 최소 시간
    public float patrolTimeMax = 3f;             // 순찰 상태 최대 시간

    [Header("사운드 클립")]
    public AudioClip zombieSound;                 // 발견 시 외침
    public AudioClip attackSound;                // 공격 시 사운드
    public AudioClip dieSound;                   // 사망 사운드

    /*
    [Header("몬스터 무기")][Tooltip("몬스터의 무기를 등록")] 
    public Collider weaponCollider; // 몬스터의 무기 콜라이더
    */

    [Header("드랍 아이템 리스트")][Tooltip("몬스터 아이템 드랍")]
    public List<Item> itemList; // 드롭할 아이템 리스트
    public float DropPercent;      // 드롭 확률
}
