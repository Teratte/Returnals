using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class GazetViwer : MonoBehaviour
{
    [SerializeField]
    private Image gazetImage;       // 啊连 酒捞能
    private GazetBase gazetBase;    // 家蜡茄 啊连

    private void Awake()
    {
        gazetBase = GameManager.instance.holdingGazet.GetComponent<GazetBase>();
        if (gazetBase != null)
        {
            gazetImage.sprite = gazetBase.GazetIcon;
        }
    }

}
