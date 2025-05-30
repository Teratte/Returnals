using UnityEngine;
using System.Collections;
using System;

public class WaveManager : MonoBehaviour
{
    public static Action OnWavePlus;
    public MonsterSpawner spawner;
    public float initialDelay = 10f;
    public float waveInterval = 60f;
    public int firstWaveCount = 10;

    private int currentWave = 0;
    private int currentWaveSpawnCount = 0;
    private int spawnCount = 0;

    public int CurrentWave => currentWave;
    public int CurrentWaveSpawnCount => currentWaveSpawnCount;

    void Start()
    {
        StartCoroutine(ManageWaves());
        EnemyFSM.OnKilled.AddListener(DecreaseCurrentWaveSpawnCount);
    }

    IEnumerator ManageWaves()
    {
        yield return new WaitForSeconds(initialDelay);

        while (GameManager.instance.Timer > 60f)
        {
            currentWave++;
            spawnCount = Mathf.FloorToInt(firstWaveCount + Mathf.Pow(currentWave, 1.3f));
            spawner.SpawnMonsters(spawnCount);
            currentWaveSpawnCount += spawnCount;
            OnWavePlus?.Invoke();   // GameManager의 웨이브 카운터 1증가
            Debug.Log($"[Wave {currentWave}] 몬스터 {spawnCount}마리 스폰됨");

            yield return new WaitForSeconds(waveInterval);
        }

        // 게임 종료 시 몬스터 정리
        spawner.DeactivateAllMonsters();

        Debug.Log("Wave 스폰 종료 (게임 타이머 종료 또는 1분 미만 남음)");
    }

    public void DecreaseCurrentWaveSpawnCount()
    {
        currentWaveSpawnCount--;
    }

    private void OnGUI()
    {
        GUI.Label(new Rect(600, 10, 300, 20), $"[Wave {currentWave}] 몬스터 {currentWaveSpawnCount}마리 스폰됨");
        GUI.Label(new Rect(600, 30, 300, 20), $"남은 시간: {GameManager.instance.Timer:F1}초");
        GUI.Label(new Rect(600, 50, 300, 20), $"[Wave {currentWave}] 몬스터 {spawnCount}마리 스폰됨");
    }
}
