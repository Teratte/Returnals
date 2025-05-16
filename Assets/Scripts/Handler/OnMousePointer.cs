using TMPro;
using UnityEngine;

public class OnMousePointer : MonoBehaviour
{
    [SerializeField]
    private MeshRenderer[] meshRenderers;
    [SerializeField]
    private TextMeshProUGUI interactionText;
    [SerializeField]
    private string objectInformation;
    private Color originalColor;
    private Color newColor = Color.red;

    private void Awake()
    {
        originalColor = meshRenderers[0].material.color;
    }

    private void OnMouseEnter()
    {
        if (GameManager.instance.isUIOn)
            return;

        foreach (var renderer in meshRenderers)
        {
            renderer.material.color = newColor;
        }

        //Vector3 mousePos = Input.mousePosition;
        interactionText.text = objectInformation;
        //interactionText.transform.position = mousePos;
        interactionText.enabled = true;
    }

    private void OnMouseOver()
    {
        if (GameManager.instance.isUIOn)
            return;

        Vector3 mousePos = Input.mousePosition;
        interactionText.transform.position = mousePos;
    }

    private void OnMouseExit()
    {
        foreach (var renderer in meshRenderers)
        {
            renderer.material.color = originalColor;
        }

        interactionText.enabled = false;
    }
}
