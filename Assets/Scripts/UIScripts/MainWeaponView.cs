using KINEMATION.FPSAnimationPack.Scripts.Player;
using KINEMATION.FPSAnimationPack.Scripts.Weapon;
using UnityEngine;
using UnityEngine.UI;

public class MainWeaponView : MonoBehaviour
{
    [SerializeField]
    private Image mainWeaponIcon;
    [SerializeField]
    private Image backGround;

    private FPSWeapon mainWeapon;
    private Color currentColor = Color.gray;
    private FPSPlayer player;

    private void Awake()
    {
        player = FindAnyObjectByType<FPSPlayer>();
        mainWeapon = GameManager.instance.mainWeapon.GetComponent<FPSWeapon>();
        if (mainWeapon != null)
        {
            mainWeaponIcon.sprite = mainWeapon.WeaponIcon;
        }
    }

    private void Update()
    {
        if(player.GetActiveWeapon().weaponAttribute == WeaponAttribute.Main)
            backGround.color = Color.white;
        else
            backGround.color = currentColor;
    }
}
