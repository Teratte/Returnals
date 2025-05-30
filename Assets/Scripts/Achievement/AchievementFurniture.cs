using UnityEngine;

public class AchievementFurniture : Achievement
{
    [SerializeField]
    private int acquiredCount = 0;

    public override bool Assignment()
    {
        int result = 0;

        foreach(var furniture in GameManager.instance.Furnitures)
        {
            if (GameManager.instance.Furnitures[furniture.Key])
            {
                result++;
            }
        }

        return result >= acquiredCount;
    }
}
