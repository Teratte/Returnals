using UnityEngine;

public class MovementCharacter : MonoBehaviour
{
    [SerializeField]
    private float walkSpeed = 2.0f;
    [SerializeField]
    private float runSpeed = 5.0f;
    [SerializeField]
    private float moveSpeed = 4.0f;
    [SerializeField]
    private float gravity = -9.81f;
    [SerializeField]
    private float jumpForce = 3.0f;
    private Vector3 moveDirection = Vector3.zero;

    [SerializeField]
    private Transform mainCamera;

    private CharacterController characterController;
    private Animator animator;
    private void Awake()
    {
        characterController = GetComponent<CharacterController>();
        animator = GetComponentInChildren<Animator>();
    }

    private void Update()
    {
        // Ű �Է����� x, z�� �̵� ���� ����
        float AxisH = Input.GetAxisRaw("Horizontal");
        float AxisV = Input.GetAxisRaw("Vertical");

        float offset = 0.5f + Input.GetAxis("Sprint") * 0.5f;

        animator.SetFloat("horizontal", AxisH * offset);
        animator.SetFloat("vertical", AxisV * offset);

        // ������Ʈ�� �̵� �ӵ� ���� (ShiftŰ�� ������ ������ walkSpeed, ������ runSpeed)
        moveSpeed = Mathf.Lerp(walkSpeed, runSpeed, Input.GetAxis("Sprint"));

        // ������Ʈ�� �̵� ���� ����
        Vector3 dir = mainCamera.rotation * new Vector3(AxisH, 0, AxisV);
        moveDirection = new Vector3(dir.x, moveDirection.y, dir.z);

        characterController.Move(moveDirection * moveSpeed * Time.deltaTime);


        // Space Ű�� ������ �� �÷��̾ �ٴڿ� ������ ����
        if (Input.GetKeyDown(KeyCode.Space) && characterController.isGrounded == true)
        {
            animator.SetTrigger("onJump");
            moveDirection.y = jumpForce;
        }

        if(characterController.isGrounded == false)
        {
            moveDirection.y += gravity * Time.deltaTime;
        }

        // ���� ī�޶� �ٶ󺸰� �ִ� ���� ������ ������ ����
        transform.rotation = Quaternion.Euler(0, mainCamera.eulerAngles.y, 0);
    }
}
