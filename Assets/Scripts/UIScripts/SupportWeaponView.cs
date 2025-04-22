using UnityEngine;
using UnityEngine.UI;

public class SupportWeaponView : MonoBehaviour
{
    [SerializeField]
    private Image subWeaponIcon;
    [SerializeField]
    private Image backGround;
    
    private PlayerAnimator playerAnimator;
    private Color currentColor = Color.gray;
    private WeaponBase subWeapon;

    private void Awake()
    {
        playerAnimator = FindAnyObjectByType<PlayerAnimator>();
    }

    private void Start()
    {
        subWeapon = GameManager.instance.subWeapon.GetComponent<WeaponBase>();
        if(subWeapon != null )
        {
            subWeaponIcon.sprite = subWeapon.WeaponIcon;
        }
    }

    private void Update()
    {
        if (playerAnimator.Weapon.WeaponType == WeaponList.Support)
            backGround.color = Color.white;
        else
            backGround.color = currentColor;
    }
}
