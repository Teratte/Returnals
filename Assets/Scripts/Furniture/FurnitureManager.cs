using UnityEngine;

public class FurnitureManager : MonoBehaviour
{
    public static  FurnitureManager instance;

    public GameObject[] furnitureObjects;

    private void Awake()
    {
        instance = this;
        foreach(var furnitureObject in furnitureObjects)
        {
            Furniture furniture = furnitureObject.GetComponent<Furniture>();
            if(!GameManager.instance.Furnitures.ContainsKey(furniture.FurnitureName))
                GameManager.instance.Furnitures.Add(furniture.FurnitureName, false);
        }

        ActiveFurnitures();
    }

    public void ActiveFurnitures()
    {
        foreach(var furnitureObject in furnitureObjects)
        {
            Furniture furniture = furnitureObject.GetComponent<Furniture>();
            if(GameManager.instance.Furnitures.ContainsKey(furniture.FurnitureName))
            {
                furniture.SetActive(GameManager.instance.Furnitures[furniture.FurnitureName]);
            }
        }
    }
}
