using TMPro;
using UnityEngine;

public class AchievementKillCount : Achievement
{
    [SerializeField]
    private int requiredKillCount = 0;
    [SerializeField]
    private TextMeshProUGUI textKillCount;

    private void OnEnable()
    {
        textKillCount.text = $" (현재 누적 킬 수: {GameManager.instance.BestKillCount})";
    }

    public override bool Assignment()
    {
        return GameManager.instance.BestKillCount >= requiredKillCount;
    }
}
