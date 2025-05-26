using UnityEngine;
using System.Collections;

public class WaveManager : MonoBehaviour
{
    public MonsterSpawner spawner;
    public float initialDelay = 10f;
    public float waveInterval = 60f;
    public float totalGameTime = 900f; // 15�� (�� ����)
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

        while (gameTimer < totalGameTime - 60f) // 1�� �̸� ������ ����
        {
            currentWave++;

            int spawnCount = (currentWave == 1)
                ? firstWaveCount
                : Mathf.FloorToInt(lastWaveSpawnCount * 1.3f);

            lastWaveSpawnCount = spawnCount;

            spawner.SpawnMonsters(spawnCount);
            Debug.Log($"[Wave {currentWave}] ���� {spawnCount}���� ������");

            yield return new WaitForSeconds(waveInterval);
            gameTimer += waveInterval;
        }

        Debug.Log("Wave ���� ���� (���� Ÿ�̸� ���� or 1�� �̸� ����)");
    }
}
