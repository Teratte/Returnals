using UnityEngine;
using UnityEngine.AI;

public class MonsterSpawner : MonoBehaviour
{
    [Header("���� ������ ���")]
    public GameObject[] monsters;

    [Header("������ ���� ��")]
    [SerializeField] private int spawnCount = 10;

    void Start()
    {
        //SpawnMonsters(spawnCount);
    }

    public void SpawnMonsters(int spawnCount)
    {
        if (monsters == null || monsters.Length == 0)
        {
            Debug.LogWarning("���� �������� ��� �ֽ��ϴ�.");
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

        // �ﰢ�� �ε��� ���� ����
        int triangleIndex = Random.Range(0, navMeshData.indices.Length / 3) * 3;

        // �ﰢ���� �� ������
        Vector3 v0 = navMeshData.vertices[navMeshData.indices[triangleIndex]];
        Vector3 v1 = navMeshData.vertices[navMeshData.indices[triangleIndex + 1]];
        Vector3 v2 = navMeshData.vertices[navMeshData.indices[triangleIndex + 2]];

        // ������ ��ġ (Barycentric coordinates ���)
        Vector3 randomPoint = GetRandomPointInTriangle(v0, v1, v2);

        // NavMesh �� ��ġ�� ���� ����
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

        // �ٸ���Ʈ�� ��ǥ�� ��� ��ġ ����
        if (r1 + r2 > 1f)
        {
            r1 = 1f - r1;
            r2 = 1f - r2;
        }

        return v0 + r1 * (v1 - v0) + r2 * (v2 - v0);
    }
}
