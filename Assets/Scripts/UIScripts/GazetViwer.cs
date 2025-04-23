using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class GazetViwer : MonoBehaviour
{
    [SerializeField]
    private Image gazetImage;       // ���� ������
    private GazetBase gazetBase;    // ������ ����
    private PlayerAnimator playerAnimator;

    private void Awake()
    {
        gazetBase = GameManager.instance.holdingGazet.GetComponent<GazetBase>();
        if (gazetBase != null)
        {
            gazetImage.sprite = gazetBase.GazetIcon;
        }
    }

}
