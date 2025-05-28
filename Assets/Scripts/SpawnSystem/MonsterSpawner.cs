using UnityEngine;
using UnityEngine.AI;
using System.Collections.Generic;

public class MonsterSpawner : MonoBehaviour
{
    [Header("���� ������ ���")]
    public GameObject[] monsterPrefabs;

    [Header("Ǯ�� ������ ���� ��")]
    public int poolSizePerType = 20;

    private Dictionary<GameObject, Queue<GameObject>> monsterPools = new Dictionary<GameObject, Queue<GameObject>>();
    private List<GameObject> allMonsters = new List<GameObject>(); // ��ü ���� ����Ʈ

    void Awake()
    {
        InitializePools();
    }

    void InitializePools()
    {
        foreach (GameObject prefab in monsterPrefabs)
        {
            Queue<GameObject> pool = new Queue<GameObject>();

            for (int i = 0; i < poolSizePerType; i++)
            {
                GameObject obj = Instantiate(prefab, transform);
                obj.SetActive(false);
                pool.Enqueue(obj);
                allMonsters.Add(obj); // ��� ���� ����
            }

            monsterPools[prefab] = pool;
        }
    }

    public void SpawnMonsters(int spawnCount)
    {
        for (int i = 0; i < spawnCount; i++)
        {
            GameObject prefab = monsterPrefabs[Random.Range(0, monsterPrefabs.Length)];

            if (monsterPools.TryGetValue(prefab, out Queue<GameObject> pool) && pool.Count > 0)
            {
                GameObject monster = pool.Dequeue();

                if (monster != null && GetRandomPointOnNavMesh(out Vector3 spawnPos))
                {
                    monster.transform.position = spawnPos;
                    monster.transform.rotation = Quaternion.identity;
                    monster.SetActive(true);
                }

                // ����� ���ʹ� ��Ȱ��ȭ �� ReturnToPool�� �ٽ� ���� ��
            }
            else
            {
                Debug.LogWarning($"[{prefab.name}] Ǯ�� ������ �����ϴ�.");
            }
        }
    }

    public void DeactivateAllMonsters()
    {
        foreach (GameObject monster in allMonsters)
        {
            if (monster.activeInHierarchy)
            {
                monster.SetActive(false);
                ReturnToPool(monster); // �ٽ� Ǯ�� �ֱ�
            }
        }
    }

    public void ReturnToPool(GameObject monster)
    {
        foreach (var kvp in monsterPools)
        {
            if (monster.name.Contains(kvp.Key.name)) // �̸����� ��Ī
            {
                if (!kvp.Value.Contains(monster)) // �ߺ� ����
                    monsterPools[kvp.Key].Enqueue(monster);
                break;
            }
        }
    }

    bool GetRandomPointOnNavMesh(out Vector3 result)
    {
        NavMeshTriangulation navMeshData = NavMesh.CalculateTriangulation();
        int triangleIndex = Random.Range(0, navMeshData.indices.Length / 3) * 3;

        Vector3 v0 = navMeshData.vertices[navMeshData.indices[triangleIndex]];
        Vector3 v1 = navMeshData.vertices[navMeshData.indices[triangleIndex + 1]];
        Vector3 v2 = navMeshData.vertices[navMeshData.indices[triangleIndex + 2]];

        Vector3 randomPoint = GetRandomPointInTriangle(v0, v1, v2);

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
        if (r1 + r2 > 1f)
        {
            r1 = 1f - r1;
            r2 = 1f - r2;
        }

        return v0 + r1 * (v1 - v0) + r2 * (v2 - v0);
    }
}
