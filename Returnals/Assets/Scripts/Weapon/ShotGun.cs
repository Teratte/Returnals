using System.Collections;
using UnityEngine;

public class Shotgun : WeaponBase
{
    [SerializeField]
    private Transform fireTr;   // 발사 위치
    [SerializeField]
    private float distance = 8.0f; // 최대 거리
    [SerializeField]
    private float inaccuracyDitance = 3.0f; // 분산 정도
    [SerializeField]
    private int bulletsPerShot = 6; // 발사 시 분산되는 탄알 수
    [SerializeField]
    private GameObject laser;       // 탄환 궤적

    [SerializeField]
    private AudioClip fireClip;
    [SerializeField]
    private AudioClip reloadClip;

    private float fadeDuration = 0.3f;
    public ParticleSystem muzzle;   // 총구 이펙트
    public GameObject impact;       // 히트 이펙트

    Camera mainCamera;

    private void Awake()
    {
        base.Setup();
        mainCamera = Camera.main;
    }

    public override void StartWeaponAction(int type = 0)
    {
        if(type == 0)
        {
            if(weaponSetting.isAutomaticAttack == true)
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
        if(type == 0)
        {
            StopCoroutine("OnAttackLoop");
        }
    }

    private void OnAttack()
    {
        if (Time.time >= lastAttackTime + weaponSetting.fireRate)
        {
            lastAttackTime = Time.time;
            if (currentAmmo <= 0)
                return;

            weaponSetting.currentAmmo--;
            PlaySound(fireClip);
            ShotEffect();
            TwoStepRayCast();
        }
    }

    private void TwoStepRayCast()
    {
        // 카메라에서 나올 레이저
        Ray ray;
        // 레이캐스트에 의한 충돌 정보를 저장하는 컨테이너
        RaycastHit hit;
        // 탄알이 맞은 곳을 저장할 변수
        Vector3 hitPosition = Vector3.zero;

        ray = mainCamera.ViewportPointToRay(new Vector2(0.5f, 0.65f));

        if (Physics.Raycast(ray, out hit))
        {
            hitPosition = hit.point;
        }
        else
        {
            hitPosition = ray.origin + ray.direction * weaponSetting.distance;
        }

        Vector3 attackDirection = (hitPosition - fireTr.position).normalized;
        // 레이캐스트(시작 지점, 방향, 충돌 정보 컨테이너, 사정거리)
        for (int i = 0; i < bulletsPerShot; i++)
        {
            Vector3 shootingDir = GetShootingDirection(attackDirection);
            if (Physics.Raycast(fireTr.position, shootingDir, out hit))
            {
                Instantiate(impact, hit.point, hit.transform.rotation);
                CreateLaser(hit.point);

                // 레이가 어떤 물체와 충돌한 경우,
                // 충돌한 상대방으로부터 IDamageable 오브젝트 가져오기 시도
                IDamageable target = hit.collider.gameObject.GetComponent<IDamageable>();

                // 상대방으로부터 IDamageable 오브젝트를 가져오는 데 성공했다면
                if (target != null)
                {
                    // 상대방의 OnDamage 함수를 실행시켜 상대방에 데미지 추가
                    target.OnDamage(weaponSetting.damage, hit.point, hit.normal);
                }
            }
            else
            {
                CreateLaser(fireTr.position + shootingDir * distance);
            }
        }
    }
    private void ShotEffect()
    {
        muzzle.gameObject.transform.position = fireTr.position;
        muzzle.gameObject.transform.rotation = fireTr.rotation;
        muzzle.Play();
    }

    Vector3 GetShootingDirection(Vector3 _direction)
    {
        _direction *= weaponSetting.distance;
        _direction = new Vector3(
            _direction.x + Random.Range(-inaccuracyDitance, inaccuracyDitance),
            _direction.y + Random.Range(-inaccuracyDitance, inaccuracyDitance),
            _direction.z + Random.Range(-inaccuracyDitance, inaccuracyDitance)
            );

        Vector3 direction = _direction - fireTr.position;
        return direction.normalized;
    }

    void CreateLaser(Vector3 end)
    {
        LineRenderer lr = Instantiate(laser).GetComponent<LineRenderer>();
        lr.SetPositions(new Vector3[2] { fireTr.position, end });
        StartCoroutine(FadeLaser(lr));
    }

    IEnumerator FadeLaser(LineRenderer lr)
    {
        float alpha = 1;
        while(alpha > 0)
        {
            alpha -= Time.deltaTime / fadeDuration;
            lr.startColor = new Color(lr.startColor.r, lr.startColor.g, lr.startColor.b, alpha);
            lr.endColor = new Color(lr.endColor.r, lr.endColor.g, lr.endColor.b, alpha);
            yield return null;
        }

        Destroy(lr.gameObject);
    }

    public override void StartReload()
    {
        if (isReload == true)
            return;

        StopWeaponAction();
        Reload();
    }

    public void Reload()
    {
        if (weaponSetting.maxAmmo <= 0 || weaponSetting.currentAmmo >= weaponSetting.maxCapacity)
        {
            // 이미 재장전 중이거나 남은 탄알이 없거나
            // 탄창에 탄알이 이미 가득한 경우 재장전 불가능
            return;
        }

        StartCoroutine(ReloadRoutine());
    }

    private IEnumerator ReloadRoutine()
    {
        isReload = true;
        // 재장전 사운드 재생
        audioSource.PlayOneShot(reloadClip);

        // 재장전 소요 시간 만큼 처리 쉬기
        yield return new WaitForSeconds(weaponSetting.reloadTime);

        // 탄창에 채울 탄알 계산
        int ammoToFill = weaponSetting.maxCapacity - weaponSetting.currentAmmo;

        // 탄창에 채워야 할 탄알이 남은 탄알보다 많다면
        // 채워야 할 탄알 수를 남은 탄알 수에 맞춰 줄임
        if (weaponSetting.maxAmmo <= ammoToFill)
        {
            ammoToFill = weaponSetting.maxAmmo;
        }

        // 탄창을 채움
        weaponSetting.currentAmmo += ammoToFill;
        // 남은 탄알에서 탄창에 채운만큼 탄알을 뺌

        // 총의 상태를 발사 준비 상태로 변경
        isReload = false;
    }
}
