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

    // ���ӸŴ����� �����Ǿ��ִ� ���⿡ ���� ������ ���ӿ� ����
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
            // ���Ⱑ �⺻���� �����Ǵ� ���̰� ���� �Ŵ��� ���� ������ �ش� ���Ⱑ ���ٸ� �߰�
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
