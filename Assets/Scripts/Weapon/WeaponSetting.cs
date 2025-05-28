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
    public string weaponName;   // 무기 이름
    public WeaponType weaponType;   // 무기 종류
    public float fireRate;          // 발사 주기
    public float reloadTime;        // 재장전 시간
    public float distance;          // 발사 사거리
    //public int currentAmmo;         // 현재 탄약 수
    //public int maxAmmo;             // 최대 탄약 수
    public int maxCapacity;         // 탄창 당 최대 탄약 수
    public bool isAutomaticAttack;  // 연속 공격 여부
    public float damage;            // 데미지
}
