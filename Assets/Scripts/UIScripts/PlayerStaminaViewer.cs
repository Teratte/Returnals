using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class PlayerStaminaViewer : MonoBehaviour
{
    [SerializeField]
    private TextMeshProUGUI textStamina;

    private Slider slider;
    private Status status;

    private void Awake()
    {
        slider = GetComponent<Slider>();
        status = FindAnyObjectByType<Status>();
    }

    private void Update()
    {
        slider.value = 1 - status.PlayerStamina / status.MaxStamina;
        textStamina.text = $"{(int)status.PlayerStamina} / {(int)status.MaxStamina}";
    }
}
