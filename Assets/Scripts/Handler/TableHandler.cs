using UnityEngine;

public class TableHandler : KeyPressHandler
{
    [SerializeField]
    private GameObject producePanel;

    private void Update()
    {
        if (isPlayerNearby && Input.GetKeyDown(KeyCode.F))
        {
            DoTableInteraction();
        }
    }

    private void DoTableInteraction()
    {
        Debug.Log("Table�� ��ȣ�ۿ� �����.");
        // ���̺���� ��ȣ�ۿ� ���� �߰�
        producePanel.SetActive(true);
        GameManager.instance.ActiveUI();
    }

    public void ExitProducePanel()
    {
        producePanel.SetActive(false);
        GameManager.instance.DeactiveUI();
    }
}
