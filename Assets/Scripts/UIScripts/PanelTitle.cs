using UnityEngine;

public class PanelTitle : MonoBehaviour
{
    [SerializeField]
    private GameObject blurVolume;
    [SerializeField]
    private GameObject postProcessVolume;

    private void Awake()
    {
        postProcessVolume.SetActive(false);
        blurVolume.SetActive(true);
    }
}
