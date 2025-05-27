using UnityEngine;

public class FurnitureManager : MonoBehaviour
{
    private Furniture[] furnitures;

    private void Awake()
    {
        furnitures = transform.GetComponentsInChildren<Furniture>();

        foreach(var furniture in furnitures)
        {
            if(!GameManager.instance.Furnitures.ContainsKey(furniture.FurnitureName))
                GameManager.instance.Furnitures.Add(furniture.FurnitureName, false);
        }

        ActiveFurnitures();
    }

    public void ActiveFurnitures()
    {
        foreach(var furniture in furnitures)
        {
            if(GameManager.instance.Furnitures.ContainsKey(furniture.FurnitureName))
            {
                furniture.SetActive(GameManager.instance.Furnitures[furniture.FurnitureName]);
            }
        }
    }
}
