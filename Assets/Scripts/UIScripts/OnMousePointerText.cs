using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;

public class OnMousePointerText : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    private TextMeshProUGUI text;
    private Color currentColor;

    private void Awake()
    {
        text = GetComponent<TextMeshProUGUI>();
        currentColor = text.color;
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        text.color = new Color(1, 0.3f, 0,1);
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        text.color = currentColor;
    }
}
