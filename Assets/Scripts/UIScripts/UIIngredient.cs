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
    private GameObject selectWeaponObject;  // ���� ����â�� �߰��� ����
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
        // ������ ��ȸ
        foreach (Ingredient receipe in ingredientData.ingredients)
        {
            if (!GameManager.instance.Items.ContainsKey(receipe.ingredient) || GameManager.instance.Items[receipe.ingredient] < receipe.count)
                return false;
        }
        return true;
    }

    // ���� ����
    public void CraftWeapon()
    {
        if(!HasIngredients() || selectWeaponObject.activeSelf)
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
            // ���ӸŴ����� ����Ǿ��ִ� ������ ��Ͽ��� ����
            if(GameManager.instance.Items.ContainsKey(receipe.ingredient))
            {
                GameManager.instance.Items[receipe.ingredient] -= receipe.count;
                // ���� 0�� �Ǹ� ����
                if(GameManager.instance.Items[receipe.ingredient] <= 0)
                    GameManager.instance.Items.Remove(receipe.ingredient);
            }
        }
        produceTable.UpdateInformation(this);

        // �������
        Debug.Log("���� ����!");
        if(!selectWeaponObject.activeSelf)
        {
            selectWeaponObject.SetActive(true);
        }
    }

    public void CraftAmmo()
    {
        if (!HasIngredients())
        {
            Debug.Log("���� �Ұ�!");
            return;
        }

        // ��� ����
        foreach (Ingredient receipe in ingredientData.ingredients)
        {
            foreach (Slot slot in uiBaseCamp.Slots)
            {
                if (receipe.ingredient == slot.item)
                {
                    slot.SetSlotCount(-receipe.count);
                }
            }
            // ���ӸŴ����� ����Ǿ��ִ� ������ ��Ͽ��� ����
            if (GameManager.instance.Items.ContainsKey(receipe.ingredient))
            {
                GameManager.instance.Items[receipe.ingredient] -= receipe.count;
                // ���� 0�� �Ǹ� ����
                if (GameManager.instance.Items[receipe.ingredient] <= 0)
                    GameManager.instance.Items.Remove(receipe.ingredient);
            }
        }
        produceTable.UpdateInformation(this);

        Debug.Log("ź�� ���� ����!");
        // ź�� ����(�������� ����)
        if(GameManager.instance.MaxAmmo.ContainsKey(weaponType.ToString()))
        {
            GameManager.instance.MaxAmmo[weaponType.ToString()] += createAmmo;
        }
    }

    public void CraftFurniture()
    {
        var furniture = selectWeaponObject.GetComponent<Furniture>();

        if (!HasIngredients() || GameManager.instance.Furnitures[furniture.FurnitureName])
        {
            Debug.Log("���� �Ұ�!");
            return;
        }

        // ��� ����
        foreach (Ingredient receipe in ingredientData.ingredients)
        {
            foreach (Slot slot in uiBaseCamp.Slots)
            {
                if (receipe.ingredient == slot.item)
                {
                    slot.SetSlotCount(-receipe.count);
                }
            }
            // ���ӸŴ����� ����Ǿ��ִ� ������ ��Ͽ��� ����
            if (GameManager.instance.Items.ContainsKey(receipe.ingredient))
            {
                GameManager.instance.Items[receipe.ingredient] -= receipe.count;
                // ���� 0�� �Ǹ� ����
                if (GameManager.instance.Items[receipe.ingredient] <= 0)
                    GameManager.instance.Items.Remove(receipe.ingredient);
            }
        }
        produceTable.UpdateInformation(this);

        Debug.Log("���� ���� ����!");
        selectWeaponObject.SetActive(true);
        
        // ���� ��ųʸ��� ���ԵǾ� ���� �ʴٸ� �߰�.
        if(!GameManager.instance.Furnitures[furniture.FurnitureName])
        {
            GameManager.instance.Furnitures[furniture.FurnitureName] = true;
        }
    }
}
