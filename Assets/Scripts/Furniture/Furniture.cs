using UnityEngine;

public class Furniture : MonoBehaviour
{
    [SerializeField]
    private string furnitureName;

    public string FurnitureName => furnitureName;

    public void SetActive(bool isActive)
    {
        gameObject.SetActive(isActive);
    }
}
