using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class ItemManager : MonoBehaviour
{
    public static ItemManager Instance { get; private set; }

    public Dictionary<Item,int> items = new Dictionary<Item,int>();  // �� ���ӿ��� ���� ������ ����
    private void Awake()
    {
        if(Instance != null && Instance != this)
        {
            Destroy(gameObject);
            return;
        }

        Instance = this;
        DontDestroyOnLoad(gameObject);
    }

    public void AddItem(Item item, int count =1)
    {
        if(items.ContainsKey(item))
        {
            items[item] += count;
        }
        else
        {
            items.Add(item, count);
        }
    }

    public void ClearItem()
    {
        items.Clear();
    }
}
