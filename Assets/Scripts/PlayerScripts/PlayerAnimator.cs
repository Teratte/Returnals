using UnityEngine;

public class PlayerAnimator : MonoBehaviour
{
    private Animator animator;

    [SerializeField]
    private Transform rightGunBone; // 오른손으로 총 드는 위치
    private WeaponBase weapon;
    private GazetBase gazet;    // 가젯

    public WeaponBase Weapon => weapon;
    public GazetBase Gazet => gazet;
    private void Awake()
    {
        animator = GetComponent<Animator>();
    }

    private void Start()
    {
        if (GameManager.instance.isGameStart)
        {
            GameManager.instance.holdingWeaponPrefabs.Add(GameManager.instance.subWeapon);
            GameManager.instance.holdingWeaponPrefabs.Add(GameManager.instance.mainWeapon);
            for (int i = 0; i < GameManager.instance.holdingWeaponPrefabs.Count; i++)
            {
                GameObject newRightGun = Instantiate(GameManager.instance.holdingWeaponPrefabs[i], rightGunBone.position, Quaternion.identity);

                newRightGun.transform.parent = rightGunBone;
                newRightGun.transform.localRotation = Quaternion.Euler(0, -90, -90);
                newRightGun.SetActive(false);
            }
            SetArsenal(1);
            SetGazet();
        }
    }

    private void Update()
    {
        ChangeWeapon();
        UpdateAttack();
        UpdateGazet();
    }

    private void ChangeWeapon()
    {
        int inputIndex = 0;
        if (int.TryParse(Input.inputString, out inputIndex) && (inputIndex > 0 && inputIndex <= GameManager.instance.holdingWeaponPrefabs.Count) && !weapon.IsReload)
            SetArsenal(inputIndex);
    }

    public void UpdateAttack()
    {
        if (UnityEngine.EventSystems.EventSystem.current.IsPointerOverGameObject()) return;

        if (weapon != null)
        {
            if (!weapon.IsReload)
            {
                if (weapon.WeaponSetting.isAutomaticAttack)
                {
                    if (Input.GetMouseButton(0) && Input.GetAxis("Sprint") == 0 && weapon.CurrentAmmo > 0)
                    {
                        weapon.StartWeaponAction(0);
                        animator.SetTrigger("onAttack");
                    }
                }
                else
                {
                    if (Input.GetMouseButtonDown(0) && Input.GetAxis("Sprint") == 0 && weapon.CurrentAmmo > 0)
                    {
                        weapon.StartWeaponAction(0);
                        animator.SetTrigger("onAttack");
                    }
                }
            }

            if (Input.GetMouseButtonUp(0))
            {
                weapon.StopWeaponAction(0);
            }

            if (Input.GetButtonDown("Reload"))
            {
                weapon.StartReload();
            }
        }
    }
    public void UpdateGazet()
    {
        if (gazet != null)
        {
            if (Input.GetKeyDown(KeyCode.Q))
                gazet.StartGazetAction();
        }
        else
        {
            Debug.Log("NULL");
        }
    }

    public void SetArsenal(int number)
    {
        for(int i = 0;i < GameManager.instance.holdingWeaponPrefabs.Count;i++)
        {
            rightGunBone.GetChild(i).gameObject.SetActive(false);
        }
        rightGunBone.GetChild(number - 1).gameObject.SetActive(true);

        weapon = rightGunBone.GetChild(number - 1).gameObject.GetComponent<WeaponBase>();
        if(weapon != null)
        {
            animator.runtimeAnimatorController = weapon.RuntimeAnimatorController;
        }
    }

    public void SetGazet()
    {
        gazet = GameManager.instance.holdingGazet.GetComponent<GazetBase>();
    }

    private void OnAnimatorIK(int layerIndex)
    {
        if(weapon != null)
        {
            // IK를 사용하여 왼손의 위치와 회전을 총의 왼쪽 손잡이에 맞춤
            animator.SetIKPositionWeight(AvatarIKGoal.LeftHand, 1.0f);
            animator.SetIKRotationWeight(AvatarIKGoal.LeftHand, 1.0f);

            animator.SetIKPosition(AvatarIKGoal.LeftHand, weapon.leftHandle.position);
        }
    }
}
