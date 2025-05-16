using UnityEngine;
using System.Collections;

public class ExposiveBarrel : MonoBehaviour,IDamageable
{
    [SerializeField]
    private float barrelHp = 100;
    [SerializeField]
    private GameObject explsionPrefab;    // ���� ����Ʈ ������
    [SerializeField]
    private float explosionDelay = 0.3f;   // ���� ������ �ð�
    [SerializeField]
    private float explosionRadius = 10.0f;  // ���� �ݰ�
    [SerializeField]
    private float damage = 100.0f;

    private bool isExplode = false;

    public void OnDamage(float damage)
    {
        barrelHp -= damage;

        if(barrelHp <= 0 && !isExplode)
        {
            // ���� �̺�Ʈ
            StartCoroutine(Explosion());
        }
    }

    private IEnumerator Explosion()
    {
        yield return new WaitForSeconds(explosionDelay);

        // ��ó �跲�� ������ �ٽ� ���� �跲�� ��Ʈ������ �Ҷ�(StackOverFlow)����
        isExplode = true;

        // ���� ����Ʈ ����
        Bounds bounds = GetComponent<Collider>().bounds;
        Instantiate(explsionPrefab, new Vector3(bounds.center.x, bounds.min.y, bounds.center.z), transform.rotation);

        // ���� ������ �ִ� ��� ������Ʈ�� Collider ������ �޾ƿ� ���� ȿ�� ó��
        Collider[] colliders = Physics.OverlapSphere(transform.position, explosionRadius);
        foreach(Collider hit in colliders)
        {
            // ���� ������ �ε��� ������Ʈ�� IDamageable��ũ��Ʈ�� ������ ���� �� ó��
            IDamageable hitable = hit.GetComponent<IDamageable>();
            if(hitable != null)
            {
                hitable.OnDamage(damage);
                continue;
            }
        }

        // �跲 ������Ʈ ����
        Destroy(gameObject);
    }
}
