using System.Collections;
using UnityEngine;

public class Shotgun : WeaponBase
{
    [SerializeField]
    private Transform fireTr;   // �߻� ��ġ
    [SerializeField]
    private float distance = 8.0f; // �ִ� �Ÿ�
    [SerializeField]
    private float inaccuracyDitance = 3.0f; // �л� ����
    [SerializeField]
    private int bulletsPerShot = 6; // �߻� �� �л�Ǵ� ź�� ��
    [SerializeField]
    private GameObject laser;       // źȯ ����

    [SerializeField]
    private AudioClip fireClip;
    [SerializeField]
    private AudioClip reloadClip;

    private float fadeDuration = 0.3f;
    public ParticleSystem muzzle;   // �ѱ� ����Ʈ
    public GameObject impact;       // ��Ʈ ����Ʈ

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
        // ī�޶󿡼� ���� ������
        Ray ray;
        // ����ĳ��Ʈ�� ���� �浹 ������ �����ϴ� �����̳�
        RaycastHit hit;
        // ź���� ���� ���� ������ ����
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
        // ����ĳ��Ʈ(���� ����, ����, �浹 ���� �����̳�, �����Ÿ�)
        for (int i = 0; i < bulletsPerShot; i++)
        {
            Vector3 shootingDir = GetShootingDirection(attackDirection);
            if (Physics.Raycast(fireTr.position, shootingDir, out hit))
            {
                Instantiate(impact, hit.point, hit.transform.rotation);
                CreateLaser(hit.point);

                // ���̰� � ��ü�� �浹�� ���,
                // �浹�� �������κ��� IDamageable ������Ʈ �������� �õ�
                IDamageable target = hit.collider.gameObject.GetComponent<IDamageable>();

                // �������κ��� IDamageable ������Ʈ�� �������� �� �����ߴٸ�
                if (target != null)
                {
                    // ������ OnDamage �Լ��� ������� ���濡 ������ �߰�
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
            // �̹� ������ ���̰ų� ���� ź���� ���ų�
            // źâ�� ź���� �̹� ������ ��� ������ �Ұ���
            return;
        }

        StartCoroutine(ReloadRoutine());
    }

    private IEnumerator ReloadRoutine()
    {
        isReload = true;
        // ������ ���� ���
        audioSource.PlayOneShot(reloadClip);

        // ������ �ҿ� �ð� ��ŭ ó�� ����
        yield return new WaitForSeconds(weaponSetting.reloadTime);

        // źâ�� ä�� ź�� ���
        int ammoToFill = weaponSetting.maxCapacity - weaponSetting.currentAmmo;

        // źâ�� ä���� �� ź���� ���� ź�˺��� ���ٸ�
        // ä���� �� ź�� ���� ���� ź�� ���� ���� ����
        if (weaponSetting.maxAmmo <= ammoToFill)
        {
            ammoToFill = weaponSetting.maxAmmo;
        }

        // źâ�� ä��
        weaponSetting.currentAmmo += ammoToFill;
        // ���� ź�˿��� źâ�� ä�ŭ ź���� ��

        // ���� ���¸� �߻� �غ� ���·� ����
        isReload = false;
    }
}
