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
        foreach (var weapon in WeaponObjectPooling.instance.GameObjects)
        {
            UIWeapon newWeapon = weapon.GetComponent<UIWeapon>();
            if (weapon.activeSelf && newWeapon != null)
            {
                if (newWeapon.WeaponType == WeaponAttribute.Gazet)
                    count++;
            }
        }

        return count;
    }
}
