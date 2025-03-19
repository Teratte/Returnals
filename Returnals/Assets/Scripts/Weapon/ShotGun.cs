using System.Collections;
using UnityEngine;

public class ShotGun : MonoBehaviour
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
    private GameObject laser;       // ���� ���ư��� ��� ������
    [SerializeField]
    private float fadeDuration = 0.3f;  // ������ ������� �ð�
    [SerializeField]
    private GunData shotgunData;
    private int currAmmo;   // ���� ź��
    private int maxAmmo;    // ��ü źâ

    public enum State
    {
        Ready,
        Empty,
        Reloading
    }

    public State state { get; private set; }    // ���� �� ����

    private AudioSource audioSource;    // ����� �����

    private float lastFireTime = 0.0f;  // ������ �߻� ����

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

        audioSource.PlayOneShot(shotgunData.reloadClip);    // ������ ���� ���
        yield return new WaitForSeconds(shotgunData.reloadTime);

        int ammoToFill = shotgunData.magCapacity - currAmmo;    // ä�� ź�� ���

        if(ammoToFill >= maxAmmo)   // ���� źâ�� ä�� ź�� ������ ���
        {
            ammoToFill = maxAmmo;   // ���� źâ�� ä�� ź�˷� ���
        }

        currAmmo += ammoToFill;     // ����
        maxAmmo -= ammoToFill;      // źâ���� ������ ź�˸�ŭ ����
        state = State.Ready;        // �߻� �غ� �Ϸ�
    }
}
