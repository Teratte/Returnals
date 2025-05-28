using UnityEngine;

public class WeaponGrenadeProjectile : MonoBehaviour
{
    [Header("Explosion Barrel")]
    [SerializeField]
    private GameObject explosionPrefab;
    [SerializeField]
    private float explosionRadius = 10.0f;      // 폭발 범위
    [SerializeField]
    private float throwForce = 1000.0f;         // 던지는 힘

    private float explosionDamage;                // 폭발 데미지
    private new Rigidbody rigidbody;            // 물리처리

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
        // 폭발 이벤트 생성
        Instantiate(explosionPrefab, transform.position, transform.rotation);

        // 폭발 범위에 있는 모든 오브젝트의 Collider 정보를 받아와 폭발 효과 처리
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
        // 수류탄 삭제
        Destroy(gameObject);
    }
}
