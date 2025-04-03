using UnityEngine;

public abstract class GazetBase : MonoBehaviour
{
    [SerializeField]
    protected GazetSetting gazetSetting;    // ���� ����

    protected float lastUseTime = 0.0f;

    public float Damage => gazetSetting.damage;
    public abstract void StartGazetAction();
}
