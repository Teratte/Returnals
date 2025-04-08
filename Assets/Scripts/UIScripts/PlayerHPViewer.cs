using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class PlayerHPViewer : MonoBehaviour
{
    [SerializeField]
    private Status status;  // �÷��̾��� ������
    [SerializeField]
    private TextMeshProUGUI textHP; // �÷��̾��� ü�� �ؽ�Ʈ�� ����ϴ� Text UI

    private void Update()
    {
        textHP.text = $"{(int)status.PlayerHP} / {(int)status.MaxHP}";
    }
}
