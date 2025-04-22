using System;
using UnityEngine;
using UnityEngine.UI;

public abstract class WeaponBase : MonoBehaviour
{
    [Header("WeaponBase")]
    [SerializeField]
    protected WeaponList weaponlist;        // ���� ����
    [SerializeField]
    protected WeaponSetting weaponSetting;  // ���� ����
    [SerializeField]
    protected RuntimeAnimatorController runtimeAnimatorController;
    [SerializeField]
    protected Sprite weaponIcon;            // ���� ������ -> �ΰ��� UI�� ǥ���� �� �ʿ�
    public Transform leftHandle;            // ���� ������

    protected float lastAttackTime = 0;     // ������ �߻� �ð� üũ
    protected bool isReload = false;        // ������ ������ üũ
    protected bool isAttack = true;        // ���� ���� üũ��
    protected AudioSource audioSource;      // ���� ��� ������Ʈ

    public string weaponName => weaponSetting.weaponName;
    public int CurrentAmmo => weaponSetting.currentAmmo;
    public int MaxAmmo => weaponSetting.maxAmmo;
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
        weaponSetting.currentAmmo = weaponSetting.maxCapacity;
    }
}

public enum WeaponList
{
    Main,
    Support
}
