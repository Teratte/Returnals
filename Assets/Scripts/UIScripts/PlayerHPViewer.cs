using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class PlayerHPViewer : MonoBehaviour
{
    [SerializeField]
    private Status status;  // 플레이어의 정보들
    [SerializeField]
    private TextMeshProUGUI textHP; // 플레이어의 체력 텍스트를 출력하는 Text UI

    private void Update()
    {
        textHP.text = $"{(int)status.PlayerHP} / {(int)status.MaxHP}";
    }
}
