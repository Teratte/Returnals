using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MovementCharacter : MonoBehaviour, IDamageable
{
    public static Action OnDie;

    [SerializeField]
    private InventoryUI inventoryUI;

    [SerializeField]
    private float gravity = -9.81f;
    [SerializeField]
    private float jumpForce = 3.0f;
    private Vector3 moveDirection = Vector3.zero;

    [SerializeField]
    private Transform mainCamera;

    private CharacterController characterController;
    private Animator animator;
    private Status status;
    private bool isRecoveryMode = false;
    public bool IsRecoveryMode => isRecoveryMode;

    // �� ���� �߿� ȹ���� ������
    private Dictionary<Item, int> acquiredItems = new Dictionary<Item, int>();
    private void Awake()
    {
        characterController = GetComponent<CharacterController>();
        animator = GetComponentInChildren<Animator>();
        status = GetComponent<Status>();
    }

    public void UpdateMovement()
    {
        if (GameManager.instance.isUIOn || GameManager.instance.isGameOver)
            return;

        // Ű �Է����� x, z�� �̵� ���� ����
        float AxisH = Input.GetAxis("Horizontal");
        float AxisV = Input.GetAxis("Vertical");

        if (Input.GetKeyDown(KeyCode.H))
            OnDamage(100);

        // ������Ʈ�� �̵� �ӵ� ���� (ShiftŰ�� ������ ������ walkSpeed, ������ runSpeed)
        status.MoveSpeed = Mathf.Lerp(status.WalkSpeed, status.RunSpeed, Input.GetAxis("Sprint"));

        float offset = 0.5f + Input.GetAxis("Sprint") * 0.5f;

        // ���¹̳��� 0���϶�� ȸ�� ���
        if(status.PlayerStamina <= 0)
        {
            isRecoveryMode = true;
            StartCoroutine("Recovery");
        }

        // ȸ�� ��� �� �÷��̾��� �̵� �ӵ��� �ȴ� �ӵ�
        if(isRecoveryMode == true)
        {
            status.MoveSpeed = status.WalkSpeed;
            offset = 0.5f;
        }

        RecoveryStamina();

        // ������Ʈ�� �̵� ���� ����
        Vector3 dir = mainCamera.rotation * new Vector3(AxisH, 0, AxisV);
        moveDirection = new Vector3(dir.x, moveDirection.y, dir.z);

        characterController.Move(moveDirection * status.MoveSpeed * Time.deltaTime);


        // Space Ű�� ������ �� �÷��̾ �ٴڿ� ������ ����
        if (Input.GetKeyDown(KeyCode.Space) && characterController.isGrounded == true)
        {
            //animator.SetTrigger("onJump");
            moveDirection.y = jumpForce;
        }

        if(characterController.isGrounded == false)
        {
            moveDirection.y += gravity * Time.deltaTime;
        }

        // ���� ī�޶� �ٶ󺸰� �ִ� ���� ������ ������ ����
        transform.rotation = Quaternion.Euler(0, mainCamera.eulerAngles.y, 0);
    }

    private void OnTriggerEnter(Collider collision)
    {
        // ����Ǿ��ִ� ������ ȹ��
        if(collision.gameObject.CompareTag("Eatable"))
        {
            //AddItem(collision.GetComponent<EatableObject>().item);
            ItemManager.Instance.AddItem(collision.GetComponent<EatableObject>().item);
            // �κ��丮���� ���̰�
            inventoryUI.AcquireItem(collision.GetComponent<EatableObject>().item);

            Destroy(collision.gameObject);
            Debug.Log(collision.gameObject.name);
        }
    }

    // ���¹̳��� 0���ϵ� ��� 3�� ���� ��� �Ұ�
    private IEnumerator Recovery()
    {
        yield return new WaitForSeconds(3.0f);

        isRecoveryMode = false;
    }

    // ���ÿ� ����, ���¹̳��� ���� ��� ������ ȸ��
    public void RecoveryStamina()
    {
        if(isRecoveryMode)
        {
            status.PlayerStamina += Time.deltaTime * 12.0f;

            if(status.PlayerStamina >= status.MaxStamina)
            {
                isRecoveryMode=false;
            }
        }
        else
        {
            status.PlayerStamina += Time.deltaTime * status.RecoverRateStamina;
        }
    }

    public void ClearStage()
    {
        // ���ӸŴ����� �ִ� ������ ��Ͽ� �߰�(���濡 �ִ� �����۵��� ���̽�ķ���� �ִ� ����)
        foreach(var item in ItemManager.Instance.items)
        {
            if (GameManager.instance.Items.ContainsKey(item.Key))
                GameManager.instance.Items[item.Key] += item.Value;
            else
                GameManager.instance.Items.Add(item.Key, item.Value);
            GameManager.instance.BestItemCount += item.Value;       // ���� ���� �������� ������ŭ �ְ� ������ ���� ����
        }
        // �� �־����� ���� ����
        ItemManager.Instance.ClearItem();
    }

    // �÷��̾� ������ ó��
    public void OnDamage(float damage)
    {
        // ������ ���� ��
        status.isNotAttack = true;
        float final = 100 / (100 + status.Defense);
        bool isDie = status.DecreaseHP(damage * final);

        if(isDie)
        {
            // �׾��� �� ���ݱ��� ����� ������ �ұ�
            ItemManager.Instance.ClearItem();
            GameManager.instance.isGameOver = true;
            OnDie?.Invoke();
        }
    }

    private void OnEnable()
    {
        InventoryUI.OnClearStage += ClearStage;
    }

    private void OnDisable()
    {
        InventoryUI.OnClearStage -= ClearStage;
    }
}