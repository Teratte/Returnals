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
        // ���̺���� ��ȣ�ۿ� ���� �߰�
        producePanel.SetActive(true);
        GameManager.instance.ActiveUI();
        clicker.isPanelActive = true;
    }

    public void ExitProducePanel()
    {
        producePanel.SetActive(false);
        //GameManager.instance.DeactiveUI();
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
