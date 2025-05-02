using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class ProduceTable : MonoBehaviour
{
    [SerializeField]
    private GameObject[] Panels;    // 카테고리 패널들
    [SerializeField]
    private Image currentItem;      // 현재 아이템 아이콘
    [SerializeField]
    private TextMeshProUGUI currentInformation; // 현재 아이템에 대한 설명
    [SerializeField]
    private GameObject selectedItem;            // 선택된 아이템 이미지 오브젝트
    [SerializeField]
    private GameObject requireSlotsParent;      // 필요한 재료들의 부모 오브젝트
    [SerializeField]
    private UIBaseCamp uiBaseCamp;              // UIBaseCamp

    private RequireingredientSlot[] requireingredientSlots; // 필요한 재료들

    private UIIngredient currentItemInformation = null;   // 현재 보여지는 아이템

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

    public void UpdateInformation(UIIngredient uiIngredient)            // 제작할 아이템 선택
    {
        selectedItem.SetActive(true);

        currentItem.sprite = uiIngredient.Icon;
        currentInformation.text = uiIngredient.Information;

        // 재료 슬롯 초기화
        foreach(RequireingredientSlot slot in requireingredientSlots)
            slot.ClearSlot();

        // 필요한 재료 목록들을 순환하면서 내가 가지고 있는 아이템 개수를 계산하여 필요한 재료 슬롯 업데이트
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

    // 필요한 재료 슬롯 업데이트 함수
    public void AcquireIngredient(Item _item, int _currentCount, int _maxCount)
    {
        // 아이템 타입이 장비가 아니라면
        if (Item.ItemType.Equipment != _item.itemType)
        {
            // 필요 재료 슬롯들을 순환하면서 아이템이 비어있으면 업데이트
            for (int i = 0; i < requireingredientSlots.Length; i++)
            {
                if (requireingredientSlots[i].item == null)
                {
                    Debug.Log("추가");
                    requireingredientSlots[i].SetIngredient(_item, _currentCount, _maxCount);
                    return;
                }
            }
        }
    }
}
