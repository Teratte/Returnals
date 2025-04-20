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
            GameManager.instance.ActiveUI();
            weaponSelectPanel.SetActive(true);
        }
    }

    public void GameStart()
    {
        startPanel.SetActive(false);
        SceneManagerScript.Instance.LoadRandomScene(); // 씬 이동 실행
        GameManager.instance.isGameStart = true;
        GameManager.instance.DeactiveUI();
    }

    public void ActivePanel()
    {
        if (GameManager.instance.subWeapon == null || GameManager.instance.holdingGazet == null || GameManager.instance.mainWeapon == null)   // 무기나 가젯을 다 선택하지 않았을 경우, 실행X
            return;
        weaponSelectPanel.SetActive(false);
        startPanel.SetActive(true);
        GameManager.instance.ActiveUI();
    }

    public void Continue()
    {
        GameManager.instance.DeactiveUI();
        weaponSelectPanel.SetActive(false);
        startPanel.SetActive(false);
    }
}
