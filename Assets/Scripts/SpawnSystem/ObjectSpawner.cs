using UnityEngine;
using UnityEngine.AI;
using System.Collections.Generic;

public class ObjectSpawner : MonoBehaviour
{
    [Header("Spawn Area Object (BoxCollider 필요)")]
    public GameObject spawnAreaObject;  // 빈 오브젝트에 BoxCollider 필요

    [Header("Spawn Settings")]
    public List<GameObject> eventPrefabs;
    public int minSpawnCount = 3;
    public int maxSpawnCount = 5;
    public float minDistanceBetweenSpawns = 5f;

    private BoxCollider spawnAreaCollider;
    private List<Vector3> spawnPositions = new List<Vector3>();

    void Start()
    {
        if (spawnAreaObject == null)
        {
            Debug.LogError("Spawn Area Object가 설정되지 않았습니다.");
            return;
        }

        spawnAreaCollider = spawnAreaObject.GetComponent<BoxCollider>();
        if (spawnAreaCollider == null)
        {
            Debug.LogError("Spawn Area Object에 BoxCollider 컴포넌트가 없습니다.");
            return;
        }

        SpawnObjects();
    }

    void SpawnObjects()
    {
        int spawnCount = Random.Range(minSpawnCount, maxSpawnCount + 1);
        int attempts = 0;

        while (spawnPositions.Count < spawnCount && attempts < 1000)
        {
            Vector3 randomPos = GetRandomPointInBoxCollider(spawnAreaCollider);

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

                    // 프리팹 바닥 Y 위치 구해서 보정
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

        // Y는 박스 중앙 Y 고정
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
            // 콜라이더 없으면 0 반환 (보정 없음)
            return 0f;
        }
    }

    void OnDrawGizmosSelected()
    {
        if (spawnAreaObject != null)
        {
            BoxCollider box = spawnAreaObject.GetComponent<BoxCollider>();
            if (box != null)
            {
                Gizmos.color = new Color(0f, 1f, 1f, 0.25f);

                Vector3 worldCenter = box.transform.TransformPoint(box.center);
                Vector3 worldSize = Vector3.Scale(box.size, box.transform.lossyScale);

                Gizmos.DrawCube(worldCenter, worldSize);
            }
        }
    }
}
