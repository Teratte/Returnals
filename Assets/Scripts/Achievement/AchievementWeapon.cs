using UnityEngine;

public class AchievementWeapon : Achievement
{
    [SerializeField]
    private int requiredWeaponCount = 0;

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
