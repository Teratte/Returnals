using UnityEngine;

public class MovementCharacter : MonoBehaviour
{
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
        // 키 입력으로 x, z축 이동 방향 설정
        float AxisH = Input.GetAxisRaw("Horizontal");
        float AxisV = Input.GetAxisRaw("Vertical");

        if(AxisH != 0 || AxisV != 0)
        {
            animator.SetFloat("moveSpeed", 1);
        }
        else
        {
            animator.SetFloat("moveSpeed", 0);
        }

        //oveDirection = new Vector3(AxisH, moveDirection.y, AxisV);
        Vector3 dir = mainCamera.rotation * new Vector3(AxisH, 0, AxisV);
        moveDirection = new Vector3(dir.x, moveDirection.y, dir.z);

        characterController.Move(moveDirection * moveSpeed * Time.deltaTime);


        // Space 키를 눌렀을 때 플레이어가 바닥에 있으면 점프
        if (Input.GetKeyDown(KeyCode.Space) && characterController.isGrounded == true)
        {
            moveDirection.y = jumpForce;
        }

        if(characterController.isGrounded == false)
        {
            moveDirection.y += gravity * Time.deltaTime;
        }

        // 현재 카메라가 바라보고 있는 전방 방향을 보도록 설정
        transform.rotation = Quaternion.Euler(0, mainCamera.eulerAngles.y, 0);
    }
}
