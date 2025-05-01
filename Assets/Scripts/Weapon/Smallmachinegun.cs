using UnityEngine;
using System.Collections;

public class SmallMachinegun : WeaponBase
{
    [SerializeField]
    private GameObject Impact;
    [SerializeField]
    private GameObject monsterImpact;
    [SerializeField]
    private AudioClip fireClip;
    [SerializeField]
    private AudioClip reloadClip;
    [SerializeField]
    private float inaccuracyDitance = 0.5f;

    public Transform fireTransform; // 탄알이 발사될 위치

    public ParticleSystem muzzleFlashEffect; // 총구 화염 효과
    public ParticleSystem shellEjectEffect; // 탄피 배출 효과

    private Camera mainCamera;
    private void Awake()
    {
        base.Setup();
        mainCamera = Camera.main;
        if (GameManager.instance.isFirstStage)
        {
            GameManager.instance.currentSMGAmmo = weaponSetting.maxCapacity;
            GameManager.instance.isFirstStage = false;
        }

        CurrentAmmo = GameManager.instance.currentSMGAmmo;
        MaxAmmo = GameManager.instance.maxSMGAmmo;
    }

    public override void StartWeaponAction(int type = 0)
    {
        if (type == 0)
        {
            if (weaponSetting.isAutomaticAttack == true)
            {
                StartCoroutine("OnAttackLoop");
            }
            else
            {
                OnAttack();
            }
        }
    }

    public override void StopWeaponAction(int type = 0)
    {
        if (type == 0)
        {
            StopCoroutine("OnAttackLoop");
        }
    }

    private IEnumerator OnAttackLoop()
    {
        while (true)
        {
            OnAttack();

            yield return null;
        }
    }

    // 발사 시도
    public void OnAttack()
    {
        // 현재 상태가 발사 가능한 상태
        // && 마지막 총 발사 시점에서 gunData.timeBetFire 이상의 시간이 지남.
        if (Time.time >= lastAttackTime + weaponSetting.fireRate)
        {
            // 마지막 총 발사 시점 갱신
            lastAttackTime = Time.time;
            // 남은 탄알이 없으면 발사 불가능
            if (GameManager.instance.currentSMGAmmo <= 0)
                return;
            if(!onSubMagazine)
                GameManager.instance.currentSMGAmmo--;
            CurrentAmmo = GameManager.instance.currentSMGAmmo;
            // 발사 이펙트 재생
            ShotEffect();
            // 발사 사운드 재생
            PlaySound(fireClip);
            // 실제 발사 처리 실행
            TwoStepRayCast();
        }
    }

    // 실제 발사 처리
    private void TwoStepRayCast()
    {
        // 카메라에서 나올 레이저
        Ray ray;
        // 레이캐스트에 의한 충돌 정보를 저장하는 컨테이너
        RaycastHit hit;
        // 탄알이 맞은 곳을 저장할 변수
        Vector3 hitPosition = Vector3.zero;

        ray = mainCamera.ViewportPointToRay(new Vector2(0.5f, 0.58f));

        if (Physics.Raycast(ray, out hit, weaponSetting.distance))
        {
            hitPosition = hit.point;
        }
        else
        {
            hitPosition = ray.origin + ray.direction * weaponSetting.distance;
        }

        Vector3 attackDirection = (hitPosition - fireTransform.position).normalized;
        // 레이캐스트(시작 지점, 방향, 충돌 정보 컨테이너, 사정거리)
        if (Physics.Raycast(fireTransform.position, GetShootingDirection(attackDirection), out hit, weaponSetting.distance))
        {
            // 레이가 어떤 물체와 충돌한 경우,
            // 충돌한 상대방으로부터 IDamageable 오브젝트 가져오기 시도
            IDamageable target = hit.collider.gameObject.GetComponent<IDamageable>();

            // 상대방으로부터 IDamageable 오브젝트를 가져오는 데 성공했다면
            if (target != null)
            {
                Instantiate(monsterImpact, hit.point, hit.transform.rotation);
                // 상대방의 OnDamage 함수를 실행시켜 상대방에 데미지 추가
                target.OnDamage(weaponSetting.damage);
            }
            else
            {
                Instantiate(Impact, hit.point, hit.transform.rotation);
            }
        }
    }

    Vector3 GetShootingDirection(Vector3 _direction)
    {
        _direction *= weaponSetting.distance;
        _direction = new Vector3(
            _direction.x + Random.Range(-inaccuracyDitance, inaccuracyDitance),
            _direction.y + Random.Range(-inaccuracyDitance, inaccuracyDitance),
            _direction.z + Random.Range(-inaccuracyDitance, inaccuracyDitance)
            );

        //Vector3 direction = _direction - fireTransform.position;
        return _direction.normalized;
    }

    // 발사 이펙트와 소리를 재생하고 탄알 궤적을 그림
    private void ShotEffect()
    {
        muzzleFlashEffect.transform.position = fireTransform.position;
        // 총구 화염 효과 재생
        muzzleFlashEffect.Play();
        // 탄피 배출 효과 재생
        shellEjectEffect.Play();
    }

    public override void StartReload()
    {
        if (isReload == true)
            return;

        // 장전 중 무기 액션 재생 중지
        StopWeaponAction();

        Reload();
    }

    // 재장전 시도
    public void Reload()
    {
        if (GameManager.instance.maxSMGAmmo <= 0 || GameManager.instance.currentSMGAmmo >= weaponSetting.maxCapacity)
        {
            // 이미 재장전 중이거나 남은 탄알이 없거나
            // 탄창에 탄알이 이미 가득한 경우 재장전 불가능
            return;
        }

        StartCoroutine(ReloadRoutine());
    }

    // 실제 재장전 처리를 진행
    private IEnumerator ReloadRoutine()
    {
        isReload = true;
        // 재장전 사운드 재생
        audioSource.PlayOneShot(reloadClip);

        // 재장전 소요 시간 만큼 처리 쉬기
        yield return new WaitForSeconds(weaponSetting.reloadTime);

        // 탄창에 채울 탄알 계산
        int ammoToFill = weaponSetting.maxCapacity - GameManager.instance.currentSMGAmmo;

        // 탄창에 채워야 할 탄알이 남은 탄알보다 많다면
        // 채워야 할 탄알 수를 남은 탄알 수에 맞춰 줄임
        if (GameManager.instance.maxSMGAmmo <= ammoToFill)
        {
            ammoToFill = GameManager.instance.maxSMGAmmo;
        }

        // 탄창을 채움
        GameManager.instance.currentSMGAmmo += ammoToFill;
        CurrentAmmo = GameManager.instance.currentSMGAmmo;
        // 남은 탄알에서 탄창에 채운만큼 탄알을 뺌
        GameManager.instance.maxSMGAmmo -= ammoToFill;
        MaxAmmo = GameManager.instance.maxSMGAmmo;
        // 총의 상태를 발사 준비 상태로 변경
        isReload = false;
    }
}
