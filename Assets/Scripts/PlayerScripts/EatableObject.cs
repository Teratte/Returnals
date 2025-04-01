using UnityEngine;

public class EatableObject : MonoBehaviour
{
    [SerializeField]
    private int itemIndex;

    public Item item;
    public int ItemIndex => itemIndex;
}
