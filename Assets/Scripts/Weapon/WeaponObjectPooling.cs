using UnityEngine;

public class WeaponObjectPooling : MonoBehaviour
{
    public static WeaponObjectPooling instance;

    public GameObject[] weaponObjects;

    private void Awake()
    {
        instance = this;
        SetActiveSelf();
        SetUp();
    }

    // 게임매니저에 보관되어있는 무기에 대한 정보를 게임에 적용
    public void SetActiveSelf()
    {
        foreach(var weapon in weaponObjects)
        {
            UIWeapon uiWeapon = weapon.GetComponent<UIWeapon>();
            if (GameManager.instance.Weapons.ContainsKey(uiWeapon.Name))
                weapon.SetActive(GameManager.instance.Weapons[uiWeapon.Name]);
        }
    }

    public void SetUp()
    {
        foreach(var weaponObject in weaponObjects)
        {
            UIWeapon uiWeapon = weaponObject.GetComponent<UIWeapon>();
            // 무기가 기본으로 제공되는 것이고 게임 매니저 무기 정보에 해당 무기가 없다면 추가
            if(uiWeapon.isBaseWeapon && !GameManager.instance.Weapons.ContainsKey(uiWeapon.Name))
            {
                GameManager.instance.Weapons.Add(uiWeapon.Name, true);
            }
            else if(!uiWeapon.isBaseWeapon && !GameManager.instance.Weapons.ContainsKey(uiWeapon.Name))
            {
                GameManager.instance.Weapons.Add (uiWeapon.Name, false);
            }
        }
    }

    public void ActiveObject(string name)
    {
        foreach(var weaponObject in weaponObjects)
        {
            UIWeapon uiWeapon = weaponObject.GetComponent<UIWeapon>();
            if (uiWeapon != null)
            {
                if(uiWeapon.Name == name && GameManager.instance.Weapons.ContainsKey(name))
                {
                    GameManager.instance.Weapons[name] = true;
                    weaponObject.SetActive(GameManager.instance.Weapons[name]);
                }
            }
        }
    }
}
