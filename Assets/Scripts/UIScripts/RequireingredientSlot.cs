using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class RequireingredientSlot : MonoBehaviour
{
    public Item item;                   // �ش� ���
    public Image ingredientImage;       // ��� �̹���
    public TextMeshProUGUI countText;   // �ʿ��� ��� ����(���� ������ �ִ� ��� ���� / �ʿ��� ��� ����)

    public void SetIngredient(Item _item, int currentCount, int requireCount=1)
    {
        item = _item;
        ingredientImage.sprite = _item.itemSprite;
        countText.text = $"{currentCount} / {requireCount}";
        SetImageColor(1);
        SetTextColor(1);
    }

    private void SetImageColor(float alpha)
    {
        Color color = ingredientImage.color;
        color.a = alpha;
        ingredientImage.color = color;
    }

    private void SetTextColor(float alpha)
    {
        Color color = countText.color;
        color.a = alpha;
        countText.color = color;
    }

    public void ClearSlot()
    {
        item = null;
        SetImageColor(0);
        ingredientImage.sprite = null;
        countText.text = "";
        SetTextColor(0);
    }
}
