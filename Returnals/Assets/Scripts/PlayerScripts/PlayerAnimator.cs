using UnityEngine;

public class PlayerAnimator : MonoBehaviour
{
    [SerializeField]
    private GameObject attackCollision;
    private Animator animator;

    [SerializeField]
    private Transform rightGunBone; // 오른손으로 총 드는 위치
    [SerializeField]
    private GameObject gunPrefabParent; // 총이 위치할 곳
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
        if (!Input.anyKeyDown) return;

        int inputIndex = 0;
        if (int.TryParse(Input.inputString, out inputIndex) && (inputIndex > 0 && inputIndex < 5))
            SetArsenal(arsenal[inputIndex - 1].name);
    }

    public void SetArsenal(string name)
    {
        foreach (Arsenal hand in arsenal)
        {
            if (hand.name == name)
            {
                if (rightGunBone.childCount > 0)
                    Destroy(rightGunBone.GetChild(0).gameObject);
                if (hand.rightGun != null)
                {
                    GameObject newRightGun = (GameObject)Instantiate(hand.rightGun, rightGunBone.position, rightGunBone.rotation);
                    newRightGun.transform.parent = rightGunBone;
                    newRightGun.transform.localPosition = new Vector3(-0.253f, 0.0194f, 0.0072f);
                    newRightGun.transform.localRotation = Quaternion.Euler(0, -90, 0);
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
        public RuntimeAnimatorController controller;
    }
}
