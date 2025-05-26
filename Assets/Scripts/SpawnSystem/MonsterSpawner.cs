using UnityEngine;
using UnityEngine.AI;

public class MonsterSpawner : MonoBehaviour
{
    [Header("���� ������ ���")]
    public GameObject[] monsters;

    [Header("������ ���� ��")]
    [SerializeField] private int spawnCount = 10;

    [Header("NavMesh Ž�� �õ� Ƚ��")]
    public int maxSampleAttempts = 30;

    void Start()
    {
        SpawnMonsters();
    }

    void SpawnMonsters()
    {
        if (monsters == null || monsters.Length == 0)
        {
            Debug.LogWarning("���� �������� ��� �ֽ��ϴ�.");
            return;
        }

        for (int i = 0; i < spawnCount; i++)
        {
            // ������ ���� ������ ����
            GameObject selectedMonster = monsters[Random.Range(0, monsters.Length)];

            // NavMesh �� ���� ��ġ ã��
            if (TryGetRandomPointOnNavMesh(out Vector3 spawnPos))
            {
                Instantiate(selectedMonster, spawnPos, Quaternion.identity);
            }
        }
    }

    bool TryGetRandomPointOnNavMesh(out Vector3 result)
    {
        for (int i = 0; i < maxSampleAttempts; i++)
        {
            Vector3 randomPos = RandomNavMeshPointInWorldBounds();
            if (NavMesh.SamplePosition(randomPos, out NavMeshHit hit, 5.0f, NavMesh.AllAreas))
            {
                result = hit.position;
                return true;
            }
        }

        result = Vector3.zero;
        return false;
    }

    Vector3 RandomNavMeshPointInWorldBounds()
    {
        // ���� �ٿ��: ���� ���� ȯ�濡 �°� �����ϰų� NavMeshTriangulation�� ��ü ����
        Bounds navBounds = new Bounds(Vector3.zero, new Vector3(100, 0, 100));
        float x = Random.Range(navBounds.min.x, navBounds.max.x);
        float z = Random.Range(navBounds.min.z, navBounds.max.z);
        return new Vector3(x, 0, z);
    }
}
