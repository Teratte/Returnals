using GLTF.Schema;
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

    private string currentPlayingAnimation = string.Empty; // ���� ������� �ִϸ��̼� �̸�


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
        
        if (enemyData.weaponCollider != null) // ���� �ݶ��̴��� �ִٸ� ��Ȱ��ȭ (������ ������ �޴°� ����)
            enemyData.weaponCollider.enabled = false;
    }

    // Update is called once per frame
    private void Update()
    {
        if (currentState == EnemyState.None) return; // ���� ������ �ִϸ��̼� ���x, �ڿ� ���� ����

        StateUpdate(); // ���� ������Ʈ
    }

    private void FixedUpdate()
    { 
    }

    private void LateUpdate()
    {
        if(currentState == EnemyState.None) return; // ���� ������ �ִϸ��̼� ���x, �ڿ� ���� ����
        UpdateAnimation(); // �ִϸ��̼� ������Ʈ
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
        curHealth -= (damage * damageRange); // ���¿� ���� ������ ���

        if (curHealth <= 0)
        {
            currentState = EnemyState.Die; // ��� ���·� ��ȯ
        }
    }

    void Idle()
    {
        // ��� ���� ó��
        /*
         [��� ���]
         ��� ���¿��� 2~3�� ��� �� ���� ���¸� Patrol ���·� ��ȯ [else]
         ��� �߿� �÷��̾ �����Ǹ� ������¸� Chase ���·� ��ȯ
         �÷��̾ �����Ǵ� ���� : ����þ߰��� �� Ž������ ������ �÷��̾ �����Ǹ� Chase ���·� ��ȯ
         ���� �̶� ���� ��Ÿ� �ȿ� ���� ������ Attack ���·� ��ȯ
         ���Ͱ� �����ϴ� ���� �ۿ��� �÷��̾ ���� �����Ͽ� �ǰݵ� ���, ���Ͱ� ���� ������ ���� �� �������� ȸ�� �� �̵�
         */

    }
    void Patrol()
    {
        // ���� ���� ó��
        /*
         [���� ���]
         ���� ��ġ �����ϴ� ���
         ���� ��ġ�� 2~3�� �̵� �� Idle ���·� ��ȯ
         ���� �� �÷��̾ �����Ǹ� ���� ���¸� Chase ���·� ��ȯ
         �÷��̾ �����Ǵ� ���� : ����þ߰��� �� Ž������ ������ �÷��̾ �����Ǹ� Chase ���·� ��ȯ
         ���� �̶� ���� ��Ÿ� �ȿ� ���� ������ Attack ���·� ��ȯ
         ���Ͱ� �����ϴ� ���� �ۿ��� �÷��̾ ���� �����Ͽ� �ǰݵ� ���, ���Ͱ� ���� ������ ���� �� �������� ȸ�� �� 3�� �̵�
         */
    }
    void Chase()
    {
        // �߰� ���� ó��
        /*
         [�߰� ���]
         �÷��̾ �߰�, �̶� �̵� �ӵ� ����(�߰� �ӵ�)
         ���� �̶� ���� ��Ÿ� �ȿ� ���� ������ Attack ���·� ��ȯ
         ���Ͱ� �����ϴ� ����(���� �þ� �� �� Ž�� ����)�� �÷��̾ ����� Idle ���·� ��ȯ
         */
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

    private void DropItem()
    {
        float percent = Random.Range(0, 100);
        if (percent >= 100 - enemyData.DropPercent)
        {
            int itemIndex = Random.Range(0, enemyData.itemList.Count);
            Instantiate(enemyData.itemList[itemIndex].itemPrefab, transform.position, Quaternion.identity);
        }
    }

    // ��� ó��
    void Die()
    {
        gameObject.layer = 15;  // ���� ������Ʈ ���̾�

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
        if (currentPlayingAnimation == _clip.name) return;  // �ߺ� ��� ����

        anim.CrossFade(_clip.name, _blendTime);             // �ִϸ��̼� ���
        currentPlayingAnimation = _clip.name;               // ���� ������� �ִϸ��̼� �̸� ����
    }

    private void UpdateAnimation()
    {
        switch (currentState)
        {
            case EnemyState.Idle:
                PlayAnimation(enemyData.idleAnimation);   // Idle �ִϸ��̼� ���
                break;
            case EnemyState.Patrol:
                PlayAnimation(enemyData.patrolAnimation); // Patrol �ִϸ��̼� ���
                break;
            case EnemyState.Chase:
                PlayAnimation(enemyData.chaseAnimation);   // Chase �ִϸ��̼� ���
                break;
            case EnemyState.Attack:
                PlayAnimation(enemyData.attackAnimation); // Attack �ִϸ��̼� ���
                break;
            case EnemyState.Die:
                PlayAnimation(enemyData.dieAnimation);    // Die �ִϸ��̼� ���
                currentState = EnemyState.None;           // ��� �ִϸ��̼� ��� �� State�� None����
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

    // ���� ���� Ÿ��
    public enum EnemyAttackType
    {
        Melee,
        Ranged,
        Bomb,
    }
}
