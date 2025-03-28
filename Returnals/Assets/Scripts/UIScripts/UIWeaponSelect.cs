using UnityEngine;

public class UIWeaponSelect : MonoBehaviour
{
    [SerializeField]
    private GameObject weaponSelectPanel;
    [SerializeField]
    private GameObject startPanel;

    public void DeactivePanel()
    {
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
        weaponSelectPanel.SetActive(false);
    }

    public void ActivePanel()
    {
        weaponSelectPanel.SetActive(false);
        startPanel.SetActive(true);
    }
}
