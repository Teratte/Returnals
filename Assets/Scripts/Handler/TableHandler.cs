using UnityEngine;

public class TableHandler : KeyPressHandler
{
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
    }
}
