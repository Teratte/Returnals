using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class EnemyFSM : MonoBehaviour, IDamageable
{
    [Header("���� ������")]
    [SerializeField] private EnemyData enemyData;

    private EnemyState currentState; // ���� ����

    public float MonsterDamage => enemyData.monsterDamage; // ���� ���ݷ�
    private float curHealth; // ���� ü��
    private bool isPostDelay = false; // ���� �� ������ ����

    private NavMeshAgent nav;
    private Animator anim;
    private Rigidbody rigid;
    private CapsuleCollider capsuleCollider;


    // Start is called once before the first execution of Update after the MonoBehaviour is created

    private void Awake()
    {
        curHealth = enemyData.maxHealth; // �ִ� ü������ �ʱ�ȭ
        nav = GetComponent<NavMeshAgent>();
        anim = GetComponent<Animator>();
        rigid = GetComponent<Rigidbody>();
        capsuleCollider = GetComponent<CapsuleCollider>();

        nav.speed = enemyData.moveSpeed; // �̵� �ӵ�
        nav.angularSpeed = enemyData.rotationSpeed * 100f; // ȸ���ӵ�
        nav.acceleration = 8f; // ���ӵ�
        nav.updateRotation = true; // ȸ�� ������Ʈ(�ڵ� ȸ��)
        nav.obstacleAvoidanceType = ObstacleAvoidanceType.HighQualityObstacleAvoidance; // ��ֹ� ȸ�� Ÿ�� ����(��ǰ�� ȸ�� ���)
        nav.avoidancePriority = Random.Range(30, 70); // ��ֹ� ȸ�� �켱���� ����(���������� ����), ���� ���� �켱������ ����, ���� AI�� ���� �� �浹 ����
    }
    private void Start()
    {
        currentState = EnemyState.Idle; // ���� �ʱ�ȭ
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
        curHealth -= (damage * damageRange); // ���¿� ���� ������ ���

        if (curHealth <= 0)
        {
            Die();

        }
    }
    void Idle()
    {
        // ��� ���� ó��
    }
    void Patrol()
    {
        // ���� ���� ó��
    }
    void Chase()
    {
        // �߰� ���� ó��
    }
    void Attack()
    {
        switch(enemyData.enemyAttackType)
        {
            case EnemyAttackType.Melee:
                // ���� ���� ó��
                break;
            case EnemyAttackType.Ranged:
                // ���Ÿ� ���� ó��
                break;
            case EnemyAttackType.Bomb:
                // ���� ���� ó��
                break;
        }
    }

    void Die()
    {
        // ��� ó��
    }
    public enum EnemyState
    {
        Idle,
        Patrol,
        Chase,
        Attack,
        Die,
    }

    // ���� ���� Ÿ��
    public enum EnemyAttackType
    {
        Melee,
        Ranged,
        Bomb,
    }
}
