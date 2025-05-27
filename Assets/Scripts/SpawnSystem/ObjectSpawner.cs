using UnityEngine;
using UnityEngine.AI;

public class MultiBoxColliderSpawner : MonoBehaviour
{
    [Header("아이템 프리팹 목록")]
    public GameObject[] items;

    [Header("스폰 개수 설정")]
    [SerializeField] private int minSpawnCount = 2;
    [SerializeField] private int maxSpawnCount = 5;

    void Start()
    {
        SpawnItems();
    }

    void SpawnItems()
    {
        if (items == null || items.Length == 0)
        {
            Debug.LogWarning("아이템 프리팹이 비어 있습니다.");
            return;
        }

        int spawnCount = Random.Range(minSpawnCount, maxSpawnCount + 1);

        for (int i = 0; i < spawnCount; i++)
        {
            GameObject selectedItem = items[Random.Range(0, items.Length)];

            if (TryGetRandomPointOnNavMesh(out Vector3 spawnPos))
            {
                Instantiate(selectedItem, spawnPos, Quaternion.identity);
            }
        }
    }

    bool TryGetRandomPointOnNavMesh(out Vector3 result)
    {
        NavMeshTriangulation navMeshData = NavMesh.CalculateTriangulation();

        if (navMeshData.vertices.Length == 0 || navMeshData.indices.Length == 0)
        {
            result = Vector3.zero;
            return false;
        }

        for (int attempt = 0; attempt < 30; attempt++)
        {
            int triangleIndex = Random.Range(0, navMeshData.indices.Length / 3) * 3;

            Vector3 v0 = navMeshData.vertices[navMeshData.indices[triangleIndex]];
            Vector3 v1 = navMeshData.vertices[navMeshData.indices[triangleIndex + 1]];
            Vector3 v2 = navMeshData.vertices[navMeshData.indices[triangleIndex + 2]];

            Vector3 randomPoint = GetRandomPointInTriangle(v0, v1, v2);

            if (NavMesh.SamplePosition(randomPoint, out NavMeshHit hit, 1.0f, NavMesh.AllAreas))
            {
                result = hit.position;
                return true;
            }
        }

        result = Vector3.zero;
        return false;
    }

    Vector3 GetRandomPointInTriangle(Vector3 v0, Vector3 v1, Vector3 v2)
    {
        float r1 = Random.value;
        float r2 = Random.value;

        if (r1 + r2 > 1f)
        {
            r1 = 1f - r1;
            r2 = 1f - r2;
        }

        return v0 + r1 * (v1 - v0) + r2 * (v2 - v0);
    }
}
