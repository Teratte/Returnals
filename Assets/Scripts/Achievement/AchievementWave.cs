using TMPro;
using UnityEngine;

public class AchievementWave : Achievement
{
    [SerializeField]
    private int requiredWaveCount = 0;
    [SerializeField]
    private TextMeshProUGUI textWaveCount;

    private void OnEnable()
    {
        textWaveCount.text = $" (현재 최고 웨이브 수 : {GameManager.instance.BestWaveCount})";
    }
    public override bool Assignment()
    {
        return GameManager.instance.BestWaveCount >= requiredWaveCount;
    }
}
