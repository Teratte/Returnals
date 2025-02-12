using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class PlayerStaminaViewer : MonoBehaviour
{
    [SerializeField]
    private Status status;
    [SerializeField]
    private TextMeshProUGUI textStamina;
    private Slider sliderStamina;

    private void Awake()
    {
        sliderStamina = GetComponent<Slider>();
    }

    private void Update()
    {
        sliderStamina.value = status.PlayerStamina / status.MaxStamina;
        textStamina.text = $"스태미나 {(int)status.PlayerStamina}/{status.MaxStamina}";
    }
}
