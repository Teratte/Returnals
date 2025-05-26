using UnityEngine;

public class TableHandler : KeyPressHandler
{
    [SerializeField]
    private GameObject producePanel;
    [SerializeField]
    private ClickByRaycast clicker;

    public void DoTableInteraction()
    {
        Debug.Log("Table�� ��ȣ�ۿ� �����.");
        AudioManager.instance.PlayWorkBenchSound();
        // ���̺���� ��ȣ�ۿ� ���� �߰�
        producePanel.SetActive(true);
        GameManager.instance.isUIOn = true;
        clicker.isPanelActive = true;
    }

    public void ExitProducePanel()
    {
        producePanel.SetActive(false);
        GameManager.instance.isUIOn = false;
        clicker.isPanelActive = false;
    }

    public override void Interact()
    {
        if(!clicker.isPanelActive)
        {
            DoTableInteraction();
        }
    }
}
