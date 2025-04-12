using UnityEngine;
using System.Collections;

public class AssaultRifle: WeaponBase
{
    [SerializeField]
    private GameObject Impact;
    [SerializeField]
    private GameObject monsterImpact;   // ���� �ǰ� ����Ʈ
    [SerializeField]
    private AudioClip fireClip;
    [SerializeField]
    private AudioClip reloadClip;
    [SerializeField]
    private float inaccuracyDitance = 0.001f;

    public Transform fireTransform; // ź���� �߻�� ��ġ

    public ParticleSystem muzzleFlashEffect; // �ѱ� ȭ�� ȿ��
    public ParticleSystem shellEjectEffect; // ź�� ���� ȿ��

    private Camera mainCamera;
    private void Awake()
    {
        base.Setup();
        mainCamera = Camera.main;
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

    // �߻� �õ�
    public void OnAttack()
    {
        // ���� ���°� �߻� ������ ����
        // && ������ �� �߻� �������� gunData.timeBetFire �̻��� �ð��� ����.
        if (Time.time >= lastAttackTime + weaponSetting.fireRate)
        {
            // ������ �� �߻� ���� ����
            lastAttackTime = Time.time;
            // ���� ź���� ������ �߻� �Ұ���
            if (weaponSetting.currentAmmo <= 0)
                return;
            weaponSetting.currentAmmo--;
            // �߻� ����Ʈ ���
            ShotEffect();
            // �߻� ���� ���
            PlaySound(fireClip);
            // ���� �߻� ó�� ����
            TwoStepRayCast();
        }
    }

    // ���� �߻� ó��
    private void TwoStepRayCast()
    {
        // ī�޶󿡼� ���� ������
        Ray ray;
        // ����ĳ��Ʈ�� ���� �浹 ������ �����ϴ� �����̳�
        RaycastHit hit;
        // ź���� ���� ���� ������ ����
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
        Vector3 finalDirection = GetShootingDirection(attackDirection);
        // ����ĳ��Ʈ(���� ����, ����, �浹 ���� �����̳�, �����Ÿ�)
        if (Physics.Raycast(fireTransform.position, finalDirection, out hit, weaponSetting.distance))
        {
            // ���̰� � ��ü�� �浹�� ���,
            // �浹�� �������κ��� IDamageable ������Ʈ �������� �õ�
            IDamageable target = hit.collider.gameObject.GetComponent<IDamageable>();

            // �������κ��� IDamageable ������Ʈ�� �������� �� �����ߴٸ�
            if (target != null)
            {
                Instantiate(monsterImpact, hit.point, hit.transform.rotation);
                // ������ OnDamage �Լ��� ������� ���濡 ������ �߰�
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

    // �߻� ����Ʈ�� �Ҹ��� ����ϰ� ź�� ������ �׸�
    private void ShotEffect()
    {
        muzzleFlashEffect.transform.position = fireTransform.position;
        // �ѱ� ȭ�� ȿ�� ���
        muzzleFlashEffect.Play();
        // ź�� ���� ȿ�� ���
        shellEjectEffect.Play();
    }

    public override void StartReload()
    {
        if (isReload == true)
            return;

        // ���� �� ���� �׼� ��� ����
        StopWeaponAction();

        Reload();
    }

    // ������ �õ�
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

    // ���� ������ ó���� ����
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
        weaponSetting.maxAmmo -= ammoToFill;
        // ���� ���¸� �߻� �غ� ���·� ����
        isReload = false;
    }
}
