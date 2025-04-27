using UnityEngine;
using UnityEngine.UI;

public class MainWeaponView : MonoBehaviour
{
    [SerializeField]
    private Image mainWeaponIcon;
    [SerializeField]
    private Image backGround;

    private WeaponBase mainWeapon;
    private Color currentColor = Color.gray;
    private PlayerAnimator playerAnimator;

    private void Awake()
    {
        playerAnimator = FindAnyObjectByType<PlayerAnimator>();
        mainWeapon = GameManager.instance.mainWeapon.GetComponent<WeaponBase>();
        if (mainWeapon != null)
        {
            mainWeaponIcon.sprite = mainWeapon.WeaponIcon;
        }
    }

    private void Update()
    {
        if(playerAnimator.Weapon.WeaponType == WeaponList.Main)
            backGround.color = Color.white;
        else
            backGround.color = currentColor;
    }
}
