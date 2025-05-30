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

    // 인 게임 중에 획득한 아이템
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

        // 키 입력으로 x, z축 이동 방향 설정
        float AxisH = Input.GetAxis("Horizontal");
        float AxisV = Input.GetAxis("Vertical");

        if (Input.GetKeyDown(KeyCode.H))
            OnDamage(100);

        // 오브젝트의 이동 속도 설정 (Shift키를 누르지 않으면 walkSpeed, 누르면 runSpeed)
        status.MoveSpeed = Mathf.Lerp(status.WalkSpeed, status.RunSpeed, Input.GetAxis("Sprint"));

        float offset = 0.5f + Input.GetAxis("Sprint") * 0.5f;

        // 스태미나가 0이하라면 회복 모드
        if(status.PlayerStamina <= 0)
        {
            isRecoveryMode = true;
            StartCoroutine("Recovery");
        }

        // 회복 모드 시 플레이어의 이동 속도는 걷는 속도
        if(isRecoveryMode == true)
        {
            status.MoveSpeed = status.WalkSpeed;
            offset = 0.5f;
        }

        RecoveryStamina();

        // 오브젝트의 이동 방향 설정
        Vector3 dir = mainCamera.rotation * new Vector3(AxisH, 0, AxisV);
        moveDirection = new Vector3(dir.x, moveDirection.y, dir.z);

        characterController.Move(moveDirection * status.MoveSpeed * Time.deltaTime);


        // Space 키를 눌렀을 때 플레이어가 바닥에 있으면 점프
        if (Input.GetKeyDown(KeyCode.Space) && characterController.isGrounded == true)
        {
            //animator.SetTrigger("onJump");
            moveDirection.y = jumpForce;
        }

        if(characterController.isGrounded == false)
        {
            moveDirection.y += gravity * Time.deltaTime;
        }

        // 현재 카메라가 바라보고 있는 전방 방향을 보도록 설정
        transform.rotation = Quaternion.Euler(0, mainCamera.eulerAngles.y, 0);
    }

    private void OnTriggerEnter(Collider collision)
    {
        // 드랍되어있는 아이템 획득
        if(collision.gameObject.CompareTag("Eatable"))
        {
            //AddItem(collision.GetComponent<EatableObject>().item);
            ItemManager.Instance.AddItem(collision.GetComponent<EatableObject>().item);
            // 인벤토리에도 보이게
            inventoryUI.AcquireItem(collision.GetComponent<EatableObject>().item);

            Destroy(collision.gameObject);
            Debug.Log(collision.gameObject.name);
        }
    }

    // 스태미나가 0이하될 경우 3초 동안 대시 불가
    private IEnumerator Recovery()
    {
        yield return new WaitForSeconds(3.0f);

        isRecoveryMode = false;
    }

    // 평상시엔 적게, 스태미나가 없을 경우 빠르게 회복
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
        // 게임매니저에 있는 아이템 목록에 추가(가방에 있는 아이템들을 베이스캠프에 넣는 개념)
        foreach(var item in ItemManager.Instance.items)
        {
            if (GameManager.instance.Items.ContainsKey(item.Key))
                GameManager.instance.Items[item.Key] += item.Value;
            else
                GameManager.instance.Items.Add(item.Key, item.Value);
            GameManager.instance.BestItemCount += item.Value;       // 현재 담은 아이템의 개수만큼 최고 아이템 개수 증가
        }
        // 다 넣었으면 가방 비우기
        ItemManager.Instance.ClearItem();
    }

    // 플레이어 데미지 처리
    public void OnDamage(float damage)
    {
        // 데미지 입을 시
        status.isNotAttack = true;
        float final = 100 / (100 + status.Defense);
        bool isDie = status.DecreaseHP(damage * final);

        if(isDie)
        {
            // 죽었을 때 지금까지 얻었던 아이템 잃기
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