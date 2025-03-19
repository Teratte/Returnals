using System.Collections;
using UnityEngine;

public class ShotGun : MonoBehaviour
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
    private GameObject laser;       // 총이 날아가는 경로 레이저
    [SerializeField]
    private float fadeDuration = 0.3f;  // 레이저 사라지는 시간
    [SerializeField]
    private GunData shotgunData;
    private int currAmmo;   // 현재 탄알
    private int maxAmmo;    // 전체 탄창

    public enum State
    {
        Ready,
        Empty,
        Reloading
    }

    public State state { get; private set; }    // 현재 총 상태

    private AudioSource audioSource;    // 오디오 재생기

    private float lastFireTime = 0.0f;  // 마지막 발사 시점

    public ParticleSystem muzzle;
    public GameObject impact;

    private void OnEnable()
    {
        audioSource = GetComponent<AudioSource>();
        currAmmo = shotgunData.magCapacity;
        maxAmmo = shotgunData.startAmmoRemain;
        lastFireTime = 0.0f;
        state = State.Ready;
        distance = shotgunData.distance;
    }

    private void Update()
    {
        if (Input.GetButtonDown("Fire1") && Input.GetAxisRaw("Horizontal") == 0 && Input.GetAxisRaw("Vertical") == 0)
            Fire();

        if (Input.GetButtonDown("Reload"))
            Reload();
    }

    private void Fire()
    {
        if (state == State.Ready && Time.time >= lastFireTime + shotgunData.timeBetFire)
            Shoot();
    }

    private void Shoot()
    {
        muzzle.gameObject.transform.position = fireTr.position;
        muzzle.gameObject.transform.rotation = fireTr.rotation;
        muzzle.Play();

        audioSource.PlayOneShot(shotgunData.shotClip);

        for(int i = 0;i < bulletsPerShot; i++)
        {
            RaycastHit hit;
            Vector3 shootingDir = GetShootingDirection();
            if(Physics.Raycast(fireTr.position, shootingDir, out hit, distance))
            {
                Instantiate(impact, hit.point, hit.transform.rotation); 
                CreateLaser(hit.point);
            }
            else
            {
                CreateLaser(fireTr.position + shootingDir * distance);
            }
        }
        currAmmo--;

        if(currAmmo <= 0)
        {
            state = State.Empty;
        }
        lastFireTime = Time.time;
    }

    Vector3 GetShootingDirection()
    {
        Vector3 targetPos = fireTr.position + fireTr.forward * distance;
        targetPos = new Vector3(
            targetPos.x + Random.Range(-inaccuracyDitance, inaccuracyDitance),
            targetPos.y + Random.Range(-inaccuracyDitance, inaccuracyDitance),
            targetPos.z + Random.Range(-inaccuracyDitance, inaccuracyDitance)
            );

        Vector3 direction = targetPos - fireTr.position;
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

    private void Reload()
    {
        if (state == State.Reloading || maxAmmo <= 0 || currAmmo >= shotgunData.magCapacity)
            return;

        StartCoroutine(ReloadingRoutine());
    }

    private IEnumerator ReloadingRoutine()
    {
        state = State.Reloading;

        audioSource.PlayOneShot(shotgunData.reloadClip);    // 재장전 사운드 재생
        yield return new WaitForSeconds(shotgunData.reloadTime);

        int ammoToFill = shotgunData.magCapacity - currAmmo;    // 채울 탄알 계산

        if(ammoToFill >= maxAmmo)   // 남은 탄창이 채울 탄알 이하일 경우
        {
            ammoToFill = maxAmmo;   // 남은 탄창을 채울 탄알로 계산
        }

        currAmmo += ammoToFill;     // 장전
        maxAmmo -= ammoToFill;      // 탄창에서 장전할 탄알만큼 감소
        state = State.Ready;        // 발사 준비 완료
    }
}
