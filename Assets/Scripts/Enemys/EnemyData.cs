using System.Collections.Generic;
using UnityEngine;
using static EnemyFSM;

[CreateAssetMenu(fileName = "�� ���� ������", menuName = "����", order = 999)]
public class EnemyData : ScriptableObject
{
    [Header("���� �̸�")]
    public string enemyName = "����";

    [Header("�⺻ ����")][Tooltip("���� �������ͽ��� ����")]
    public float maxHealth = 100f; // �ִ� ü��
    public float moveSpeed = 3.5f; // ���� �̵� �ӵ�
    public float chaseSpeed = 5f; // �߰� �� �ӵ�
    public float rotationSpeed = 5f; // ȸ�� �ӵ� (Ÿ�� ���� ��ȯ �ӵ�)
    public float attackRange = 1f; // ���� ���� (���� ������ �Ÿ�)
    public float defense = 1.5f; // ����
    public float monsterDamage = 40.0f; // ���� ���ݷ�
    public float attackDelay = 1.5f; // ���� �� ���� (�ѹ� ���� �� ������[����]����)

    [Header("���� Ÿ��")]
    public EnemyAttackType enemyAttackType = EnemyAttackType.Melee;

    [Header("�ִϸ��̼�")]
    public AnimationClip idleAnimation; // ��� �ִϸ��̼�
    public AnimationClip patrolAnimation;   // ���� �ִϸ��̼�
    public AnimationClip chaseAnimation;    // ���� �ִϸ��̼�
    public AnimationClip attackAnimation;   // ���� �ִϸ��̼�
    public AnimationClip dieAnimation;  //  ��� �ִϸ��̼�
    public AnimationClip searchAnimation; // Ž�� �ִϸ��̼�

    [Header("���� ���� ���� ����")]
    public float selfDestructDelay = 1.5f;       // ���� �� ��� �ð�
    public float selfDestructRadius = 3f;        // ���� ����
    public float selfDestructDamage = 80f;       // ���� ������

    [Header("AI ���� ���� ����")]
    public float detectionAngle = 90f; // ���� �ν� ����
    public float rearDetectionAngle = 180f; // �Ĺ� �þ߰� (180��, �� �Ĺ� ����)
    public float rearDetectionRange = 5f;        // �Ĺ� ���� ���� �Ÿ�
    public float detectionRange = 10f; // ���� ���� Ž�� �Ÿ� (�÷��̾ �����ϴ� ����, ���� �ν� ������ �Բ� ����)

    [Header("��� �� Ž�� �ð�")]
    public float idleWaitTimeMin = 2f;           // ��� ���� �ּ� �ð�
    public float idleWaitTimeMax = 3f;           // ��� ���� �ִ� �ð�
    public float patrolTimeMin = 2f;             // ���� ���� �ּ� �ð�
    public float patrolTimeMax = 3f;             // ���� ���� �ִ� �ð�

    [Header("���� Ŭ��")]
    public AudioClip zombieSound;                 // �߰� �� ��ħ
    public AudioClip attackSound;                // ���� �� ����
    public AudioClip dieSound;                   // ��� ����

    /*
    [Header("���� ����")][Tooltip("������ ���⸦ ���")] 
    public Collider weaponCollider; // ������ ���� �ݶ��̴�
    */

    [Header("��� ������ ����Ʈ")][Tooltip("���� ������ ���")]
    public List<Item> itemList; // ����� ������ ����Ʈ
    public float DropPercent;      // ��� Ȯ��
}
