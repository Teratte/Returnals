using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class PlayerStaminaViewer : MonoBehaviour
{
    [SerializeField]
    private Status status;
    [SerializeField]
    private TextMeshProUGUI textStamina;

    private void Update()
    {
        textStamina.text = $"{(int)status.PlayerStamina} / {(int)status.MaxStamina}";
    }
}
