using UnityEngine;

public class PlayerYurowmController : MonoBehaviour
{
    private MovementYurowmCharacter character;
    private Status status;
    private Animator animator;

    [SerializeField]
    private Transform rightGunBone; // 오른손으로 총 드는 위치
    [SerializeField]
    private Transform leftGunBone;  // 왼손으로 총 드는 위치
    public Arsenal[] arsenal;

    bool isNotAttack = true;
    float notAttackTime = 0.0f;
    [SerializeField]
    private float recoverAbleTime = 3.0f;
    bool isRecover = true;  // 완전히 회복된 상태

    private void Awake()
    {
        character = GetComponent<MovementYurowmCharacter>();
        status = GetComponent<Status>();
        animator = GetComponent<Animator>();

        if (arsenal.Length > 0)
            SetArsenal(arsenal[0].name);
    }

    private void Update()
    {
        character.UpdateMovement();
        character.UpdateAttack();
        ChangeWeapon();

        if(isNotAttack && status.PlayerHP < status.MaxHP)
        {
            notAttackTime += Time.deltaTime;
        }

        if (notAttackTime >= recoverAbleTime)
        {
            notAttackTime = 0.0f;
            isRecover = false;
        }

        if(!isRecover &&  status.PlayerHP < status.MaxHP)
        {
            status.PlayerHP += Time.deltaTime * 5.0f;
            if(status.PlayerHP >= status.MaxHP)
            {
                isRecover = true;
            }
        }

        if(status.PlayerHP >= status.MaxHP)
        {
            isRecover = true;
        }

        status.PlayerHP = Mathf.Clamp(status.PlayerHP,0,status.MaxHP);
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
                    GameObject newRightGun = (GameObject)Instantiate(hand.rightGun);
                    newRightGun.transform.parent = rightGunBone;
                    newRightGun.transform.localPosition = Vector3.zero;
                    newRightGun.transform.localRotation = Quaternion.Euler(90, 0, 0);
                }
                if (hand.leftGun != null)
                {
                    GameObject newLeftGun = (GameObject)Instantiate(hand.leftGun);
                    newLeftGun.transform.parent = leftGunBone;
                    newLeftGun.transform.localPosition = Vector3.zero;
                    newLeftGun.transform.localRotation = Quaternion.Euler(90, 0, 0);
                }
                animator.runtimeAnimatorController = hand.controller;
                return;
            }
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if(other.gameObject.CompareTag("Pistol"))
        {
            SetArsenal("One Pistol");
        }
        else if(other.gameObject.CompareTag("Sniper"))
        {
            SetArsenal("Sniper Riffle");
        }
    }

    private void ChangeWeapon()
    {
        if(Input.GetKeyDown(KeyCode.Alpha1))
        {
            SetArsenal(arsenal[0].name);
        }
        else if(Input.GetKeyDown(KeyCode.Alpha2))
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
