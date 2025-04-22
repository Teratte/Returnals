using UnityEngine;
using UnityEngine.UI;

public class GazetViwer : MonoBehaviour
{
    private PlayerAnimator playerAnimator;
    [SerializeField]
    private Slider slider;
    [SerializeField]
    private Image gazetImage;
    private float gazetCoolTime;
    private GazetBase gazetBase;

    private void Awake()
    {
        playerAnimator = FindAnyObjectByType<PlayerAnimator>();
    }

    private void Start()
    {
        gazetCoolTime = playerAnimator.Gazet.Rate;
        gazetBase = GameManager.instance.holdingGazet.GetComponent<GazetBase>();
        if (gazetBase != null)
        {
            gazetImage.sprite = gazetBase.GazetIcon;
        }
    }

    private void Update()
    {
        gazetCoolTime += Time.deltaTime;
        slider.value = gazetCoolTime / playerAnimator.Gazet.Rate;
        if (Input.GetKeyDown(KeyCode.Q) && slider.value >= 1)
        {
            gazetCoolTime = 0.0f;
        }

    }
}
