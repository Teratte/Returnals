using UnityEngine;

public class AchievementKillCount : Achievement
{
    [SerializeField]
    private int requiredKillCount = 0;

    public override bool Assignment()
    {
        return GameManager.instance.BestKillCount >= requiredKillCount;
    }
}
