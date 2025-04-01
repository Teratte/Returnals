using UnityEngine;

public class KeyPressHandler : MonoBehaviour
{
    protected string playerTag = "Player"; // 플레이어 태그 설정
    protected bool isPlayerNearby = false;

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
            if (gameObject.name == "Table")
            {
                DoTableInteraction();
            }
        }
    }

    private void DoTableInteraction()
    {
        Debug.Log("Table과 상호작용 실행됨.");
        // 테이블과의 상호작용 로직 추가
    }
}