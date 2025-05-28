using UnityEngine;

public class ClickByRaycast : MonoBehaviour
{
    public bool isPanelActive = false;

    void Update()
    {
        if (GameManager.instance.isUIOn)
            return;
        if (Input.GetMouseButtonDown(0))
        {
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;

            if (Physics.Raycast(ray, out hit))
            {
                Debug.Log("Clicked on: " + hit.collider.gameObject.name);
                // ���ϴ� ������Ʈ���� �Լ� ȣ�⵵ ����
                var handler = hit.collider.GetComponent<KeyPressHandler>();
                if (handler != null)
                {
                    handler.Interact();
                }
            }
        }
    }
}
