using KINEMATION.FPSAnimationPack.Scripts.Player;
using KINEMATION.FPSAnimationPack.Scripts.Weapon;
using UnityEngine;
using UnityEngine.UI;

public class SupportWeaponView : MonoBehaviour
{
    [SerializeField]
    private Image subWeaponIcon;
    [SerializeField]
    private Image backGround;
    
    private FPSPlayer player;
    private Color currentColor = Color.gray;
    private FPSWeapon subWeapon;

    private void Awake()
    {
        player = FindAnyObjectByType<FPSPlayer>();
        subWeapon = GameManager.instance.subWeapon.GetComponent<FPSWeapon>();
        if (subWeapon != null)
        {
            subWeaponIcon.sprite = subWeapon.WeaponIcon;
        }
    }

    private void Update()
    {
        if (player.GetActiveWeapon().weaponAttribute == WeaponAttribute.Support)
            backGround.color = Color.white;
        else
            backGround.color = currentColor;
    }
}
