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
    public float attackDelay = 1.5f;  // 공격 간 딜레이
    public float defense = 1.5f; // 방어력
    public float monsterDamage = 40.0f; // 몬스터 공격력
    public float postAttackDelay = 0.3f; // 공격 후 딜레이

    [Header("공격 타입")]
    public EnemyAttackType enemyAttackType = EnemyAttackType.Melee;

    /* 이 친구들은 FSM 소스코드로
    private float curHealth;
    private bool isPostDelay = false;
    */

    [Header("Detection")][Tooltip("몬스터의 인식범위(시야각을 설정)")]
    [SerializeField] public float detectionAngle = 90f; // 정면 인식 각도

    [Header("Weapon")][Tooltip("몬스터의 무기를 등록")] 
    [SerializeField] public BoxCollider weaponCollider; // 몬스터의 무기 콜라이더

    [Header("Item List")][Tooltip("몬스터 아이템 드랍")]
    [SerializeField]
    public List<Item> itemList; // 드롭할 아이템 리스트
    [SerializeField]
    public Item monsterIngredient; // 드롭할 몬스터 재료
    [SerializeField]
    public float DropPercent;      // 드롭 확률
}
