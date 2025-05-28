using UnityEngine;
public enum WeaponAttribute
{
    Main,
    Support,
    Gazet
}

[System.Serializable]
public struct WeaponData
{
    public Sprite icon; // 무기 아이콘
    public string name; // 무기 이름
    public WeaponAttribute type; // 무기 종류

    [TextArea(0, 30)]
    public string details;  // 무기에 대한 자세한 설명
    [TextArea(0, 30)]
    public string weaponStatus; // 무기에 대한 정보
}
