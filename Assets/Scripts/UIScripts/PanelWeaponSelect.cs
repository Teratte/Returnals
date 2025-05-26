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
        foreach (GameObject weapon in GameManager.instance.selectWeaponList)
        {
            UIWeapon newWeapon = weapon.GetComponent<UIWeapon>();
            if (newWeapon != null)
            {
                if (newWeapon.WeaponType == WeaponAttribute.Support)
                    Instantiate(weapon, SubWeaponsParent.transform);
                else if(newWeapon.WeaponType == WeaponAttribute.Main)
                    Instantiate(weapon, MainWeaponsParent.transform);
                else if(newWeapon.WeaponType == WeaponAttribute.Gazet)
                    Instantiate(weapon, GazetParent.transform);
            }
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
