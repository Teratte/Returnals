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
        Debug.Log("Table과 상호작용 실행됨.");
        // 테이블과의 상호작용 로직 추가
        producePanel.SetActive(true);
        GameManager.instance.ActiveUI();
    }

    public void ExitProducePanel()
    {
        producePanel.SetActive(false);
        GameManager.instance.DeactiveUI();
    }
}
