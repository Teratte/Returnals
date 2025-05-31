using TMPro;
using UnityEngine;

public class AchievementGazet : Achievement
{
    [SerializeField]
    private int requiredGazetCount = 0;
    [SerializeField]
    private TextMeshProUGUI textGadgetCount;

    private void OnEnable()
    {
        textGadgetCount.text = $" (현재 보유 가젯 수 : {CountWeapon()})";
    }

    public override bool Assignment()
    {
        return CountWeapon() >= requiredGazetCount;
    }

    private int CountWeapon()
    {
        int count = 0;
        foreach (var weapon in WeaponObjectPooling.instance.weaponObjects)
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
