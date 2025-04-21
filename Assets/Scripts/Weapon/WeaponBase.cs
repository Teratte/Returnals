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
    public Transform leftHandle;            // 왼쪽 손잡이

    protected float lastAttackTime = 0;     // 마지막 발사 시간 체크
    protected bool isReload = false;        // 재장전 중인지 체크
    protected bool isAttack = false;        // 공격 여부 체크용
    protected AudioSource audioSource;      // 사운드 재생 컴포넌트

    public string weaponName => weaponSetting.weaponName;
    public int CurrentAmmo => weaponSetting.currentAmmo;
    public int MaxAmmo => weaponSetting.maxAmmo;
    public WeaponSetting WeaponSetting => weaponSetting;
    public RuntimeAnimatorController RuntimeAnimatorController => runtimeAnimatorController;
    public bool IsReload => isReload;

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
        weaponSetting.currentAmmo = weaponSetting.maxCapacity;
    }

    public enum WeaponList
    {
        Main,
        Support,
    }
}
