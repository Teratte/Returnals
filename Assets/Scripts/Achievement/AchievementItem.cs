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
        textItemCount.text += $" (���� ���� ������ �� : {GameManager.instance.BestItemCount})";
    }

    public override bool Assignment()
    {
        return GameManager.instance.BestItemCount >= requiredItemCount;
    }
}
