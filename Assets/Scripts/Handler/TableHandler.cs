using UnityEngine;

public class TableHandler : KeyPressHandler
{
    [SerializeField]
    private GameObject producePanel;
    [SerializeField]
    private ClickByRaycast clicker;

    public void DoTableInteraction()
    {
        Debug.Log("Table과 상호작용 실행됨.");
        // 테이블과의 상호작용 로직 추가
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
