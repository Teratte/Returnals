using UnityEngine;
using UnityEngine.EventSystems;
using System.Collections.Generic;

public class UIIngredient : MonoBehaviour, IPointerClickHandler
{
    [SerializeField]
    private IngredientData ingredientData;
    [SerializeField]
    private ProduceTable produceTable;
    [SerializeField]
    private UIBaseCamp uiBaseCamp;
    [SerializeField]
    private GameObject selectWeaponObject;  // 무기 선택창에 추가할 슬롯
    [SerializeField]
    private WeaponType weaponType;
    [SerializeField]
    private int createAmmo = 10;

    public Sprite Icon => ingredientData.icon;
    public string Information => ingredientData.information;
    public List<Ingredient> Ingredients => ingredientData.ingredients;

    public void OnPointerClick(PointerEventData eventData)
    {
        produceTable.UpdateInformation(this);
    }

    public bool HasIngredients()
    {
        // 레시피 조회
        foreach (Ingredient receipe in ingredientData.ingredients)
        {
            if (!GameManager.instance.Items.ContainsKey(receipe.ingredient) || GameManager.instance.Items[receipe.ingredient] < receipe.count)
                return false;
        }
        return true;
    }

    // 무기 제작
    public void CraftWeapon()
    {
        if(!HasIngredients())
        {
            Debug.Log("제작 불가!");
            return;
        }

        // 재료 차감
        foreach(Ingredient receipe in ingredientData.ingredients)
        {
            foreach(Slot slot in uiBaseCamp.Slots)
            {
                if(receipe.ingredient == slot.item)
                {
                    slot.SetSlotCount(-receipe.count);
                }
            }
            // 게임매니저에 저장되어있던 아이템 목록에도 차감
            if(GameManager.instance.Items.ContainsKey(receipe.ingredient))
            {
                GameManager.instance.Items[receipe.ingredient] -= receipe.count;
                // 만약 0이 되면 제거
                if(GameManager.instance.Items[receipe.ingredient] <= 0)
                    GameManager.instance.Items.Remove(receipe.ingredient);
            }
        }
        produceTable.UpdateInformation(this);

        // 무기생성
        Debug.Log("제작 성공!");
        GameManager.instance.selectWeaponList.Add(selectWeaponObject);  // 무기 선택 리스트에 해당 무기 선택 버튼 추가
    }

    public void CraftAmmo()
    {
        if (!HasIngredients())
        {
            Debug.Log("제작 불가!");
            return;
        }

        // 재료 차감
        foreach (Ingredient receipe in ingredientData.ingredients)
        {
            foreach (Slot slot in uiBaseCamp.Slots)
            {
                if (receipe.ingredient == slot.item)
                {
                    slot.SetSlotCount(-receipe.count);
                }
            }
            // 게임매니저에 저장되어있던 아이템 목록에도 차감
            if (GameManager.instance.Items.ContainsKey(receipe.ingredient))
            {
                GameManager.instance.Items[receipe.ingredient] -= receipe.count;
                // 만약 0이 되면 제거
                if (GameManager.instance.Items[receipe.ingredient] <= 0)
                    GameManager.instance.Items.Remove(receipe.ingredient);
            }
        }
        produceTable.UpdateInformation(this);

        Debug.Log("탄알 제작 성공!");
        // 탄알 생성(종류별로 생성)
        if(GameManager.instance.MaxAmmo.ContainsKey(weaponType.ToString()))
        {
            GameManager.instance.MaxAmmo[weaponType.ToString()] += createAmmo;
        }
    }

    public void CraftFurniture()
    {
        if (!HasIngredients())
        {
            Debug.Log("제작 불가!");
            return;
        }

        // 재료 차감
        foreach (Ingredient receipe in ingredientData.ingredients)
        {
            foreach (Slot slot in uiBaseCamp.Slots)
            {
                if (receipe.ingredient == slot.item)
                {
                    slot.SetSlotCount(-receipe.count);
                }
            }
            // 게임매니저에 저장되어있던 아이템 목록에도 차감
            if (GameManager.instance.Items.ContainsKey(receipe.ingredient))
            {
                GameManager.instance.Items[receipe.ingredient] -= receipe.count;
                // 만약 0이 되면 제거
                if (GameManager.instance.Items[receipe.ingredient] <= 0)
                    GameManager.instance.Items.Remove(receipe.ingredient);
            }
        }
        produceTable.UpdateInformation(this);

        Debug.Log("가구 제작 성공!");
        selectWeaponObject.SetActive(true);
    }
}
