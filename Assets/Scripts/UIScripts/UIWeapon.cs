using UnityEngine;
using UnityEngine.EventSystems;

public class UIWeapon : MonoBehaviour, IPointerClickHandler, IPointerEnterHandler
{
    [SerializeField]
    private WeaponData weaponData;
    [SerializeField]
    private InventoryUI inventoryUI;
    [SerializeField]
    private GameObject weaponPrefab;

    public Sprite Icon => weaponData.icon;
    public string Name => weaponData.name;
    public string Details => weaponData.details;
    public string WeaponStatus => weaponData.weaponStatus;
    public WeaponAttribute WeaponType => weaponData.type;
    public GameObject WeaponPrefab => weaponPrefab;

    public void OnPointerEnter(PointerEventData eventData)
    {
        if (Icon != null)
        {
            inventoryUI.UpdateCurrentWeapon(this);
        }
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        if(Icon != null)
        {
            inventoryUI.AddWeapon(this);
            Destroy(gameObject);
        }
    }
}
