using UnityEngine;
using System.Collections;

public class ExposiveBarrel : MonoBehaviour,IDamageable
{
    [SerializeField]
    private float barrelHp = 100;
    [SerializeField]
    private GameObject explsionPrefab;    // 폭발 이펙트 프리팹
    [SerializeField]
    private float explosionDelay = 0.3f;   // 폭발 딜레이 시간
    [SerializeField]
    private float explosionRadius = 10.0f;  // 폭발 반경
    [SerializeField]
    private float damage = 100.0f;

    private bool isExplode = false;

    public void OnDamage(float damage)
    {
        barrelHp -= damage;

        if(barrelHp <= 0 && !isExplode)
        {
            // 폭발 이벤트
            StartCoroutine(Explosion());
        }
    }

    private IEnumerator Explosion()
    {
        yield return new WaitForSeconds(explosionDelay);

        // 근처 배럴이 터져서 다시 현재 배럴을 터트리려고 할때(StackOverFlow)방지
        isExplode = true;

        // 폭발 이펙트 생성
        Bounds bounds = GetComponent<Collider>().bounds;
        Instantiate(explsionPrefab, new Vector3(bounds.center.x, bounds.min.y, bounds.center.z), transform.rotation);

        // 폭발 범위에 있는 모든 오브젝트의 Collider 정보를 받아와 폭발 효과 처리
        Collider[] colliders = Physics.OverlapSphere(transform.position, explosionRadius);
        foreach(Collider hit in colliders)
        {
            // 폭발 범위에 부딪힌 오브젝트가 IDamageable스크립트를 가지고 있을 때 처리
            IDamageable hitable = hit.GetComponent<IDamageable>();
            if(hitable != null)
            {
                hitable.OnDamage(damage);
                continue;
            }
        }

        // 배럴 오브젝트 삭제
        Destroy(gameObject);
    }
}
