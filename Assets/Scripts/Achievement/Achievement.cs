using UnityEngine;
using UnityEngine.UI;

public abstract class Achievement : MonoBehaviour
{
    [SerializeField]
    protected Image achieveIcon;

    public Image AchieveIcon
    {
        set => achieveIcon = value;
        get => achieveIcon;
    }

    public abstract bool Assignment();
}
