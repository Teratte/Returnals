using UnityEngine;
using UnityEngine.EventSystems;

public class UIWeapon : MonoBehaviour, IPointerClickHandler, IPointerEnterHandler
{
    [SerializeField]
    private WeaponData weaponData;
    [SerializeField]
    private UIBaseCamp uiBaseCamp;
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
            uiBaseCamp.UpdateCurrentWeapon(this);
        }
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        if(Icon != null)
        {
            uiBaseCamp.AddWeapon(this);
            //Destroy(gameObject);
        }
    }
}
