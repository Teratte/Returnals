using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class PlayerHPViewer : MonoBehaviour
{
    [SerializeField]
    private Status status;  // 플레이어의 정보들
    [SerializeField]
    private TextMeshProUGUI textHP; // 플레이어의 체력 텍스트를 출력하는 Text UI

    private Slider sliderHP;// 플레이어의 체력을 바 형태로 출력하는 Slider UI

    private void Awake()
    {
        sliderHP = GetComponent<Slider>();
    }

    private void Update()
    {
        // 현재 체력 / 최대 체력으로 0.0 ~ 1.0 사이의 값을 연산해 Slider UI에 출력
        sliderHP.value = status.PlayerHP / status.MaxHP;
        textHP.text = $"체력 {(int)status.PlayerHP}/{status.MaxHP}";
    }
}
