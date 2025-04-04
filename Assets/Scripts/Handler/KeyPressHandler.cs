using UnityEngine;

public class KeyPressHandler : MonoBehaviour
{
    protected string playerTag = "Player"; // �÷��̾� �±� ����
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

            // �ӽ� �׽�Ʈ
            if (gameObject.name == "Truck")
            {
                SceneManagerScript.Instance.LoadRandomScene(); // �� �̵� ����
            }
        }
    }

    private void DoTableInteraction()
    {
        Debug.Log("Table�� ��ȣ�ۿ� �����.");
        // ���̺���� ��ȣ�ۿ� ���� �߰�
    }
}