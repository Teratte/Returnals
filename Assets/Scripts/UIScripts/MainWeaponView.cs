using UnityEngine;
using UnityEngine.UI;

public class MainWeaponView : MonoBehaviour
{
    [SerializeField]
    private Image mainWeaponIcon;
    [SerializeField]
    private Image backGround;

    private WeaponBase mainWeapon;
    private PlayerAnimator playerAnimator;
    private Color currentColor = Color.gray;

    private void Awake()
    {
        playerAnimator = FindAnyObjectByType<PlayerAnimator>();
    }

    private void Start()
    {
        mainWeapon = GameManager.instance.mainWeapon.GetComponent<WeaponBase>();
        if(mainWeapon != null )
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
