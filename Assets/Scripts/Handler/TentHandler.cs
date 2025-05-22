using UnityEngine;

public class TentHandler : KeyPressHandler
{
    [SerializeField]
    private GameObject PanelAchievement;
    [SerializeField]
    private ClickByRaycast clicker;

    public override void Interact()
    {
        if (!clicker.isPanelActive)
        {
            GameManager.instance.isUIOn = true;
            PanelAchievement.SetActive(true);
            clicker.isPanelActive = true;
        }
    }

    public void ClosePanelAchievement()
    {
        GameManager.instance.isUIOn = false;
        PanelAchievement.SetActive(false);
        clicker.isPanelActive=false;
    }
}
