using UnityEngine;

public abstract class GazetBase : MonoBehaviour
{
    [SerializeField]
    protected GazetSetting gazetSetting;    // ���� ����
    [SerializeField]
    protected Sprite gazetIcon;             // ���� ������
    protected float lastUseTime = 0.0f;

    public float Damage
    {
        set => gazetSetting.damage = value;
        get => gazetSetting.damage;
    }
    public float Rate => gazetSetting.rate;
    public Sprite GazetIcon => gazetIcon;
    
    public int CurrentAbleCount => gazetSetting.currentAbleCount;
    public bool canUse = false;
    public abstract void StartGazetAction();

    protected void SetUp()
    {
        gazetSetting.currentAbleCount = gazetSetting.maxAbleCount;
    }
}
