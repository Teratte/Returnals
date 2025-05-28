using UnityEngine;

[CreateAssetMenu(fileName = "New ShotEffect", menuName = "ShotEffect")]
public class ShotEffect : ScriptableObject
{
    public ParticleSystem muzzleEffect;      // ���� ���� ����Ʈ
    public GameObject impact;                // ���� �ܿ� �ٸ� ������Ʈ �ǰ� ����Ʈ
    public GameObject monsterImpact;         // ���� �ǰ� ����Ʈ
}
