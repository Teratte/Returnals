public enum WeaponType
{
    Handgun,
    Melee,
    AssaultRifle,
    Shotgun,
    Sniper,
    SmallMachinegun,
    HeavyWeapon
}

[System.Serializable]
public struct WeaponSetting
{
    public string weaponName;   // ���� �̸�
    public WeaponType weaponType;   // ���� ����
    public float fireRate;          // �߻� �ֱ�
    public float reloadTime;        // ������ �ð�
    public float distance;          // �߻� ��Ÿ�
    //public int currentAmmo;         // ���� ź�� ��
    //public int maxAmmo;             // �ִ� ź�� ��
    public int maxCapacity;         // źâ �� �ִ� ź�� ��
    public bool isAutomaticAttack;  // ���� ���� ����
    public float damage;            // ������
}
