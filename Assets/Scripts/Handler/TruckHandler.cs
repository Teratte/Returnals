using UnityEngine;

public class TruckHandler : KeyPressHandler
{
    [SerializeField]
    private GameObject weaponSelectPanel;
    [SerializeField]
    private GameObject startPanel;

    private void Update()
    {
        if (isPlayerNearby && Input.GetKeyDown(KeyCode.F) && !startPanel.activeSelf)
        {
            Cursor.lockState = CursorLockMode.None;
            Cursor.visible = true;
            weaponSelectPanel.SetActive(true);
        }
    }

    public void GameStart()
    {
        SceneManagerScript.Instance.LoadRandomScene(); // �� �̵� ����
        GameManager.instance.isGameStart = true;
    }

    public void ActivePanel()
    {
        if (GameManager.instance.subWeapon == null || GameManager.instance.holdingGazet == null || GameManager.instance.mainWeapon == null)   // ���⳪ ������ �� �������� �ʾ��� ���, ����X
            return;
        weaponSelectPanel.SetActive(false);
        startPanel.SetActive(true);
    }

    public void Continue()
    {
        Cursor.visible = false;
        Cursor.lockState = CursorLockMode.Locked;
        weaponSelectPanel.SetActive(false);
        startPanel.SetActive(false);
    }
}
