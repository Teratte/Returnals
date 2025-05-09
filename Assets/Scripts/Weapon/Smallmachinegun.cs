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

    public Transform fireTransform; // ź���� �߻�� ��ġ

    public ParticleSystem muzzleFlashEffect; // �ѱ� ȭ�� ȿ��
    public ParticleSystem shellEjectEffect; // ź�� ���� ȿ��

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
            if (GameManager.instance.currentSMGAmmo <= 0)
                return;
            if(!onSubMagazine)
                GameManager.instance.currentSMGAmmo--;
            CurrentAmmo = GameManager.instance.currentSMGAmmo;
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
        // ����ĳ��Ʈ(���� ����, ����, �浹 ���� �����̳�, �����Ÿ�)
        if (Physics.Raycast(fireTransform.position, GetShootingDirection(attackDirection), out hit, weaponSetting.distance))
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
        if (GameManager.instance.maxSMGAmmo <= 0 || GameManager.instance.currentSMGAmmo >= weaponSetting.maxCapacity)
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
        int ammoToFill = weaponSetting.maxCapacity - GameManager.instance.currentSMGAmmo;

        // źâ�� ä���� �� ź���� ���� ź�˺��� ���ٸ�
        // ä���� �� ź�� ���� ���� ź�� ���� ���� ����
        if (GameManager.instance.maxSMGAmmo <= ammoToFill)
        {
            ammoToFill = GameManager.instance.maxSMGAmmo;
        }

        // źâ�� ä��
        GameManager.instance.currentSMGAmmo += ammoToFill;
        CurrentAmmo = GameManager.instance.currentSMGAmmo;
        // ���� ź�˿��� źâ�� ä�ŭ ź���� ��
        GameManager.instance.maxSMGAmmo -= ammoToFill;
        MaxAmmo = GameManager.instance.maxSMGAmmo;
        // ���� ���¸� �߻� �غ� ���·� ����
        isReload = false;
    }
}
