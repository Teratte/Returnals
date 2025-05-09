using UnityEngine;

public class EnemyAttack : MonoBehaviour
{
    [SerializeField]
    private Enemy enemy;

    private bool hasHit = false;

    public void ResetHit()
    {
        hasHit = false;
    }

    private void OnTriggerEnter(Collider other)
    {
        if (hasHit) return;

        MovementCharacter player = other.GetComponent<MovementCharacter>();
        if (player != null)
        {
            hasHit = true;
            Debug.Log("몬스터 공격! : " + enemy.MonsterDamage);
            player.OnDamage(enemy.MonsterDamage);
        }
    }
}