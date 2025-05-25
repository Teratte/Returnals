using UnityEngine;

public class TruckHandler : KeyPressHandler
{
    [SerializeField]
    private GameObject weaponSelectPanel;
    [SerializeField]
    private GameObject startPanel;
    [SerializeField]
    private ClickByRaycast clicker;

    public void GameStart()
    {
        AudioManager.instance.PlayTruckSound();
        startPanel.SetActive(false);
        SceneManagerScript.Instance.LoadRandomScene(); // �� �̵� ����
        GameManager.instance.isGameStart = true;
        GameManager.instance.DeactiveUI();
        clicker.isPanelActive = false;
    }

    public void ActivePanel()
    {
        // ���⳪ ������ �� �������� �ʾ��� ���, ����X
        if (GameManager.instance.subWeapon == null || GameManager.instance.holdingGazet == null || GameManager.instance.mainWeapon == null)
            return;
        weaponSelectPanel.SetActive(false);
        startPanel.SetActive(true);
        GameManager.instance.isUIOn = true;
    }

    public void Continue()
    {
        GameManager.instance.isUIOn = false;
        weaponSelectPanel.SetActive(false);
        startPanel.SetActive(false);
        clicker.isPanelActive = false;
    }

    public override void Interact()
    {
        if (!startPanel.activeSelf && !clicker.isPanelActive)
        {
            GameManager.instance.isUIOn = true;
            weaponSelectPanel.SetActive(true);
            clicker.isPanelActive = true;
        }
    }
}
