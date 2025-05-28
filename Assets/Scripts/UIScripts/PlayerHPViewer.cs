using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class PlayerHPViewer : MonoBehaviour
{
    //[SerializeField]
    //private TextMeshProUGUI textHP; // �÷��̾��� ü�� �ؽ�Ʈ�� ����ϴ� Text UI
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
