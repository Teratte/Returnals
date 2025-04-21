using UnityEngine;

public class PanelWeaponSelect : MonoBehaviour
{
    [SerializeField]
    private GameObject holdingWeaponsParent;

    private void OnEnable()
    {
        foreach(Transform child in holdingWeaponsParent.transform)
            Destroy(child.gameObject);

        foreach(GameObject weapon in GameManager.instance.selectWeaponList)
        {
            Instantiate(weapon, holdingWeaponsParent.transform);
            weapon.transform.parent = holdingWeaponsParent.transform;
        }
    }
}
