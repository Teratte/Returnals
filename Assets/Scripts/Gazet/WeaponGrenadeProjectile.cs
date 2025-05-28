using UnityEngine;

public class WeaponGrenadeProjectile : MonoBehaviour
{
    [Header("Explosion Barrel")]
    [SerializeField]
    private GameObject explosionPrefab;
    [SerializeField]
    private float explosionRadius = 10.0f;      // ���� ����
    [SerializeField]
    private float throwForce = 1000.0f;         // ������ ��

    private float explosionDamage;                // ���� ������
    private new Rigidbody rigidbody;            // ����ó��

    private void Awake()
    {
        rigidbody = GetComponent<Rigidbody>();
        rigidbody.isKinematic = true;
    }

    public void Setup(float damage, Vector3 rotation)
    {
        rigidbody = GetComponent<Rigidbody>();
        rigidbody.isKinematic = false;
        rigidbody.AddForce(rotation * throwForce);

        explosionDamage = damage;
    }

    private void OnCollisionEnter(Collision collision)
    {
        // ���� �̺�Ʈ ����
        Instantiate(explosionPrefab, transform.position, transform.rotation);

        // ���� ������ �ִ� ��� ������Ʈ�� Collider ������ �޾ƿ� ���� ȿ�� ó��
        Collider[] colliders = Physics.OverlapSphere(transform.position, explosionRadius);
        foreach (Collider hit in colliders)
        {
            Enemy enemy = hit.GetComponent<Enemy>();
            if(enemy != null)
            {
                enemy.OnDamage(explosionDamage);
                continue;
            }
        }

        AudioManager.instance.PlayExplosionSound();
        // ����ź ����
        Destroy(gameObject);
    }
}
