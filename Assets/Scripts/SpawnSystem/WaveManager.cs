using UnityEngine;
using System.Collections;

public class WaveManager : MonoBehaviour
{
    public MonsterSpawner spawner;
    public float initialDelay = 10f;
    public float waveInterval = 60f;
    public float totalGameTime = 900f; // 15분 (초 단위)
    public int firstWaveCount = 10;

    private float gameTimer = 0f;
    private int currentWave = 0;
    private int lastWaveSpawnCount = 0;

    void Start()
    {
        StartCoroutine(ManageWaves());
    }

    IEnumerator ManageWaves()
    {
        yield return new WaitForSeconds(initialDelay);
        gameTimer = initialDelay;

        while (gameTimer < totalGameTime - 60f) // 1분 미만 남으면 중지
        {
            currentWave++;

            int spawnCount = (currentWave == 1)
                ? firstWaveCount
                : Mathf.FloorToInt(lastWaveSpawnCount * 1.3f);

            lastWaveSpawnCount = spawnCount;

            spawner.SpawnMonsters(spawnCount);
            Debug.Log($"[Wave {currentWave}] 몬스터 {spawnCount}마리 스폰됨");

            yield return new WaitForSeconds(waveInterval);
            gameTimer += waveInterval;
        }

        Debug.Log("Wave 스폰 종료 (게임 타이머 종료 or 1분 미만 남음)");
    }
}
