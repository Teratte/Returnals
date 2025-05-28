using System;
using UnityEngine;
using System.Collections.Generic;

[System.Serializable]
public struct IngredientData
{

    public List<Ingredient> ingredients;            // 필요한 재료들과 그 각각의 개수
    public Sprite icon;                             // 해당 아이템 아이콘
    [TextArea(0, 30)]
    public string information;                      // 해당 아이템에 대한 설명
}

[System.Serializable]
public struct Ingredient
{
    public Item ingredient;               // 필요한 재료
    public int count;                           // 필요한 개수

}