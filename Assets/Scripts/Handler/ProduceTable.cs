using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class ProduceTable : MonoBehaviour
{
    [SerializeField]
    private GameObject[] Panels;    // ī�װ� �гε�
    [SerializeField]
    private Image currentItem;      // ���� ������ ������
    [SerializeField]
    private TextMeshProUGUI currentInformation; // ���� �����ۿ� ���� ����
    [SerializeField]
    private GameObject selectedItem;            // ���õ� ������ �̹��� ������Ʈ
    [SerializeField]
    private GameObject requireSlotsParent;      // �ʿ��� ������ �θ� ������Ʈ
    [SerializeField]
    private UIBaseCamp uiBaseCamp;              // UIBaseCamp

    private RequireingredientSlot[] requireingredientSlots; // �ʿ��� ����

    private UIIngredient currentItemInformation = null;   // ���� �������� ������

    private void Awake()
    {
        requireingredientSlots = requireSlotsParent.GetComponentsInChildren<RequireingredientSlot>();
    }

    public void ActiveBulletPanel()
    {
        foreach(GameObject panel in Panels)
        {
            panel.SetActive(false);
        }

        Panels[0].SetActive(true);
    }

    public void ActiveWeaponPanel()
    {
        foreach (GameObject panel in Panels)
        {
            panel.SetActive(false);
        }

        Panels[1].SetActive(true);
    }

    public void ActiveGazetPanel()
    {
        foreach (GameObject panel in Panels)
        {
            panel.SetActive(false);
        }

        Panels[2].SetActive(true);
    }

    public void ActiveFurniturePanel()
    {
        foreach (GameObject panel in Panels)
        {
            panel.SetActive(false);
        }

        Panels[3].SetActive(true);
    }

    public void UpdateInformation(UIIngredient uiIngredient)            // ������ ������ ����
    {
        selectedItem.SetActive(true);

        currentItem.sprite = uiIngredient.Icon;
        currentInformation.text = uiIngredient.Information;

        // ��� ���� �ʱ�ȭ
        foreach(RequireingredientSlot slot in requireingredientSlots)
            slot.ClearSlot();

        // �ʿ��� ��� ��ϵ��� ��ȯ�ϸ鼭 ���� ������ �ִ� ������ ������ ����Ͽ� �ʿ��� ��� ���� ������Ʈ
        foreach(Ingredient ingre in uiIngredient.Ingredients)
        {
            int currentCount = 0;
            for(int i = 0;i < uiBaseCamp.Slots.Length;i++)
            {
                if (uiBaseCamp.Slots[i].item == ingre.ingredient)
                    currentCount = uiBaseCamp.Slots[i].itemCount;
            }
            AcquireIngredient(ingre.ingredient, currentCount, ingre.count);
        }

        currentItemInformation = uiIngredient;
    }

    public void TryCreateWeapon()
    {
        currentItemInformation.CraftWeapon();
    }

    public void TryCreateAmmo()
    {
        currentItemInformation.CraftAmmo();
    }

    // �ʿ��� ��� ���� ������Ʈ �Լ�
    public void AcquireIngredient(Item _item, int _currentCount, int _maxCount)
    {
        // ������ Ÿ���� ��� �ƴ϶��
        if (Item.ItemType.Equipment != _item.itemType)
        {
            // �ʿ� ��� ���Ե��� ��ȯ�ϸ鼭 �������� ��������� ������Ʈ
            for (int i = 0; i < requireingredientSlots.Length; i++)
            {
                if (requireingredientSlots[i].item == null)
                {
                    Debug.Log("�߰�");
                    requireingredientSlots[i].SetIngredient(_item, _currentCount, _maxCount);
                    return;
                }
            }
        }
    }
}
