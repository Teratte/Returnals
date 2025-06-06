using UnityEngine;

public abstract class WeaponBase : MonoBehaviour
{
    [Header("WeaponBase")]
    [SerializeField]
    protected WeaponList weaponlist;        // 무기 종류
    [SerializeField]
    protected WeaponSetting weaponSetting;  // 무기 설정
    [SerializeField]
    protected RuntimeAnimatorController runtimeAnimatorController;
    [SerializeField]
    protected Sprite weaponIcon;            // 무기 아이콘 -> 인게임 UI에 표시할 때 필요
    public Transform leftHandle;            // 왼쪽 손잡이

    protected float lastAttackTime = 0;     // 마지막 발사 시간 체크
    protected bool isReload = false;        // 재장전 중인지 체크
    protected bool isAttack = true;        // 공격 여부 체크용
    protected AudioSource audioSource;      // 사운드 재생 컴포넌트

    public bool onSubMagazine = false;      // 보조 탄창 가젯 발동 여부
    public string weaponName => weaponSetting.weaponName;
    public int CurrentAmmo;
    public int MaxAmmo;
    public WeaponSetting WeaponSetting => weaponSetting;
    public RuntimeAnimatorController RuntimeAnimatorController => runtimeAnimatorController;
    public bool IsReload => isReload;
    public bool IsAttack => isAttack;

    public Sprite WeaponIcon => weaponIcon;
    public WeaponList WeaponType => weaponlist;

    public abstract void StartWeaponAction(int type = 0);
    public abstract void StopWeaponAction(int type = 0);
    public abstract void StartReload();

    protected void PlaySound(AudioClip clip)
    {
        audioSource.PlayOneShot(clip);
    }

    protected void Setup()
    {
        audioSource = GetComponent<AudioSource>();
    }
}

public enum WeaponList
{
    Main,
    Support
}
