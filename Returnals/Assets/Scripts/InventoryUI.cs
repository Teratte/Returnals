using UnityEngine;

public class InventoryUI : MonoBehaviour
{
    [SerializeField]
    GameObject InventoryObject;

    private void Awake()
    {
        InventoryObject.SetActive(false);
    }

    private void Update()
    {
        if(Input.GetKey(KeyCode.Tab))
        {
            InventoryObject.SetActive(true);
        }
        else
        {
            InventoryObject.SetActive(false);
        }
    }
}
