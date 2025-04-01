using UnityEngine;

[System.Serializable]
public struct ItemData
{
    public Sprite icon; // 아이템 아이콘
    public string name; // 아이템 이름
    public int count;   // 아이템 개수
    [TextArea(0, 30)]
    public string details; // 아이템 설명
    public int hpRecover;  // 아이템 사용 효과 (체력 회복)
}
