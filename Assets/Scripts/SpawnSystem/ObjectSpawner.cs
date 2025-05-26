using UnityEngine;
using UnityEngine.AI;
using System.Collections.Generic;

public class MultiBoxColliderSpawner : MonoBehaviour
{
    [Header("아이템 프리팹 목록")]
    public GameObject[] items;

    [Header("스폰 개수 설정")]
    public int minSpawnCount = 2;
    public int maxSpawnCount = 5;

    [Header("NavMesh 탐색 시도 횟수")]
    public int maxSampleAttempts = 30;

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
            // 아이템 랜덤 선택
            GameObject selectedItem = items[Random.Range(0, items.Length)];

            // NavMesh 위 랜덤 위치 찾기
            Vector3 spawnPos;
            if (TryGetRandomPointOnNavMesh(out spawnPos))
            {
                Instantiate(selectedItem, spawnPos, Quaternion.identity);
            }
        }
    }

    bool TryGetRandomPointOnNavMesh(out Vector3 result)
    {
        // NavMesh 전체 영역에서 무작위 위치를 찾음
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
        // NavMesh가 적용된 전체 월드 범위를 기반으로 무작위 위치 선택
        // 바운드 수동 설정 또는 NavMeshSurface 등에서 가져와야 함
        Bounds navBounds = new Bounds(Vector3.zero, new Vector3(100, 0, 100)); // 예시로 100x100 범위 사용
        float x = Random.Range(navBounds.min.x, navBounds.max.x);
        float z = Random.Range(navBounds.min.z, navBounds.max.z);
        return new Vector3(x, 0, z);
    }
}
