using JetBrains.Annotations;
using UnityEngine;
using UnityEngine.XR;

public class PlayerAnimator : MonoBehaviour
{
    [SerializeField]
    private GameObject attackCollision;
    private Animator animator;

    [SerializeField]
    private Transform rightGunBone; // 오른손으로 총 드는 위치
    [SerializeField]
    private GameObject weaponPrefabParent; // 총이 위치할 곳
    public GameObject[] holdingWeapons;
    [SerializeField]
    private RuntimeAnimatorController[] controllers;

    private void Awake()
    {
        animator = GetComponent<Animator>();
    }

    private void Update()
    {
        ChangeWeapon();
    }

    private void ChangeWeapon()
    {
        int inputIndex = 0;
        if (int.TryParse(Input.inputString, out inputIndex) && (inputIndex > 0 && inputIndex < holdingWeapons.Length))
            SetArsenal(inputIndex);
    }

    public void SetArsenal(int number)
    {
        if (rightGunBone.childCount > 0)
            Destroy(rightGunBone.GetChild(0).gameObject);
        GameObject newRightGun = Instantiate(holdingWeapons[number - 1], rightGunBone.position, rightGunBone.rotation);
        newRightGun.transform.parent = rightGunBone;
        newRightGun.transform.localPosition = new Vector3(-0.253f, 0.0194f, 0.0072f);
        newRightGun.transform.localRotation = Quaternion.Euler(0, -90, 0);


        if (newRightGun.GetComponent<WeaponBase>().WeaponSetting.weaponType == WeaponType.Handgun)
        {
            animator.runtimeAnimatorController = controllers[0];
        }
        else if(newRightGun.GetComponent<WeaponBase>().WeaponSetting.weaponType == WeaponType.Shotgun)
        {
            animator.runtimeAnimatorController= controllers[1];
        }
        else if (newRightGun.GetComponent<WeaponBase>().WeaponSetting.weaponType == WeaponType.HeavyWeapon)
        {
            animator.runtimeAnimatorController = controllers[1];
        }
    }
}
