using UnityEngine;

public class PanelWeaponSelect : MonoBehaviour
{
    [SerializeField]
    private GameObject SubWeaponsParent;
    [SerializeField]
    private GameObject MainWeaponsParent;
    [SerializeField]
    private GameObject GazetParent;

    private void OnEnable()
    {
        foreach (var weapon in WeaponObjectPooling.instance.GameObjects)
        {
            UIWeapon newWeapon = weapon.GetComponent<UIWeapon>();
            if (newWeapon.WeaponType == WeaponAttribute.Support)
                Instantiate(weapon.gameObject, SubWeaponsParent.transform);
            else if (newWeapon.WeaponType == WeaponAttribute.Main)
                Instantiate(weapon.gameObject, MainWeaponsParent.transform);
            else if (newWeapon.WeaponType == WeaponAttribute.Gazet)
                Instantiate(newWeapon.gameObject, GazetParent.transform);
        }
    }

    private void OnDisable()
    {
        foreach (Transform child in SubWeaponsParent.transform)
            Destroy(child.gameObject);
        foreach (Transform child in MainWeaponsParent.transform)
            Destroy(child.gameObject);
        foreach (Transform child in GazetParent.transform)
            Destroy(child.gameObject);

    }
}
