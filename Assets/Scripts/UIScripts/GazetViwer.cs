using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class GazetViwer : MonoBehaviour
{
    [SerializeField]
    private Slider slider;          // ∞°¡¨ ƒ≈∏¿”
    [SerializeField]
    private Image gazetImage;       // ∞°¡¨ æ∆¿Ãƒ‹
    private float gazetCoolTime;
    private GazetBase gazetBase;    // º“¿Ø«— ∞°¡¨

    private void Awake()
    {
        gazetBase = GameManager.instance.holdingGazet.GetComponent<GazetBase>();
        if (gazetBase != null)
        {
            gazetImage.sprite = gazetBase.GazetIcon;
            gazetCoolTime = gazetBase.Rate;
        }
    }

    private void Update()
    {
        if(GameManager.instance.isGameStart)
        {
            gazetCoolTime += Time.deltaTime;
            slider.value = gazetCoolTime / gazetBase.Rate;
            if (Input.GetKeyDown(KeyCode.Q) && slider.value >= 1)
            {
                gazetCoolTime = 0.0f;
            }
        }
    }
}
