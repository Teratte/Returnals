using UnityEngine;
using System.Collections;

public class Machinegun : MonoBehaviour
{
    // ���� ���¸� ǥ���ϴ� �� ����� Ÿ���� ����
    public enum State
    {
        Ready, // �߻� �غ��
        Empty, // ź������ ��
        Reloading // ������ ��
    }

    [SerializeField]
    private GameObject Impact;

    public State state { get; private set; } // ���� ���� ����

    public Transform fireTransform; // ź���� �߻�� ��ġ

    public ParticleSystem muzzleFlashEffect; // �ѱ� ȭ�� ȿ��
    public ParticleSystem shellEjectEffect; // ź�� ���� ȿ��

    private LineRenderer bulletLineRenderer; // ź�� ������ �׸��� ���� ������

    private AudioSource gunAudioPlayer; // �� �Ҹ� �����

    public GunData machinegunData; // ���� ���� ������

    private float fireDistance = 8.0f; // �����Ÿ�

    public int ammoRemain = 100; // ���� ��ü ź��
    public int magAmmo; // ���� ź������ ���� �ִ� ź��

    private float lastFireTime; // ���� ���������� �߻��� ����

    private void Awake()
    {
        // ����� ������Ʈ�� ���� ��������
        gunAudioPlayer = GetComponent<AudioSource>();
        bulletLineRenderer = GetComponent<LineRenderer>();

        // ����� ���� �� ���� ����
        bulletLineRenderer.positionCount = 2;
        // ���� �������� ��Ȱ��ȭ
        bulletLineRenderer.enabled = false;
    }

    private void Update()
    {
        if (Input.GetMouseButton(0))
        {
            Fire();
        }

        if (Input.GetButtonDown("Reload"))
        {
            Reload();
        }
    }

    private void OnEnable()
    {
        // �� ���� �ʱ�ȭ
        // ��ü ���� ź�� ���� �ʱ�ȭ
        ammoRemain = machinegunData.startAmmoRemain;
        // ���� źâ�� ���� ä���
        magAmmo = machinegunData.magCapacity;

        // ���� ���� ���¸� ���� �� �غ� �� ���·� ����
        state = State.Ready;
        // ���������� ���� �� ������ �ʱ�ȭ
        lastFireTime = 0.0f;

        fireDistance = machinegunData.distance;
    }

    // �߻� �õ�
    public void Fire()
    {
        Debug.Log("Fire");
        // ���� ���°� �߻� ������ ����
        // && ������ �� �߻� �������� gunData.timeBetFire �̻��� �ð��� ����.
        if (state == State.Ready && Time.time >= lastFireTime + machinegunData.timeBetFire)
        {
            // ������ �� �߻� ���� ����
            lastFireTime = Time.time;
            // ���� �߻� ó�� ����
            Shot();
        }
    }

    // ���� �߻� ó��
    private void Shot()
    {
        // ����ĳ��Ʈ�� ���� �浹 ������ �����ϴ� �����̳�
        RaycastHit hit;
        // ź���� ���� ���� ������ ����
        Vector3 hitPosition = Vector3.zero;

        // ����ĳ��Ʈ(���� ����, ����, �浹 ���� �����̳�, �����Ÿ�)
        if (Physics.Raycast(fireTransform.position, fireTransform.forward, out hit, fireDistance))
        {
            Instantiate(Impact, hit.point, hit.transform.rotation);

            // ���̰� � ��ü�� �浹�� ���,
            // �浹�� �������κ��� IDamageable ������Ʈ �������� �õ�
            IDamageable target = hit.collider.gameObject.GetComponent<IDamageable>();

            // �������κ��� IDamageable ������Ʈ�� �������� �� �����ߴٸ�
            if (target != null)
            {
                // ������ OnDamage �Լ��� ������� ���濡 ������ �߰�
                target.OnDamage(machinegunData.damage, hit.point, hit.normal);
            }

            // ���̰� �浹�� ��ġ ����
            hitPosition = hit.point;
        }
        else
        {
            // ���̰� �ٸ� ��ü�� �浹���� �ʾҴٸ�
            // ź���� �ִ� �����Ÿ����� ���ư��� ���� ��ġ�� �浹 ��ġ�� ���
            hitPosition = fireTransform.position + fireTransform.forward * fireDistance;
        }

        // �߻� ����Ʈ ��� ����
        StartCoroutine(ShotEffect(hitPosition));

        // ���� ź�� ���� -1
        magAmmo--;
        if (magAmmo <= 0)
        {
            // źâ�� ���� ź���� ���ٸ� ���� ���� ���¸� Empty�� ����
            state = State.Empty;
        }
    }

    // �߻� ����Ʈ�� �Ҹ��� ����ϰ� ź�� ������ �׸�
    private IEnumerator ShotEffect(Vector3 hitPosition)
    {
        muzzleFlashEffect.transform.position = fireTransform.position;
        // �ѱ� ȭ�� ȿ�� ���
        muzzleFlashEffect.Play();
        // ź�� ���� ȿ�� ���
        shellEjectEffect.Play();

        // �Ѱ� �Ҹ� ���
        gunAudioPlayer.PlayOneShot(machinegunData.shotClip);

        // ���� �������� �ѱ��� ��ġ
        bulletLineRenderer.SetPosition(0, fireTransform.position);
        // ���� ������ �Է����� ���� �浹 ��ġ
        bulletLineRenderer.SetPosition(1, hitPosition);
        // ���� �������� Ȱ��ȭ�Ͽ� ź�� ������ �׸�
        bulletLineRenderer.enabled = true;

        // 0.03�� ���� ��� ó���� ���
        yield return new WaitForSeconds(0.03f);

        // ���� �������� ��Ȱ��ȭ�Ͽ� ź�� ������ ����
        bulletLineRenderer.enabled = false;
    }

    // ������ �õ�
    public bool Reload()
    {
        if (state == State.Reloading || ammoRemain <= 0 || magAmmo >= machinegunData.magCapacity)
        {
            // �̹� ������ ���̰ų� ���� ź���� ���ų�
            // źâ�� ź���� �̹� ������ ��� ������ �Ұ���
            return false;
        }

        StartCoroutine(ReloadRoutine());
        return true;
    }

    // ���� ������ ó���� ����
    private IEnumerator ReloadRoutine()
    {
        // ���� ���¸� ������ �� ���·� ��ȯ
        state = State.Reloading;
        // ������ ���� ���
        gunAudioPlayer.PlayOneShot(machinegunData.reloadClip);

        // ������ �ҿ� �ð� ��ŭ ó�� ����
        yield return new WaitForSeconds(machinegunData.reloadTime);

        // źâ�� ä�� ź�� ���
        int ammoToFill = machinegunData.magCapacity - magAmmo;

        // źâ�� ä���� �� ź���� ���� ź�˺��� ���ٸ�
        // ä���� �� ź�� ���� ���� ź�� ���� ���� ����
        if (ammoRemain < ammoToFill)
        {
            ammoToFill = ammoRemain;
        }

        // źâ�� ä��
        magAmmo += ammoToFill;
        // ���� ź�˿��� źâ�� ä�ŭ ź���� ��
        ammoRemain -= ammoToFill;

        // ���� ���¸� �߻� �غ� ���·� ����
        state = State.Ready;
    }
}
