using TMPro;
using UnityEngine;
using System.Collections;

public class DialogSystem : MonoBehaviour
{
    [SerializeField]
    [TextArea(3, 5)]
    private string[] dialogs;
    [SerializeField]
    private TextMeshProUGUI speakText;
    [SerializeField]
    private bool isFirst = true; // 최초 1회만 호출
    [SerializeField]
    private bool isAutoStart = true; // 자동 시작 여부
    [SerializeField]
    private GameObject arrow;        // 화살표 오브젝트

    private int currentDialogIndex = -1; // 현재 대사 순번
    private float typingSpeed = 0.1f;   // 텍스트 타이핑 효과의 재생 속도
    private bool isTypingEffect = false; // 텍스트 타이핑 효과를 재생 중인지.

    private void Awake()
    {
        UpdateDialog();
    }

    private void Update()
    {
        UpdateDialog();
    }

    public bool UpdateDialog()
    {
        // 대사 분기가 시작될 때 1회만 호출
        if(isFirst == true)
        {
            // 자동 재생으로 설정되어있으면 첫 번째 대사 재생
            if (isAutoStart)
                SetNextDialog();

            isFirst = false;
        }

        if(Input.GetMouseButtonDown(0))
        {
            // 텍스트 타이핑 효과를 재생 중일 때 마우스 왼쪽 클릭 시 타이핑 효과 종료
            if(isTypingEffect)
            {
                isTypingEffect = false;

                // 타이핑 효과 중지하고, 현재 대사 전체 출력
                StopCoroutine("OnTypingText");
                speakText.text = dialogs[currentDialogIndex];
                // 대사가 완료되었을 때 출력되는 커서 활성화
                arrow.SetActive(true);

                return false;
            }
            // 대사가 남아있을 경우 다음 대사 진행
            if(dialogs.Length > currentDialogIndex + 1)
            {
                SetNextDialog();
            }
            // 대사가 남아있지 않을 경우 모든 오브젝트 비활성화하고 true 반환
            else
            {
                // 엔딩
                arrow.SetActive(false);
                speakText.text = "The End";
                return true;
            }
        }

        return false;
    }

    public void SetNextDialog()
    {
        currentDialogIndex++;

        SetActive();
        // 현재 텍스트 설정
        //speakText.text = dialogs[currentDialogIndex];
        StartCoroutine("OnTypingText");
    }
    
    public void SetActive()
    {
        arrow.SetActive(false);
    }

    private IEnumerator OnTypingText()
    {
        int index = 0;

        isTypingEffect = true;

        // 텍스트를 한 글자씩 타이핑치듯 재생
        while(index < dialogs[currentDialogIndex].Length)
        {
            speakText.text = dialogs[currentDialogIndex].Substring(0, index);

            index++;

            yield return new WaitForSeconds(typingSpeed);
        }

        isTypingEffect = false;

        // 대사가 완료되었을 때 출력되는 커서 활성화
        arrow.SetActive(true);
    }
}
