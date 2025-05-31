using TMPro;
using UnityEngine;

public class AchievementWeapon : Achievement
{
    [SerializeField]
    private int requiredWeaponCount = 0;
    [SerializeField]
    private TextMeshProUGUI textWeaponCount;

    private void OnEnable()
    {
        textWeaponCount.text += $" (현재 보유 무기 수 : {CountWeapon()})";
    }

    public override bool Assignment()
    {
        return CountWeapon() >= requiredWeaponCount;
    }

    private int CountWeapon()
    {
        int count = 0;
        foreach(var weapon in WeaponObjectPooling.instance.weaponObjects)
        {
            UIWeapon newWeapon = weapon.GetComponent<UIWeapon>();
            if (weapon.activeSelf && newWeapon != null)
            {
                if(newWeapon.WeaponType != WeaponAttribute.Gazet)
                    count++;
            }
        }

        return count;
    }
}
