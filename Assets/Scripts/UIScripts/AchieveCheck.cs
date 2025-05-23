using UnityEngine;
using UnityEngine.UI;

public class AchieveCheck : MonoBehaviour
{
    [SerializeField]
    private Slider sliderProgress;  // 달성률 슬라이더
    [SerializeField]
    private Sprite spriteCheck;
    private Image iconImage; // 버튼이 가지고 있는 이미지


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
