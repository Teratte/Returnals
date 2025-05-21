// Designed by KINEMATION, 2025.

using GDS.Core;
using KINEMATION.FPSAnimationPack.Scripts.Camera;
using KINEMATION.FPSAnimationPack.Scripts.Sounds;
using KINEMATION.KAnimationCore.Runtime.Core;
using KINEMATION.ProceduralRecoilAnimationSystem.Runtime;
using Unity.VisualScripting;
using UnityEngine;

namespace KINEMATION.FPSAnimationPack.Scripts.Weapon
{
    public class FPSWeapon : MonoBehaviour, IAmmoProvider
    {
        public WeaponAttribute weaponAttribute; // 무기 속성
        public WeaponType weaponType;           // 무기 종류

        [SerializeField]
        private Sprite weaponIcon;                // 무기 아이콘
        [SerializeField]
        private Transform fireTransform;          // 탄알이 날라가는 위치
        [SerializeField]
        private ShotEffect shotEffect;            // 발사 이펙트 관련 정보들
        [SerializeField]
        private float damage;                     // 무기 데미지

        [Header("Shotgun")]
        [SerializeField]
        private int bulletsPerShot;
        [SerializeField]
        private float inaccuracyDitance;
        private int maxAmmo;                      // 최대 가지고 있는 탄알
        private bool onSubMagazine = false;       // 보조 탄창 가젯 발동 여부

        public Sprite WeaponIcon => weaponIcon;   // 무기 아이콘

        public float UnEquipDelay => unEquipDelay;
        public FireMode ActiveFireMode => fireMode;

        public FPSWeaponSettings weaponSettings;
        public Transform aimPoint;

        [SerializeField] protected FireMode fireMode = FireMode.Semi;

        [HideInInspector] public KTransform rightHandPose;
        [HideInInspector] public KTransform adsPose;

        protected GameObject ownerPlayer;
        protected RecoilAnimation recoilAnimation;
        protected FPSWeaponSound weaponSound;

        protected Animator characterAnimator;
        protected Animator weaponAnimator;

        protected static int RELOAD_EMPTY = Animator.StringToHash("Reload_Empty");
        protected static int RELOAD_TAC = Animator.StringToHash("Reload_Tac");
        protected static int FIRE = Animator.StringToHash("Fire");
        protected static int FIREOUT = Animator.StringToHash("FireOut");

        protected static int EQUIP = Animator.StringToHash("Equip");
        protected static int EQUIP_OVERRIDE = Animator.StringToHash("Equip_Override");
        protected static int UNEQUIP = Animator.StringToHash("UnEquip");
        protected static int IDLE = Animator.StringToHash("Idle");

        protected float unEquipDelay;
        protected float emptyReloadDelay;
        protected float tacReloadDelay;

        protected int _activeAmmo;  // 현재 남아있는 탄알

        public int CurrentAmmo => _activeAmmo;  // 현재 남아있는 탄알
        public int MaxAmmo => maxAmmo;

        protected bool _isReloading;
        protected bool _isFiring;
        [SerializeField]
        protected bool _isRevolver; // 현재 총이 리볼버인가

        protected FPSCameraAnimator cameraAnimator;

        public bool IsReloading => _isReloading;    // 재장전 중인가를 검사
        public bool OnSubMagazine
        {
            get => onSubMagazine;
            set => onSubMagazine = value;
        }

        public virtual void Initialize(GameObject owner)
        {
            ownerPlayer = owner;
            recoilAnimation = owner.GetComponent<RecoilAnimation>();
            characterAnimator = owner.GetComponent<Animator>();

            _activeAmmo = weaponSettings.ammo;

            weaponAnimator = GetComponentInChildren<Animator>();
            if (weaponAnimator == null)
            {
                Debug.LogWarning("FPSWeapon: Animator not found!");
            }

            weaponSound = GetComponentInChildren<FPSWeaponSound>();
            if (weaponSound == null)
            {
                Debug.LogWarning("FPSWeapon: FPS Weapon Sound not found!");
            }

            if (Mathf.Approximately(weaponSettings.fireRate, 0f))
            {
                Debug.LogWarning("FPSWeapon: Fire Rate is ZERO, setting it to default 600.");
                weaponSettings.fireRate = 600f;
            }

            AnimationClip idlePose = null;

            foreach (var clip in weaponSettings.characterController.animationClips)
            {
                if (clip.name.Contains("Reload"))
                {
                    if (clip.name.Contains("Tac")) tacReloadDelay = clip.length;
                    if (clip.name.Contains("Empty")) emptyReloadDelay = clip.length;
                    continue;
                }

                if (clip.name.ToLower().Contains("unequip"))
                {
                    unEquipDelay = clip.length;
                    continue;
                }

                if (idlePose != null) continue;
                if (clip.name.Contains("Idle") || clip.name.Contains("Pose")) idlePose = clip;
            }

            if (idlePose != null)
            {
                idlePose.SampleAnimation(ownerPlayer, 0f);
            }

            cameraAnimator = owner.transform.parent.GetComponentInChildren<FPSCameraAnimator>();

            SetUpAmmo();
        }

        public void SetUpAmmo()
        {
            maxAmmo = GameManager.instance.MaxAmmo[weaponType.ToString()];
        }

        public int GetActiveMaxAmmo()
        {
            if(GameManager.instance.MaxAmmo.ContainsKey(weaponType.ToString()))
            {
                return GameManager.instance.MaxAmmo [weaponType.ToString()];
            }

            return 999;
        }

        public void UpdateMaxAmmo()
        {
            GameManager.instance.MaxAmmo[weaponType.ToString()] = maxAmmo;
        }

        public virtual void OnReload()
        {
            if (_activeAmmo == weaponSettings.ammo || _isReloading || maxAmmo <= 0) return;

            _isReloading = true;
            var reloadHash = _activeAmmo == 0 ? RELOAD_EMPTY : RELOAD_TAC;
            characterAnimator.Play(reloadHash, -1, 0f);
            weaponAnimator.Play(reloadHash, -1, 0f);

            float delay = _activeAmmo == 0 ? emptyReloadDelay : tacReloadDelay;
            if (_isRevolver)
                delay = emptyReloadDelay;
            Invoke(nameof(ResetActiveAmmo), delay * weaponSettings.ammoResetTimeScale);
        }

        public void OnFireModeChange()
        {
            fireMode = fireMode == FireMode.Auto ? FireMode.Semi : weaponSettings.fullAuto ? FireMode.Auto : FireMode.Semi;
            recoilAnimation.fireMode = fireMode;
        }

        public void OnEquipped_Immediate()
        {
            characterAnimator.runtimeAnimatorController = weaponSettings.characterController;
            weaponAnimator.Play(IDLE, -1, 0f);
            recoilAnimation.Init(weaponSettings.recoilAnimData, weaponSettings.fireRate, fireMode);
        }

        public void OnEquipped(bool fastEquip = false)
        {
            characterAnimator.runtimeAnimatorController = weaponSettings.characterController;
            recoilAnimation.Init(weaponSettings.recoilAnimData, weaponSettings.fireRate, fireMode);

            // Reset the default pose to idle.
            characterAnimator.Play(IDLE, -1, 0f);

            // Play the equip animation.
            if (weaponSettings.hasEquipOverride)
            {
                characterAnimator.Play("IKMovement", -1, 0f);
                characterAnimator.Play(fastEquip ? EQUIP : EQUIP_OVERRIDE, -1, 0f);
                return;
            }

            // Play the curve-based equipping animation.
            characterAnimator.Play(EQUIP, -1, 0f);
        }

        public float OnUnEquipped()
        {
            characterAnimator.SetTrigger(UNEQUIP);
            return unEquipDelay + 0.05f;
        }

        public void OnFirePressed()
        {
            if (_isReloading)
                return;
            _isFiring = true;
            OnFire();
        }

        public void OnFireReleased()
        {
            _isFiring = false;
            recoilAnimation.Stop();
        }

        private void OnFire()
        {
            if (!_isFiring || _isReloading) return;

            if (_activeAmmo == 0)
            {
                OnFireReleased();
                return;
            }

            recoilAnimation.Play();
            if (weaponSound != null) weaponSound.PlayFireSound();
            if (cameraAnimator != null) cameraAnimator.PlayCameraShake(weaponSettings.cameraShake);

            if (weaponSettings.useFireClip) characterAnimator.Play(FIRE, -1, 0f);
            weaponAnimator.Play(weaponSettings.hasFireOut && _activeAmmo == 1
                ? FIREOUT
                : FIRE, -1, 0f);

            if(!onSubMagazine)
                _activeAmmo--;

            // 발사 이펙트 재생
            RayCast();
            OnMuzzleEffect();
            if (fireMode == FireMode.Semi) return;
            Invoke(nameof(OnFire), 60f / weaponSettings.fireRate);
        }

        protected void ResetActiveAmmo()
        {
            int ammoToFill = weaponSettings.ammo - _activeAmmo; // 채워야할 탄알 수

            if (ammoToFill >= GetActiveMaxAmmo())
            {
                ammoToFill = GetActiveMaxAmmo();
            }

            if (weaponAttribute == WeaponAttribute.Support)
                _activeAmmo = weaponSettings.ammo;
            else
            {
                _activeAmmo += ammoToFill;
                maxAmmo -= ammoToFill;
            }

            UpdateMaxAmmo();
            _isReloading = false;
        }

        public int GetActiveAmmo()
        {
            return _activeAmmo;
        }

        public int GetMaxAmmo()
        {
            return weaponSettings.ammo;
        }

        public void RayCast()
        {
            RaycastHit hit;
            Vector3 hitPosition = Vector3.zero;
            if (Physics.Raycast(fireTransform.position, fireTransform.forward, out hit, 50.0f))
            {
                hitPosition = hit.point;
            }
            else
            {
                hitPosition = fireTransform.position + fireTransform.forward * 50.0f;
            }

            Vector3 direction = (hitPosition - fireTransform.position).normalized;

            for (int i = 0; i < bulletsPerShot; i++)
            {
                if (Physics.Raycast(fireTransform.position, GetShootingDirection(direction), out hit))
                {
                    // 레이가 어떤 물체와 충돌한 경우,
                    IDamageable target = hit.collider.gameObject.GetComponent<IDamageable>();

                    if (target != null)
                    {
                        Instantiate(shotEffect.monsterImpact, hit.point, hit.transform.rotation);
                        target.OnDamage(damage);
                    }
                    else
                    {
                        Instantiate(shotEffect.impact, hit.point, hit.transform.rotation);
                    }
                }
                else
                {
                    Instantiate(shotEffect.impact, hit.point, Quaternion.identity);
                }
            }
        }

        Vector3 GetShootingDirection(Vector3 _direction)
        {
            _direction *= 50.0f;
            _direction = new Vector3(
                _direction.x + Random.Range(-inaccuracyDitance, inaccuracyDitance),
                _direction.y + Random.Range(-inaccuracyDitance, inaccuracyDitance),
                _direction.z + Random.Range(-inaccuracyDitance, inaccuracyDitance)
                );

            return _direction.normalized;
        }

        public void OnMuzzleEffect()
        {
            ParticleSystem particle = Instantiate(shotEffect.muzzleEffect, fireTransform);
            particle.transform.position = fireTransform.position;
            particle.Play();
        }
    }
}