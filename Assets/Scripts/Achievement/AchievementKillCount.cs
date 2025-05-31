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
        textKillCount.text = $" (���� ���� ų ��: {GameManager.instance.BestKillCount})";
    }

    public override bool Assignment()
    {
        return GameManager.instance.BestKillCount >= requiredKillCount;
    }
}
