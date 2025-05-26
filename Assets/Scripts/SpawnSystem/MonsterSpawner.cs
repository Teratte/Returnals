using UnityEngine;
using UnityEngine.AI;

public class MonsterSpawner : MonoBehaviour
{
    [Header("몬스터 프리팹 목록")]
    public GameObject[] monsters;

    [Header("스폰할 몬스터 수")]
    [SerializeField] private int spawnCount = 10;

    void Start()
    {
        //SpawnMonsters(spawnCount);
    }

    public void SpawnMonsters(int spawnCount)
    {
        if (monsters == null || monsters.Length == 0)
        {
            Debug.LogWarning("몬스터 프리팹이 비어 있습니다.");
            return;
        }

        for (int i = 0; i < spawnCount; i++)
        {
            GameObject selectedMonster = monsters[Random.Range(0, monsters.Length)];

            if (GetRandomPointOnNavMesh(out Vector3 spawnPos))
            {
                Instantiate(selectedMonster, spawnPos, Quaternion.identity);
            }
        }
    }

    bool GetRandomPointOnNavMesh(out Vector3 result)
    {
        NavMeshTriangulation navMeshData = NavMesh.CalculateTriangulation();

        if (navMeshData.vertices.Length == 0 || navMeshData.indices.Length == 0)
        {
            result = Vector3.zero;
            return false;
        }

        // 삼각형 인덱스 랜덤 선택
        int triangleIndex = Random.Range(0, navMeshData.indices.Length / 3) * 3;

        // 삼각형의 세 꼭짓점
        Vector3 v0 = navMeshData.vertices[navMeshData.indices[triangleIndex]];
        Vector3 v1 = navMeshData.vertices[navMeshData.indices[triangleIndex + 1]];
        Vector3 v2 = navMeshData.vertices[navMeshData.indices[triangleIndex + 2]];

        // 무작위 위치 (Barycentric coordinates 사용)
        Vector3 randomPoint = GetRandomPointInTriangle(v0, v1, v2);

        // NavMesh 위 위치로 정밀 샘플
        if (NavMesh.SamplePosition(randomPoint, out NavMeshHit hit, 2.0f, NavMesh.AllAreas))
        {
            result = hit.position;
            return true;
        }

        result = Vector3.zero;
        return false;
    }

    Vector3 GetRandomPointInTriangle(Vector3 v0, Vector3 v1, Vector3 v2)
    {
        float r1 = Random.value;
        float r2 = Random.value;

        // 바리센트릭 좌표계 기반 위치 보정
        if (r1 + r2 > 1f)
        {
            r1 = 1f - r1;
            r2 = 1f - r2;
        }

        return v0 + r1 * (v1 - v0) + r2 * (v2 - v0);
    }
}
