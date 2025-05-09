using UnityEngine;

[CreateAssetMenu(fileName = "New ShotEffect", menuName = "ShotEffect")]
public class ShotEffect : ScriptableObject
{
    public ParticleSystem muzzleEffect;      // 무기 머즐 이펙트
    public GameObject impact;                // 몬스터 외에 다른 오브젝트 피격 이펙트
    public GameObject monsterImpact;         // 몬스터 피격 이펙트
}
