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
    public float moveSpeed = 3.5f; // �̵� �ӵ�
    public float rotationSpeed = 5f; // ȸ�� �ӵ�
    public float attackRange = 1f; // ���� ����
    public float detectionRange = 10f; // Ž�� ���� (�÷��̾ �����ϴ� ����, ���� �ν� ������ �Բ� ����)
    public float defense = 1.5f; // ����
    public float monsterDamage = 40.0f; // ���� ���ݷ�
    public float attackDelay = 1.5f; // ���� �� ������ (�ѹ� ���� �� ������[����]����)

    [Header("���� Ÿ��")]
    public EnemyAttackType enemyAttackType = EnemyAttackType.Melee;

    [Header("�ִϸ��̼�")]
    public AnimationClip idleAnimation; // ��� �ִϸ��̼�
    public AnimationClip patrolAnimation;   // ���� �ִϸ��̼�   
    public AnimationClip chaseAnimation;    // ���� �ִϸ��̼�
    public AnimationClip attackAnimation;   // ���� �ִϸ��̼�
    public AnimationClip dieAnimation;  //  ��� �ִϸ��̼�

    [Header("���� ���� �þ� ����")][Tooltip("������ �νĹ���(�þ߰��� ����)")]
    public float detectionAngle = 90f; // ���� �ν� ����

    [Header("���� ����")][Tooltip("������ ���⸦ ���")] 
    public BoxCollider weaponCollider; // ������ ���� �ݶ��̴�

    [Header("������ ����Ʈ")][Tooltip("���� ������ ���")]
    public List<Item> itemList; // ����� ������ ����Ʈ
    public Item monsterIngredient; // ����� ���� ���
    public float DropPercent;      // ��� Ȯ��
}
