using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class GazetViwer : MonoBehaviour
{
    [SerializeField]
    private Slider slider;          // °¡Á¬ ÄðÅ¸ÀÓ
    [SerializeField]
    private Image gazetImage;       // °¡Á¬ ¾ÆÀÌÄÜ
    [SerializeField]
    private TextMeshProUGUI gazetAbleCount; // °¡Á¬ »ç¿ë °¡´É È½¼ö
    private float gazetCoolTime;
    private GazetBase gazetBase;    // ¼ÒÀ¯ÇÑ °¡Á¬
    private Status status;

    private void Awake()
    {
        status = FindAnyObjectByType<Status>();
        gazetBase = GameManager.instance.holdingGazet.GetComponent<GazetBase>();
        if (gazetBase != null)
        {
            gazetImage.sprite = gazetBase.GazetIcon;
            gazetCoolTime = gazetBase.Rate;
        }
    }

    private void Update()
    {
        gazetAbleCount.text = $"{gazetBase.CurrentAbleCount}";
        gazetCoolTime += Time.deltaTime;
        slider.value = gazetCoolTime / gazetBase.Rate;
        if (Input.GetKeyDown(KeyCode.Q) && slider.value >= 1 && gazetBase.CurrentAbleCount > 0 && status.PlayerHP < status.MaxHP)
        {
            gazetCoolTime = 0.0f;
        }
    }
}
