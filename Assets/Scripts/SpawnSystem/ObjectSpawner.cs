using UnityEngine;
using UnityEngine.AI;
using System.Collections.Generic;

public class MultiBoxColliderSpawner : MonoBehaviour
{
    [Header("Spawn Areas (BoxCollider ���� ��)")]
    public List<GameObject> spawnAreaObjects;  // �� ������Ʈ�� BoxCollider �ʿ�

    [Header("Spawn Settings")]
    public List<GameObject> eventPrefabs;
    public int minSpawnCount = 3;
    public int maxSpawnCount = 5;
    public float minDistanceBetweenSpawns = 5f;

    private List<BoxCollider> spawnColliders = new List<BoxCollider>();
    private List<Vector3> spawnPositions = new List<Vector3>();

    void Start()
    {
        // �� ���ӿ�����Ʈ���� BoxCollider ����
        spawnColliders.Clear();

        foreach (var obj in spawnAreaObjects)
        {
            if (obj == null) continue;

            BoxCollider col = obj.GetComponent<BoxCollider>();
            if (col != null)
            {
                spawnColliders.Add(col);
            }
            else
            {
                Debug.LogWarning($"������Ʈ '{obj.name}'�� BoxCollider�� �����ϴ�.");
            }
        }

        if (spawnColliders.Count == 0)
        {
            Debug.LogError("��ȿ�� BoxCollider�� �ϳ��� �����ϴ�.");
            return;
        }

        SpawnObjects();
    }

    void SpawnObjects()
    {
        int spawnCount = Random.Range(minSpawnCount, maxSpawnCount + 1);
        int attempts = 0;

        while (spawnPositions.Count < spawnCount && attempts < 2000)
        {
            // ������ BoxCollider ����
            BoxCollider randomBox = spawnColliders[Random.Range(0, spawnColliders.Count)];

            Vector3 randomPos = GetRandomPointInBoxCollider(randomBox);

            if (NavMesh.SamplePosition(randomPos, out NavMeshHit hit, 5f, NavMesh.AllAreas))
            {
                Vector3 spawnPos = hit.position;

                // ���� ���� ���̷� ����ĳ��Ʈ ����
                if (Physics.Raycast(spawnPos + Vector3.up * 5f, Vector3.down, out RaycastHit groundHit, 10f))
                {
                    spawnPos.y = groundHit.point.y;
                }

                bool tooClose = false;
                foreach (var pos in spawnPositions)
                {
                    if (Vector3.Distance(pos, spawnPos) < minDistanceBetweenSpawns)
                    {
                        tooClose = true;
                        break;
                    }
                }

                if (!tooClose)
                {
                    GameObject prefab = eventPrefabs[Random.Range(0, eventPrefabs.Count)];

                    float bottomY = GetPrefabBottomY(prefab);
                    Vector3 correctedPos = spawnPos;
                    correctedPos.y -= bottomY;

                    Instantiate(prefab, correctedPos, Quaternion.identity);
                    spawnPositions.Add(spawnPos);

                    Debug.DrawRay(correctedPos, Vector3.up * 2, Color.red, 10f);
                }
            }

            attempts++;
        }

        if (spawnPositions.Count < spawnCount)
        {
            Debug.LogWarning("���ǿ� �´� ��ġ�� ã�� ���� �Ϻ� ������Ʈ�� �������� �ʾҽ��ϴ�.");
        }
    }

    Vector3 GetRandomPointInBoxCollider(BoxCollider box)
    {
        Vector3 center = box.center;
        Vector3 size = box.size;

        Vector3 worldCenter = box.transform.TransformPoint(center);
        Vector3 worldSize = Vector3.Scale(size, box.transform.lossyScale);

        float randomX = Random.Range(-worldSize.x / 2f, worldSize.x / 2f);
        float randomZ = Random.Range(-worldSize.z / 2f, worldSize.z / 2f);

        return new Vector3(worldCenter.x + randomX, worldCenter.y, worldCenter.z + randomZ);
    }

    float GetPrefabBottomY(GameObject prefab)
    {
        Collider col = prefab.GetComponentInChildren<Collider>();
        if (col != null)
        {
            return col.bounds.min.y - prefab.transform.position.y;
        }
        else
        {
            return 0f;
        }
    }

    void OnDrawGizmosSelected()
    {
        if (spawnAreaObjects != null)
        {
            Gizmos.color = new Color(0f, 1f, 1f, 0.25f);
            foreach (var obj in spawnAreaObjects)
            {
                if (obj == null) continue;

                BoxCollider box = obj.GetComponent<BoxCollider>();
                if (box != null)
                {
                    Vector3 worldCenter = box.transform.TransformPoint(box.center);
                    Vector3 worldSize = Vector3.Scale(box.size, box.transform.lossyScale);

                    Gizmos.DrawCube(worldCenter, worldSize);
                }
            }
        }
    }
}
