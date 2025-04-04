using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class UIBaseCamp : MonoBehaviour
{
    public static bool inventoryActivated = false;

    [SerializeField]
    private GameObject InventoryObject; // 인벤토리 창
    [SerializeField]
    private GameObject slotsParent;
    private Slot[] slots;

    [Header("Current Weapon")]
    [SerializeField]
    private Image currentWeaponIcon;                // 현재 무기 아이콘
    [SerializeField]
    private TextMeshProUGUI currentWeaponName;      // 현재 무기 이름
    [SerializeField]
    private TextMeshProUGUI currentWeaponDetails;   // 현재 무기 상세정보
    [SerializeField]
    private TextMeshProUGUI currentWeaponStatus;    // 현재 무기 스탯
    [SerializeField]
    private GameObject panelDetail;                 // 무기 상세 정보 창

    private UIWeapon currentWeapon;                 // 현재 무기

    [Header("Holding Weapon List")]
    [SerializeField]
    private Image supportWeapon;        // 보조 무기
    [SerializeField]
    private Image mainWeapon_1;         // 메인 무기1
    [SerializeField]
    private Image mainWeapon_2;         // 메인 무기2
    [SerializeField]
    private Image gazet;                // 가젯

    public Slot[] Slots => slots;

    private void Awake()
    {
        slots = slotsParent.GetComponentsInChildren<Slot>();
        InventoryObject.SetActive(false);
        panelDetail.SetActive(false);
    }

    private void Update()
    {
        // 인벤토리 창 열기
        if (Input.GetKey(KeyCode.Tab))
        {
            inventoryActivated = true;
            InventoryObject.SetActive(true);
        }
        else
        {
            inventoryActivated = false;
            InventoryObject.SetActive(false);
        }
    }

    public void UpdateCurrentWeapon(UIWeapon current)
    {
        panelDetail.SetActive(true);
        currentWeapon = current;

        currentWeaponIcon.sprite = current.Icon;
        currentWeaponName.text = current.Name;
        currentWeaponDetails.text = current.Details;
        currentWeaponStatus.text = current.WeaponStatus;
    }

    public void AddWeapon(UIWeapon current)
    {
        GameManager.instance.holdingWeaponPrefabs.Add(current.WeaponPrefab);
        if (current.WeaponType == WeaponAttribute.Support)
        {
            supportWeapon.sprite = current.Icon;
            //GameManager.instance.holdingWeaponPrefabs[0] = current.WeaponPrefab;
        }
        else if (current.WeaponType == WeaponAttribute.Main)
        {
            if (GameManager.instance.holdingWeaponPrefabs.Count < 2)
            {
                mainWeapon_1.sprite = current.Icon;
                //GameManager.instance.holdingWeaponPrefabs[1] = current.WeaponPrefab;
            }
            else if (GameManager.instance.holdingWeaponPrefabs.Count < 3)
            {
                mainWeapon_2.sprite = current.Icon;
                //GameManager.instance.holdingWeaponPrefabs[2] = current.WeaponPrefab;
            }
        }
    }
}