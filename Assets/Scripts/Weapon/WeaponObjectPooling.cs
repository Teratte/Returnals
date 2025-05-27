using UnityEngine;

public class WeaponObjectPooling : MonoBehaviour
{
    public static WeaponObjectPooling instance;

    private UIWeapon[] objectPooling;
    [SerializeField]
    private GameObject[] gameObjects;

    public UIWeapon[] ObjectPooling => objectPooling;
    public GameObject[] GameObjects => gameObjects;

    private void Awake()
    {
        if(instance != null && instance != this)
        {
            Destroy(gameObject);
            return;
        }
        instance = this;
        objectPooling = transform.GetComponentsInChildren<UIWeapon>();
        DontDestroyOnLoad(gameObject);
        //DeactivePooling();
    }

    public void DeactivePooling()
    {
        foreach (UIWeapon weapon in objectPooling)
        {
            weapon.gameObject.SetActive(false);
        }
    }

    public void ActivePooling(string weaponName)
    {
        foreach(GameObject weapon in gameObjects)
        {
            UIWeapon uiWeapon = weapon.GetComponent<UIWeapon>();
            if (uiWeapon.Name == weaponName)
            {
                weapon.gameObject.SetActive(true);
            }
        }
    }
}
