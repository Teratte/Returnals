using System;
using UnityEngine;
using UnityEngine.UI;

public class WaveViewer : MonoBehaviour
{
    public static Action OnWavePlus;
    private Slider waveBar;
    private float waveTime;

    private void Awake()
    {
        waveBar = GetComponent<Slider>();
    }

    private void Update()
    {
        waveTime += Time.deltaTime;
        waveBar.value = waveTime / 150.0f;

        if(waveBar.value >= 1)
        {
            // 몬스터 스폰 로직
            Debug.Log("몬스터 소환");
            OnWavePlus?.Invoke();
        }
    }
}
