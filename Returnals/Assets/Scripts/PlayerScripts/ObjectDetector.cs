using UnityEngine;
using TMPro;

public class ObjectDetector : MonoBehaviour
{
    [SerializeField]
    private TextMeshProUGUI textInteraction;

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Interactable"))
        {
            if(textInteraction.enabled == false)
            {
                textInteraction.enabled = true;

                string name = other.name.Split('_')[0];
                textInteraction.text = $"{name}";
            }
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if(other.CompareTag("Interactable"))
        {
            if (textInteraction.enabled == true)
            {
                textInteraction.enabled = false;
            }
        }
    }
}
