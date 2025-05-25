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
        foreach(var weapon in GameManager.instance.selectWeaponList)
        {
            UIWeapon checkWeapon = weapon.GetComponent<UIWeapon>();
            if (checkWeapon != null)
            {
                if(checkWeapon.WeaponType != WeaponAttribute.Gazet)
                    count++;
            }
        }

        return count;
    }
}
