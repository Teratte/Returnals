using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class PanelAchievement : MonoBehaviour
{
    [SerializeField]
    private Slider sliderProgress;
    [SerializeField]
    private TextMeshProUGUI textProgress;
    [SerializeField]
    private Sprite spriteCheck;
    [SerializeField]
    private Image[] radioIngredients;
    [SerializeField]
    private GameObject buttonEnding;
    private float percent = 0.0f;

    private void OnEnable()
    {
        percent = 0.0f;
        textProgress.text = $"{GameManager.instance.selectWeaponList.Count} / 15";
        sliderProgress.value = GameManager.instance.selectWeaponList.Count / 15.0f;

        foreach(Image image in radioIngredients)
        {
            percent += 0.25f;
            if(sliderProgress.value >= percent)
                image.sprite = spriteCheck;

            if(sliderProgress.value >= 1)
                buttonEnding.SetActive(true);

        }
    }
}
