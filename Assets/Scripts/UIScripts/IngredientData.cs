using System;
using UnityEngine;
using System.Collections.Generic;

[System.Serializable]
public struct IngredientData
{

    public List<Ingredient> ingredients;            // �ʿ��� ����� �� ������ ����
    public Sprite icon;                             // �ش� ������ ������
    [TextArea(0, 30)]
    public string information;                      // �ش� �����ۿ� ���� ����
}

[System.Serializable]
public struct Ingredient
{
    public Item ingredient;               // �ʿ��� ���
    public int count;                           // �ʿ��� ����

}