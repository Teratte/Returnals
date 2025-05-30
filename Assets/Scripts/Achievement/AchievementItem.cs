using UnityEngine;

public class AchievementItem : Achievement
{
    [SerializeField]
    private int requiredItemCount = 0;
    public override bool Assignment()
    {
        return GameManager.instance.BestItemCount >= requiredItemCount;
    }
}
