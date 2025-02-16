using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class PlayerHPViewer : MonoBehaviour
{
    [SerializeField]
    private Status status;  // �÷��̾��� ������
    [SerializeField]
    private TextMeshProUGUI textHP; // �÷��̾��� ü�� �ؽ�Ʈ�� ����ϴ� Text UI

    private Slider sliderHP;// �÷��̾��� ü���� �� ���·� ����ϴ� Slider UI

    private void Awake()
    {
        sliderHP = GetComponent<Slider>();
    }

    private void Update()
    {
        // ���� ü�� / �ִ� ü������ 0.0 ~ 1.0 ������ ���� ������ Slider UI�� ���
        sliderHP.value = status.PlayerHP / status.MaxHP;
        textHP.text = $"ü�� {(int)status.PlayerHP}/{status.MaxHP}";
    }
}
