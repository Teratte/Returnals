using UnityEngine;

public class MovementCharacter : MonoBehaviour
{
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

    private void Awake()
    {
        characterController = GetComponent<CharacterController>();
        animator = GetComponentInChildren<Animator>();
        status = GetComponent<Status>();
    }

    public void UpdateMovement()
    {
        // Ű �Է����� x, z�� �̵� ���� ����
        float AxisH = Input.GetAxis("Horizontal");
        float AxisV = Input.GetAxis("Vertical");

        // ������Ʈ�� �̵� �ӵ� ���� (ShiftŰ�� ������ ������ walkSpeed, ������ runSpeed)
        status.MoveSpeed = Mathf.Lerp(status.WalkSpeed, status.RunSpeed, Input.GetAxis("Sprint"));

        float offset = 0.5f + Input.GetAxis("Sprint") * 0.5f;

        if(status.PlayerStamina <= 0)
        {
            status.MoveSpeed = status.WalkSpeed;
            offset = 0.5f;
        }

        animator.SetFloat("horizontal", AxisH * offset);
        animator.SetFloat("vertical", AxisV * offset);

        // ������Ʈ�� �̵� ���� ����
        Vector3 dir = mainCamera.rotation * new Vector3(AxisH, 0, AxisV);
        moveDirection = new Vector3(dir.x, moveDirection.y, dir.z);

        characterController.Move(moveDirection * status.MoveSpeed * Time.deltaTime);


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

    private void OnTriggerEnter(Collider collision)
    {
        if(collision.gameObject.CompareTag("Eatable"))
        {
            int index = collision.gameObject.GetComponent<EatableObject>().ItemIndex;
            inventoryUI.AcquireItem(collision.gameObject.GetComponent<EatableObject>().item);
            GameManager.instance.AddItem(collision.gameObject.GetComponent<EatableObject>().item);

            Destroy(collision.gameObject);
            Debug.Log(collision.gameObject.name);
        }
    }
}
