using TMPro;
using UnityEngine;

public class AchievementItem : Achievement
{
    [SerializeField]
    private int requiredItemCount = 0;
    [SerializeField]
    private TextMeshProUGUI textItemCount;

    private void OnEnable()
    {
        textItemCount.text += $" (현재 누적 아이템 수 : {GameManager.instance.BestItemCount})";
    }

    public override bool Assignment()
    {
        return GameManager.instance.BestItemCount >= requiredItemCount;
    }
}
