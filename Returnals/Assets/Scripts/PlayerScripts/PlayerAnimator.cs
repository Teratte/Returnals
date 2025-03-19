using UnityEngine;

public class PlayerAnimator : MonoBehaviour
{
    [SerializeField]
    private GameObject attackCollision;
    private Animator animator;

    [SerializeField]
    private Transform rightGunBone; // 오른손으로 총 드는 위치
    [SerializeField]
    private Transform leftGunBone;  // 왼손으로 총 드는 위치
    public Arsenal[] arsenal;

    private void Awake()
    {
        animator = GetComponent<Animator>();

        if (arsenal.Length > 0)
            SetArsenal(arsenal[0].name);
    }

    public void OnAttackCollision()
    {
        attackCollision.SetActive(true);
    }

    private void Update()
    {
        ChangeWeapon();
    }

    private void ChangeWeapon()
    {
        if (Input.GetKeyDown(KeyCode.Alpha1))
        {
            SetArsenal(arsenal[0].name);
        }
        else if (Input.GetKeyDown(KeyCode.Alpha2))
        {
            SetArsenal(arsenal[1].name);
        }
        else if (Input.GetKeyDown(KeyCode.Alpha3))
        {
            SetArsenal(arsenal[2].name);
        }
        else if (Input.GetKeyDown(KeyCode.Alpha4))
        {
            SetArsenal(arsenal[3].name);
        }
        else if (Input.GetKeyDown(KeyCode.Alpha5))
        {
            SetArsenal(arsenal[4].name);
        }
    }

    public void SetArsenal(string name)
    {
        foreach (Arsenal hand in arsenal)
        {
            if (hand.name == name)
            {
                if (rightGunBone.childCount > 0)
                    Destroy(rightGunBone.GetChild(0).gameObject);
                if (leftGunBone.childCount > 0)
                    Destroy(leftGunBone.GetChild(0).gameObject);
                if (hand.rightGun != null)
                {
                    GameObject newRightGun = (GameObject)Instantiate(hand.rightGun, rightGunBone.position, rightGunBone.rotation);
                    newRightGun.transform.parent = rightGunBone;
                    newRightGun.transform.localPosition = new Vector3(-0.253f, 0.0194f, 0.0072f);
                    newRightGun.transform.localRotation = Quaternion.Euler(0, -90, 0);
                }
                if (hand.leftGun != null)
                {
                    GameObject newLeftGun = (GameObject)Instantiate(hand.leftGun);
                    newLeftGun.transform.parent = leftGunBone;
                    newLeftGun.transform.localPosition = Vector3.zero;
                    newLeftGun.transform.localRotation = Quaternion.Euler(0, 0, 0);
                }
                animator.runtimeAnimatorController = hand.controller;
                return;
            }
        }
    }

    [System.Serializable]
    public struct Arsenal
    {
        public string name;
        public GameObject rightGun;
        public GameObject leftGun;
        public RuntimeAnimatorController controller;
    }
}
