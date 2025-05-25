using UnityEngine;

public class AchievementItem : Achievement
{
    [SerializeField]
    private int requiredItemCount = 0;
    public override bool Assignment()
    {
        int result = 0;

        foreach(var item in GameManager.instance.Items)
        {
            result += item.Value;
        }

        return result > requiredItemCount;
    }
}
