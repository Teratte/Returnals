using UnityEngine;

public class AchievementGazet : Achievement
{
    [SerializeField]
    private int requiredGazetCount = 0;

    public override bool Assignment()
    {
        return CountWeapon() >= requiredGazetCount;
    }

    private int CountWeapon()
    {
        int count = 0;
        foreach (var weapon in GameManager.instance.selectWeaponList)
        {
            UIWeapon checkWeapon = weapon.GetComponent<UIWeapon>();
            if (checkWeapon != null)
            {
                if (checkWeapon.WeaponType == WeaponAttribute.Gazet)
                    count++;
            }
        }

        return count;
    }
}
