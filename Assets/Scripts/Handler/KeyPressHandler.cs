using TMPro;
using UnityEngine;

public abstract class KeyPressHandler : MonoBehaviour
{
    [SerializeField]
    protected TextMeshProUGUI textInteract;

    protected bool isNearby = false;
    protected bool isUsed = false;
    public abstract void Interact();
}