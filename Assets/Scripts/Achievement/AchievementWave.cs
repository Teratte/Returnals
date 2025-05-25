using UnityEngine;

public class AchievementWave : Achievement
{
    [SerializeField]
    private int requiredWaveCount = 0;
    public override bool Assignment()
    {
        return GameManager.instance.BestWaveCount >= requiredWaveCount;
    }
}
