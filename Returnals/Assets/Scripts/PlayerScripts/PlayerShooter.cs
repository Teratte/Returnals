using UnityEngine;

public class PlayerShooter : MonoBehaviour
{
    [SerializeField]
    private Gun gun;
    [SerializeField]
    private Transform gunPivot;
    [SerializeField]
    private Transform leftHandMount;
    [SerializeField]
    private Transform rightHandMount;

    private Animator playerAnimator;

    private void Awake()
    {
        playerAnimator = GetComponent<Animator>();
    }

    private void OnEnable()
    {
        gun.gameObject.SetActive(true);
    }

    private void OnDisable()
    {
        gun.gameObject.SetActive(false);
    }

    private void Update()
    {
        if (Input.GetMouseButton(0))
        {
            gun.Fire();
        }
        else if (Input.GetKeyDown(KeyCode.R))
        {
            if(gun.Reload())
            {
                // 재장전 애니메이션 재생
            }
        }
    }

    private void OnAnimatorIK(int layerIndex)
    {
        gunPivot.position = playerAnimator.GetIKHintPosition(AvatarIKHint.RightElbow);

        playerAnimator.SetIKPositionWeight(AvatarIKGoal.LeftHand, 1.0f);
        playerAnimator.SetIKRotationWeight(AvatarIKGoal.LeftHand, 1.0f);

        playerAnimator.SetIKPosition(AvatarIKGoal.LeftHand, leftHandMount.position);
        playerAnimator.SetIKRotation(AvatarIKGoal.LeftHand, leftHandMount.rotation);

        playerAnimator.SetIKPositionWeight(AvatarIKGoal.RightHand, 1.0f);
        playerAnimator.SetIKRotationWeight(AvatarIKGoal.RightHand, 1.0f);

        playerAnimator.SetIKPosition(AvatarIKGoal.RightHand, rightHandMount.position);
        playerAnimator.SetIKRotation(AvatarIKGoal.RightHand, rightHandMount.rotation);
    }
}
