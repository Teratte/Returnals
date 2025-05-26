using UnityEngine;
using UnityEngine.AI;
using System.Collections.Generic;

public class MultiBoxColliderSpawner : MonoBehaviour
{
    [Header("������ ������ ���")]
    public GameObject[] items;

    [Header("���� ���� ����")]
    public int minSpawnCount = 2;
    public int maxSpawnCount = 5;

    [Header("NavMesh Ž�� �õ� Ƚ��")]
    public int maxSampleAttempts = 30;

    void Start()
    {
        SpawnItems();
    }

    void SpawnItems()
    {
        if (items == null || items.Length == 0)
        {
            Debug.LogWarning("������ �������� ��� �ֽ��ϴ�.");
            return;
        }

        int spawnCount = Random.Range(minSpawnCount, maxSpawnCount + 1);

        for (int i = 0; i < spawnCount; i++)
        {
            // ������ ���� ����
            GameObject selectedItem = items[Random.Range(0, items.Length)];

            // NavMesh �� ���� ��ġ ã��
            Vector3 spawnPos;
            if (TryGetRandomPointOnNavMesh(out spawnPos))
            {
                Instantiate(selectedItem, spawnPos, Quaternion.identity);
            }
        }
    }

    bool TryGetRandomPointOnNavMesh(out Vector3 result)
    {
        // NavMesh ��ü �������� ������ ��ġ�� ã��
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
        // NavMesh�� ����� ��ü ���� ������ ������� ������ ��ġ ����
        // �ٿ�� ���� ���� �Ǵ� NavMeshSurface ��� �����;� ��
        Bounds navBounds = new Bounds(Vector3.zero, new Vector3(100, 0, 100)); // ���÷� 100x100 ���� ���
        float x = Random.Range(navBounds.min.x, navBounds.max.x);
        float z = Random.Range(navBounds.min.z, navBounds.max.z);
        return new Vector3(x, 0, z);
    }
}
