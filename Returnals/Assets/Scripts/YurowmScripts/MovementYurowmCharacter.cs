using UnityEngine;

public class MovementYurowmCharacter : MonoBehaviour
{
    [SerializeField]
    private UIInventory uiInventory;

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
        animator = GetComponent<Animator>();
        status = GetComponent<Status>();
    }

    public void UpdateMovement()
    {
        // Ű �Է����� x, z�� �̵� ���� ����
        float AxisH = Input.GetAxisRaw("Horizontal");
        float AxisV = Input.GetAxisRaw("Vertical");

        float offset = 0.5f + Input.GetAxis("Sprint") * 0.5f;

        if(AxisH != 0 || AxisV != 0)
        {
            animator.SetFloat("Speed", offset);
        }
        else
        {
            animator.SetFloat("Speed", 0.0f);
        }

        // ������Ʈ�� �̵� �ӵ� ���� (ShiftŰ�� ������ ������ walkSpeed, ������ runSpeed)
        status.MoveSpeed = Mathf.Lerp(status.WalkSpeed, status.RunSpeed, Input.GetAxis("Sprint"));

        // ������Ʈ�� �̵� ���� ����
        Vector3 dir = mainCamera.rotation * new Vector3(AxisH, 0, AxisV);
        moveDirection = new Vector3(dir.x, moveDirection.y, dir.z);

        characterController.Move(moveDirection * status.MoveSpeed * Time.deltaTime);


        // Space Ű�� ������ �� �÷��̾ �ٴڿ� ������ ����
        if (Input.GetKeyDown(KeyCode.Space) && characterController.isGrounded == true)
        {
            animator.SetTrigger("Jump");
            moveDirection.y = jumpForce;
        }

        if(characterController.isGrounded == false)
        {
            moveDirection.y += gravity * Time.deltaTime;
        }

        animator.SetBool("Aiming", Input.GetMouseButton(1));

        // ���� ī�޶� �ٶ󺸰� �ִ� ���� ������ ������ ����
        transform.rotation = Quaternion.Euler(0, mainCamera.eulerAngles.y, 0);
    }

    public void UpdateAttack()
    {
        if (UnityEngine.EventSystems.EventSystem.current.IsPointerOverGameObject()) return;

        if(Input.GetMouseButtonDown(0))
        {
            animator.SetTrigger("Attack");
        }
    }

    //private void OnControllerColliderHit(ControllerColliderHit hit)
    //{
    //    if(hit.gameObject.CompareTag("Eatable"))
    //    {
    //        int index = hit.gameObject.GetComponent<EatableObject>().ItemIndex;
    //        uiInventory.GetItem(index);

    //        Destroy(hit.gameObject);
    //        Debug.Log(hit.gameObject.name);
    //    }
    //}

    private void OnCollisionEnter(Collision collision)
    {
        if(collision.gameObject.CompareTag("Eatable"))
        {
            int index = collision.gameObject.GetComponent<EatableObject>().ItemIndex;
            uiInventory.GetItem(index);

            Destroy(collision.gameObject);
            Debug.Log(collision.gameObject.name);
        }
    }
}
