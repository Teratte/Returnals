using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class PlayerHPViewer : MonoBehaviour
{
    //[SerializeField]
    //private TextMeshProUGUI textHP; // 플레이어의 체력 텍스트를 출력하는 Text UI
    private Slider slider;
    private Status status;

    private void Awake()
    {
        slider = GetComponent<Slider>();
        status = FindAnyObjectByType<Status>();
    }

    private void Update()
    {
        slider.value = 1-(status.PlayerHP / status.MaxHP);
        //textHP.text = $"{(int)status.PlayerHP} / {(int)status.MaxHP}";
    }
}
