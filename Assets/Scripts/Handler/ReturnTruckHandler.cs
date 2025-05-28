using UnityEngine;
using UnityEngine.SceneManagement;

public class ReturnTruckHandler : KeyPressHandler
{
    [SerializeField]
    private GameObject returnPanel;
    private bool isPlayerNearby = false;

    private void Update()
    {
        if (isPlayerNearby && Input.GetKeyDown(KeyCode.F))
        {
            Interact();
        }
    }

    public void ContinueGame()
    {
        returnPanel.SetActive(false);
        GameManager.instance.DeactiveUI();
    }

    public void ReturnToBaseCamp()
    {
        // 결과 환산창 출력
        SceneManagerScript.Instance.LoadScene("BaseCamp");
        GameManager.instance.isGameStart = false;
        GameManager.instance.isUIOn = false;
    }

    public override void Interact()
    {
        GameManager.instance.ActiveUI();
        returnPanel.SetActive(true);
    }

    private void OnTriggerEnter(Collider other)
    {
        var player = other.GetComponent<PlayerController>();
        if (player != null)
        {
            isPlayerNearby = true;
            textInteract.text = "F키를 눌러 복귀";
            textInteract.enabled = true;
        }
    }

    private void OnTriggerExit(Collider other)
    {
        var player = other.GetComponent<PlayerController>();
        if (player != null)
        {
            isPlayerNearby = false;
            textInteract.enabled = false;
        }
    }
}
