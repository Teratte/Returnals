using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Slot : MonoBehaviour
{
    public Item item;   // 획득한 아이템
    public int itemCount;   // 아이템 개수
    public Image itemImage;// 아이템 이미지

    // 필요한 컴포넌트
    [SerializeField]
    private Text text_Count;            // 개수 텍스트
    [SerializeField]
    private GameObject go_CountImage;   // 아이템 개수를 보여주는 이미지
    
    // 이미지 투명도 조정
    private void SetColor(float _alpha)
    {
        Color color = itemImage.color;
        color.a = _alpha;
        itemImage.color = color;
    }

    // 아이템 획득
    public void AddItem(Item _item, int _count = 1)
    {
        item = _item;
        itemCount = _count;
        itemImage.sprite = item.itemSprite;


        if(item.itemType != Item.ItemType.Equipment)
        {
            go_CountImage.SetActive(true);
            text_Count.text = "x" + itemCount.ToString();
        }
        else
        {
            text_Count.text = "0";
            go_CountImage.SetActive(false);
        }

        SetColor(1);
    }

    // 아이템 개수 조정
    public void SetSlotCount(int _count)
    {
        itemCount += _count;
        text_Count.text = "x" + itemCount.ToString();

        if (itemCount <= 0)
        {
            ClearSlot();
        }
    }

    // 슬롯 초기화
    private void ClearSlot()
    {
        item = null;
        itemCount = 0;
        itemImage.sprite = null;
        SetColor(0);

        text_Count.text = "0";
        go_CountImage.SetActive(false);
    }
}
