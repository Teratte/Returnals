using System.Collections;
using UnityEngine;

public class Gun : MonoBehaviour
{
    public enum State
    {
        Ready,
        Empty,
        Reloading
    }

    public State state { get; private set; }

    [SerializeField]
    private Transform fireTransform;    // �߻� ������

    private LineRenderer bulletlineRenderer;  // �߻� ���� ����

    [SerializeField]
    private GunData gunData;             // ���� ������

    private float fireDistance = 50.0f; // �߻� ���� �Ÿ�

    [SerializeField]
    private int ammoRemain = 100;   // ���� ��ü ź�� 
    [SerializeField]
    private int magAmmo;            // ���� źâ�� �����ִ� ź��

    private float lastFireTime;     // ���� ���������� �߻��� ����

    private void Awake()
    {
        // ����� ������Ʈ ��������
        bulletlineRenderer = GetComponent<LineRenderer>();

        // ����� ���� �� ���� ����
        bulletlineRenderer.positionCount = 2;
        // ���� �������� ��Ȱ��ȭ
        bulletlineRenderer.enabled = false;
    }

    private void OnEnable()
    {
        // ��ü ���� ź�� �� �ʱ�ȭ
        ammoRemain = gunData.startAmmo;
        // ���� źâ�� ���� ä���
        magAmmo = gunData.magCapacity;

        // ���� ���� ���¸� ���� �� �غ� �� ���·� ����
        state = State.Ready;
        // ���������� ���� �� ���� �ʱ�ȭ
        lastFireTime = 0.0f;
    }

    public void Fire()
    {
        // ���� ���°� �غ� ����
        // ���� �ð��� �߻�� �ð����� �߻� ���� �ð���ŭ ������ ��
        if(state == State.Ready && Time.time >= lastFireTime + gunData.timebetTime)
        {
            // �ð� �ʱ�ȭ
            lastFireTime = Time.time;
            // �߻� ȿ�� ���
            Shot();
        }
    }   
    
    public void Shot()
    {
        // ����ĳ��Ʈ�� ���� �浹 ������ �����ϴ� �����̳�
        RaycastHit hit;
        // ź���� ���� ���� ������ ����
        Vector3 hitPosition = Vector3.zero;

        if(Physics.Raycast(fireTransform.position, fireTransform.forward, out hit, fireDistance) )
        {
            // ���̰� � ��ü�� �浹�� ���

            // �浹�� �������κ���
            
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
        // ���� ź�� ���� 0���ϸ�
        if(magAmmo <= 0)
        {
            // ���� ���¸� ź�� ������ ����
            state = State.Empty;
        }
    }

    private IEnumerator ShotEffect(Vector3 hitPosition)
    {
        // ���� �������� �ѱ��� ��ġ
        bulletlineRenderer.SetPosition(0, fireTransform.position);
        // ���� ������ ���� ��ġ
        bulletlineRenderer.SetPosition(1, hitPosition);

        // ���η������� Ȱ��ȭ�Ͽ� ź�� ������ �׸�
        bulletlineRenderer.enabled = true;

        // 0.03�� ���� ��� ó�� ���
        yield return new WaitForSeconds(0.03f);

        // ���η������� ��Ȱ��ȭ�Ͽ� ź�� ������ ����.
        bulletlineRenderer.enabled = false;
    }

    public bool Reload()
    {
        if(state == State.Reloading || ammoRemain <= 0 || magAmmo >= gunData.magCapacity)
        {
            return false;
        }

        StartCoroutine(ReloadingRoutine());
        return true;
    }

    private IEnumerator ReloadingRoutine()
    {
        // ���� ���¸� ������ ���·� ��ȯ
        state = State.Reloading;
        
         yield return new WaitForSeconds(gunData.reloadTime);

        int ammoToFill = gunData.magCapacity - magAmmo;

        if(ammoRemain < ammoToFill)
        {
            ammoToFill = ammoRemain;
        }

        magAmmo += ammoToFill;
        ammoRemain -= ammoToFill;

        state = State.Ready;
      
    }
}
