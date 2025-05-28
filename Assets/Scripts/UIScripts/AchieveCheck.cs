using UnityEngine;
using UnityEngine.UI;

public class AchieveCheck : MonoBehaviour
{
    [SerializeField]
    private Slider sliderProgress;  // �޼��� �����̴�
    [SerializeField]
    private Sprite spriteCheck;
    private Image iconImage; // ��ư�� ������ �ִ� �̹���


    private void Awake()
    {
        iconImage = GetComponent<Image>();
    }

    public void Achieve(float percent)
    {
        if(sliderProgress.value >= percent)
        {
            iconImage.sprite = spriteCheck;

        }
    }
}
