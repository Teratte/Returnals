using UnityEngine;
using UnityEngine.AI;

public class MonsterSpawner : MonoBehaviour
{
    [Header("몬스터 프리팹 목록")]
    public GameObject[] monsters;

    [Header("스폰할 몬스터 수")]
    [SerializeField] private int spawnCount = 10;

    [Header("NavMesh 탐색 시도 횟수")]
    public int maxSampleAttempts = 30;

    void Start()
    {
        SpawnMonsters();
    }

    void SpawnMonsters()
    {
        if (monsters == null || monsters.Length == 0)
        {
            Debug.LogWarning("몬스터 프리팹이 비어 있습니다.");
            return;
        }

        for (int i = 0; i < spawnCount; i++)
        {
            // 랜덤한 몬스터 프리팹 선택
            GameObject selectedMonster = monsters[Random.Range(0, monsters.Length)];

            // NavMesh 위 랜덤 위치 찾기
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
        // 예시 바운드: 실제 게임 환경에 맞게 조정하거나 NavMeshTriangulation로 대체 가능
        Bounds navBounds = new Bounds(Vector3.zero, new Vector3(100, 0, 100));
        float x = Random.Range(navBounds.min.x, navBounds.max.x);
        float z = Random.Range(navBounds.min.z, navBounds.max.z);
        return new Vector3(x, 0, z);
    }
}
