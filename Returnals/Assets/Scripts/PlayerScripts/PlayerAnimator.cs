using System.Collections.Generic;
using UnityEngine;

public class PlayerAnimator : MonoBehaviour
{
    private Animator animator;

    [SerializeField]
    private Transform rightGunBone; // 오른손으로 총 드는 위치
    public List<GameObject> holdingWeapons;
    private WeaponBase weapon;

    public WeaponBase Weapon => weapon;
    private void Awake()
    {
        animator = GetComponent<Animator>();
        for(int i = 0;i < holdingWeapons.Count;i++)
        {
            GameObject newRightGun = Instantiate(holdingWeapons[i], rightGunBone.position, Quaternion.identity);
            newRightGun.transform.parent = rightGunBone;
            newRightGun.transform.localRotation = Quaternion.Euler(0, -90, 0);
            newRightGun.SetActive(false);
        }
        SetArsenal(1);
    }

    private void Update()
    {
        ChangeWeapon();
        if(weapon != null)
        {
            if(!weapon.IsReload)
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

            if(Input.GetMouseButtonUp(0))
            {
                weapon.StopWeaponAction(0);
            }

            if (Input.GetButtonDown("Reload"))
            {
                weapon.StartReload();
            }
        }
    }

    private void ChangeWeapon()
    {
        int inputIndex = 0;
        if (int.TryParse(Input.inputString, out inputIndex) && (inputIndex > 0 && inputIndex <= holdingWeapons.Count) && !weapon.IsReload)
            SetArsenal(inputIndex);
    }

    public void UpdateAttack()
    {
        if (UnityEngine.EventSystems.EventSystem.current.IsPointerOverGameObject()) return;

        if (Input.GetMouseButtonDown(0))
        {
            animator.SetTrigger("onAttack");
        }
    }

    public void SetArsenal(int number)
    {
        for(int i = 0;i < holdingWeapons.Count;i++)
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
