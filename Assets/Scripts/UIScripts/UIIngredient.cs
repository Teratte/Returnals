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

            if(GameManager.instance.Items.ContainsKey(receipe.ingredient))
                GameManager.instance.Items[receipe.ingredient] -= receipe.count;
        }
        produceTable.UpdateInformation(this);

        // 무기생성
        Debug.Log("제작 성공!");
    }
}
