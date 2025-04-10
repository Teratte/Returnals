using UnityEngine;
using UnityEngine.SceneManagement;

public class ReturnTruckHandler : KeyPressHandler
{
    [SerializeField]
    private GameObject returnPanel;

    private void Update()
    {
        if (isPlayerNearby && Input.GetKeyDown(KeyCode.F))
        {
            GameManager.instance.ActiveUI();
            returnPanel.SetActive(true);
        }
    }

    public void ContinueGame()
    {
        returnPanel.SetActive(false);
        GameManager.instance.DeactiveUI();
    }

    public void ReturnToBaseCamp()
    {
        GameManager.instance.DeactiveUI();

        // ��� ȯ��â ���
        GameManager.instance.isGameStart = false;
        SceneManager.LoadScene("BaseCampTest");
    }
}
