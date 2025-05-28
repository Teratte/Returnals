using UnityEngine;

public class EnemyAttack : MonoBehaviour
{
    [SerializeField]
    private EnemyFSM enemy;

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
            Debug.Log("���� ����! : " + enemy.MonsterDamage);
            player.OnDamage(enemy.MonsterDamage);
        }
    }
}