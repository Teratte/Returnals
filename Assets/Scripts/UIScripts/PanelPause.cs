using UnityEngine;

public class PanelPause : MonoBehaviour
{
    [SerializeField]
    private GameObject SaveButton;

    private void OnEnable()
    {
        if(GameManager.instance.isGameStart)
        {
            SaveButton.SetActive(false);
        }
        else
        {
            SaveButton.SetActive(true);
        }
    }
}
