using UnityEngine;
using UnityEngine.EventSystems;

public class UIWeapon : MonoBehaviour, IPointerClickHandler, IPointerEnterHandler
{
    [SerializeField]
    private WeaponData weaponData;
    [SerializeField]
    private GameObject weaponPrefab;


    private UIBaseCamp uiBaseCamp;

    public bool isBaseWeapon = false;   // 기본으로 제공되는 무기인가

    public Sprite Icon => weaponData.icon;
    public string Name => weaponData.name;
    public string Details => weaponData.details;
    public string WeaponStatus => weaponData.weaponStatus;
    public WeaponAttribute WeaponType => weaponData.type;
    public GameObject WeaponPrefab => weaponPrefab;

    private void Awake()
    {
        uiBaseCamp = FindAnyObjectByType<UIBaseCamp>();
    }

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
        }
    }
}
