using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class PanelAchievement : MonoBehaviour
{
    private Slider sliderProgress;
    [SerializeField]
    private TextMeshProUGUI textProgress;

    private void Awake()
    {
        sliderProgress = GetComponent<Slider>();
    }

    private void OnEnable()
    {
        textProgress.text = $"{GameManager.instance.selectWeaponList.Count} / 15";
        //sliderProgress.value = GameManager.instance.selectWeaponList.Count / 15;
    }

    private void Update()
    {
        sliderProgress.value = GameManager.instance.selectWeaponList.Count / 15;
    }
}
