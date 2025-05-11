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
    public float moveSpeed = 3.5f; // 이동 속도
    public float rotationSpeed = 5f; // 회전 속도
    public float attackRange = 1f; // 공격 범위
    public float detectionRange = 10f; // 탐지 범위 (플레이어를 감지하는 범위, 정면 인식 각도와 함께 사용됨)
    public float defense = 1.5f; // 방어력
    public float monsterDamage = 40.0f; // 몬스터 공격력
    public float attackDelay = 1.5f; // 공격 후 딜레이 (한번 공격 후 딜레이[경직]상태)

    [Header("공격 타입")]
    public EnemyAttackType enemyAttackType = EnemyAttackType.Melee;

    [Header("애니메이션")]
    public AnimationClip idleAnimation; // 대기 애니메이션
    public AnimationClip patrolAnimation;   // 순찰 애니메이션   
    public AnimationClip chaseAnimation;    // 추적 애니메이션
    public AnimationClip attackAnimation;   // 공격 애니메이션
    public AnimationClip dieAnimation;  //  사망 애니메이션

    [Header("몬스터 정면 시야 각도")][Tooltip("몬스터의 인식범위(시야각을 설정)")]
    public float detectionAngle = 90f; // 정면 인식 각도

    [Header("몬스터 무기")][Tooltip("몬스터의 무기를 등록")] 
    public BoxCollider weaponCollider; // 몬스터의 무기 콜라이더

    [Header("아이템 리스트")][Tooltip("몬스터 아이템 드랍")]
    public List<Item> itemList; // 드롭할 아이템 리스트
    public Item monsterIngredient; // 드롭할 몬스터 재료
    public float DropPercent;      // 드롭 확률
}
