using UnityEngine;

public class KeyPressHandler : MonoBehaviour
{
    public string playerTag = "Player"; // 플레이어 태그 설정
    private bool isPlayerNearby = false;

    [SerializeField]
    private GameObject gameStartPanel;

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag(playerTag))
        {
            isPlayerNearby = true;
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag(playerTag))
        {
            isPlayerNearby = false;
        }
    }

    private void Update()
    {
        if (isPlayerNearby && Input.GetKeyDown(KeyCode.F))
        {
            if (gameObject.name == "Truck")
            {
                Cursor.lockState = CursorLockMode.None;
                Cursor.visible = true;
                gameStartPanel.SetActive(true);
            }
            else if (gameObject.name == "Table")
            {
                DoTableInteraction();
            }
        }
    }

    public void GameStart()
    {
        SceneManagerScript.Instance.LoadRandomScene(); // 씬 이동 실행
        GameManager.instance.isGameStart = true;
    }

    public void Continue()
    {
        Cursor.visible = false;
        Cursor.lockState = CursorLockMode.Locked;
        gameStartPanel.SetActive(false);
    }

    private void DoTableInteraction()
    {
        Debug.Log("Table과 상호작용 실행됨.");
        // 테이블과의 상호작용 로직 추가
    }
}