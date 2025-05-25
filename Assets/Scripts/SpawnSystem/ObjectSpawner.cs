using UnityEngine;
using UnityEngine.AI;
using System.Collections.Generic;

public class MultiBoxColliderSpawner : MonoBehaviour
{
    [Header("Spawn Areas (BoxCollider 여러 개)")]
    public List<GameObject> spawnAreaObjects;  // 각 오브젝트에 BoxCollider 필요

    [Header("Spawn Settings")]
    public List<GameObject> eventPrefabs;
    public int minSpawnCount = 3;
    public int maxSpawnCount = 5;
    public float minDistanceBetweenSpawns = 5f;

    private List<BoxCollider> spawnColliders = new List<BoxCollider>();
    private List<Vector3> spawnPositions = new List<Vector3>();

    void Start()
    {
        // 각 게임오브젝트에서 BoxCollider 수집
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
                Debug.LogWarning($"오브젝트 '{obj.name}'에 BoxCollider가 없습니다.");
            }
        }

        if (spawnColliders.Count == 0)
        {
            Debug.LogError("유효한 BoxCollider가 하나도 없습니다.");
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
            // 랜덤한 BoxCollider 선택
            BoxCollider randomBox = spawnColliders[Random.Range(0, spawnColliders.Count)];

            Vector3 randomPos = GetRandomPointInBoxCollider(randomBox);

            if (NavMesh.SamplePosition(randomPos, out NavMeshHit hit, 5f, NavMesh.AllAreas))
            {
                Vector3 spawnPos = hit.position;

                // 실제 지면 높이로 레이캐스트 보정
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
            Debug.LogWarning("조건에 맞는 위치를 찾지 못해 일부 오브젝트가 생성되지 않았습니다.");
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
