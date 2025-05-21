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
                // 원하는 컴포넌트에서 함수 호출도 가능
                var handler = hit.collider.GetComponent<KeyPressHandler>();
                if (handler != null)
                {
                    handler.Interact();
                }
            }
        }
    }
}
