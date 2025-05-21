using System;
using System.Collections;
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
            inventoryUI.AcquireItem(collision.gameObject.GetComponent<EatableObject>().item);
            GameManager.instance.AddItem(collision.gameObject.GetComponent<EatableObject>().item);

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

    // 플레이어 데미지 처리
    public void OnDamage(float damage)
    {
        // 데미지 입을 시
        status.isNotAttack = true;
        //animator.SetTrigger("onHit");
        float final = 100 / (100 + status.Defense);
        bool isDie = status.DecreaseHP(damage * final);

        if(isDie)
        {
            //animator.SetBool("isDie", true);
            GameManager.instance.isGameOver = true;
            OnDie?.Invoke();
        }
    }
}