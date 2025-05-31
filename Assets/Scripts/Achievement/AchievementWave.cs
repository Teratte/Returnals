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
        textWaveCount.text = $" (���� �ְ� ���̺� �� : {GameManager.instance.BestWaveCount})";
    }
    public override bool Assignment()
    {
        return GameManager.instance.BestWaveCount >= requiredWaveCount;
    }
}
