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
    public Sprite icon; // ���� ������
    public string name; // ���� �̸�
    public WeaponAttribute type; // ���� ����

    [TextArea(0, 30)]
    public string details;  // ���⿡ ���� �ڼ��� ����
    [TextArea(0, 30)]
    public string weaponStatus; // ���⿡ ���� ����
}
