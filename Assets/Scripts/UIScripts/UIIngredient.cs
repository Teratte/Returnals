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
        // ������ ��ȸ
        foreach (Ingredient receipe in ingredientData.ingredients)
        {
            if (!uiBaseCamp.items.ContainsKey(receipe.ingredient) || uiBaseCamp.items[receipe.ingredient] < receipe.count)
                return false;
        }
        return true;
    }

    // ���� ����
    public void CraftWeapon()
    {
        if(!HasIngredients())
        {
            Debug.Log("���� �Ұ�!");
            return;
        }

        // ��� ����
        foreach(Ingredient receipe in ingredientData.ingredients)
        {
            foreach(Slot slot in uiBaseCamp.Slots)
            {
                if(receipe.ingredient == slot.item)
                {
                    slot.SetSlotCount(-receipe.count);
                }
            }
        }
        produceTable.UpdateInformation(this);

        // �������
        Debug.Log("���� ����!");
    }
}
