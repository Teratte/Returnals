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
    private bool isFirst = true; // ���� 1ȸ�� ȣ��
    [SerializeField]
    private bool isAutoStart = true; // �ڵ� ���� ����
    [SerializeField]
    private GameObject arrow;        // ȭ��ǥ ������Ʈ

    private int currentDialogIndex = -1; // ���� ��� ����
    private float typingSpeed = 0.1f;   // �ؽ�Ʈ Ÿ���� ȿ���� ��� �ӵ�
    private bool isTypingEffect = false; // �ؽ�Ʈ Ÿ���� ȿ���� ��� ������.

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
        // ��� �бⰡ ���۵� �� 1ȸ�� ȣ��
        if(isFirst == true)
        {
            // �ڵ� ������� �����Ǿ������� ù ��° ��� ���
            if (isAutoStart)
                SetNextDialog();

            isFirst = false;
        }

        if(Input.GetMouseButtonDown(0))
        {
            // �ؽ�Ʈ Ÿ���� ȿ���� ��� ���� �� ���콺 ���� Ŭ�� �� Ÿ���� ȿ�� ����
            if(isTypingEffect)
            {
                isTypingEffect = false;

                // Ÿ���� ȿ�� �����ϰ�, ���� ��� ��ü ���
                StopCoroutine("OnTypingText");
                speakText.text = dialogs[currentDialogIndex];
                // ��簡 �Ϸ�Ǿ��� �� ��µǴ� Ŀ�� Ȱ��ȭ
                arrow.SetActive(true);

                return false;
            }
            // ��簡 �������� ��� ���� ��� ����
            if(dialogs.Length > currentDialogIndex + 1)
            {
                SetNextDialog();
            }
            // ��簡 �������� ���� ��� ��� ������Ʈ ��Ȱ��ȭ�ϰ� true ��ȯ
            else
            {
                // ����
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
        // ���� �ؽ�Ʈ ����
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

        // �ؽ�Ʈ�� �� ���ھ� Ÿ����ġ�� ���
        while(index < dialogs[currentDialogIndex].Length)
        {
            speakText.text = dialogs[currentDialogIndex].Substring(0, index);

            index++;

            yield return new WaitForSeconds(typingSpeed);
        }

        isTypingEffect = false;

        // ��簡 �Ϸ�Ǿ��� �� ��µǴ� Ŀ�� Ȱ��ȭ
        arrow.SetActive(true);
    }
}
