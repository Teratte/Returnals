using System.Collections;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class PanelAchievement : MonoBehaviour
{
    [SerializeField]
    private Slider sliderProgress;
    [SerializeField]
    private TextMeshProUGUI textProgress;
    [SerializeField]
    private Sprite spriteCheck;
    [SerializeField]
    private Image[] radioIngredients;
    [SerializeField]
    private GameObject buttonEnding;
    [SerializeField]
    private Transform AchieveParent;    // 과제 목록들의 부모 객체
    private Achievement[] achievements;
    private float percent = 0.0f;

    [Header("엔딩씬")]
    [SerializeField]
    private AnimationCurve currentEndingCurtain;
    [SerializeField]
    private Image endingCurtain;

    private void OnEnable()
    {
        achievements = AchieveParent.GetComponentsInChildren<Achievement>();
        percent = 0.0f;
        textProgress.text = $"{CheckProgress()} / 16";
        sliderProgress.value = CheckProgress() / 16.0f;

        foreach(Image image in radioIngredients)
        {
            percent += 0.25f;
            if(sliderProgress.value >= percent)
                image.sprite = spriteCheck;

            if(sliderProgress.value >= 1)
                buttonEnding.SetActive(true);
            else
                buttonEnding.SetActive(false);
        }
    }

    private int CheckProgress()
    {
        int clearCount = 0;
        foreach(Achievement achievement in achievements)
        {
            if(achievement.Assignment())
            {
                clearCount++;
                achievement.AchieveIcon.sprite = spriteCheck;
            }
        }

        return clearCount;
    }

    public void GoToEnding()
    {
        GameManager.instance.DeactiveUI();
        endingCurtain.enabled = true;
        StopCoroutine("OnEndingCurtain");
        StartCoroutine("OnEndingCurtain");
    }

    private IEnumerator OnEndingCurtain()
    {
        float percent = 0.0f;

        while(percent < 2.0f)
        {
            percent += Time.deltaTime;

            Color color = endingCurtain.color;
            color.a = Mathf.Lerp(0, 1, currentEndingCurtain.Evaluate(percent));  
            endingCurtain.color = color;

            yield return null;
        }

        if(percent > 2.0f)
        {
            SceneManagerScript.Instance.LoadScene("EndingScene");
            AudioManager.instance.PlayEndingSound();
        }
    }
}
