using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class UIBaseCamp : MonoBehaviour
{
    public static bool inventoryActivated = false;

    [SerializeField]
    private GameObject InventoryObject; // �κ��丮 â
    [SerializeField]
    private GameObject slotsParent;
    private Slot[] slots;

    [Header("Current Weapon")]
    [SerializeField]
    private Image currentWeaponIcon;                // ���� ���� ������
    [SerializeField]
    private TextMeshProUGUI currentWeaponName;      // ���� ���� �̸�
    [SerializeField]
    private TextMeshProUGUI currentWeaponDetails;   // ���� ���� ������
    [SerializeField]
    private TextMeshProUGUI currentWeaponStatus;    // ���� ���� ����
    [SerializeField]
    private GameObject panelDetail;                 // ���� �� ���� â

    private UIWeapon currentWeapon;                 // ���� ����

    [Header("Holding Weapon List")]
    [SerializeField]
    private Image supportWeapon;        // ���� ����
    [SerializeField]
    private Image mainWeapon_1;         // ���� ����1
    [SerializeField]
    private Image mainWeapon_2;         // ���� ����2
    [SerializeField]
    private Image gazet;                // ����

    public Slot[] Slots => slots;

    private void Awake()
    {
        slots = slotsParent.GetComponentsInChildren<Slot>();
        InventoryObject.SetActive(false);
        panelDetail.SetActive(false);
    }

    private void Update()
    {
        // �κ��丮 â ����
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