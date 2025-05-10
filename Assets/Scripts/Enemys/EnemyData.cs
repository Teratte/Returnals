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
    public float attackDelay = 1.5f;  // ���� �� ������
    public float defense = 1.5f; // ����
    public float monsterDamage = 40.0f; // ���� ���ݷ�
    public float postAttackDelay = 0.3f; // ���� �� ������

    [Header("���� Ÿ��")]
    public EnemyAttackType enemyAttackType = EnemyAttackType.Melee;

    /* �� ģ������ FSM �ҽ��ڵ��
    private float curHealth;
    private bool isPostDelay = false;
    */

    [Header("Detection")][Tooltip("������ �νĹ���(�þ߰��� ����)")]
    [SerializeField] public float detectionAngle = 90f; // ���� �ν� ����

    [Header("Weapon")][Tooltip("������ ���⸦ ���")] 
    [SerializeField] public BoxCollider weaponCollider; // ������ ���� �ݶ��̴�

    [Header("Item List")][Tooltip("���� ������ ���")]
    [SerializeField]
    public List<Item> itemList; // ����� ������ ����Ʈ
    [SerializeField]
    public Item monsterIngredient; // ����� ���� ���
    [SerializeField]
    public float DropPercent;      // ��� Ȯ��
}
