using UnityEngine;

public class KeyPressHandler : MonoBehaviour
{
    public string playerTag = "Player"; // 플레이어 태그 설정
    private bool isPlayerNearby = false;

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
            SceneManagerScript.Instance.LoadRandomScene(); // 씬 이동 실행
            GameManager.instance.isGameStart = true;
        }
    }
}
