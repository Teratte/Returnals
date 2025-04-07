using UnityEngine;

public class ProduceTable : MonoBehaviour
{
    [SerializeField]
    GameObject[] Panels;

    public void ActiveBulletPanel()
    {
        foreach(GameObject panel in Panels)
        {
            panel.SetActive(false);
        }

        Panels[0].SetActive(true);
    }

    public void ActiveWeaponPanel()
    {
        foreach (GameObject panel in Panels)
        {
            panel.SetActive(false);
        }

        Panels[1].SetActive(true);
    }

    public void ActiveGazetPanel()
    {
        foreach (GameObject panel in Panels)
        {
            panel.SetActive(false);
        }

        Panels[2].SetActive(true);
    }

    public void ActiveFurniturePanel()
    {
        foreach (GameObject panel in Panels)
        {
            panel.SetActive(false);
        }

        Panels[3].SetActive(true);
    }
}
