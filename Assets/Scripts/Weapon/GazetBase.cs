using UnityEngine;

public abstract class GazetBase : MonoBehaviour
{
    [SerializeField]
    protected GazetSetting gazetSetting;    // ���� ����
    [SerializeField]
    protected Sprite gazetIcon;             // ���� ������
    protected float lastUseTime = 0.0f;

    public float Damage => gazetSetting.damage;
    public float Rate => gazetSetting.rate;
    public Sprite GazetIcon => gazetIcon;
    public int AbleCount
    {
        get => gazetSetting.ableCount;
        set => gazetSetting.ableCount = value;
    }
    public abstract void StartGazetAction();
}
