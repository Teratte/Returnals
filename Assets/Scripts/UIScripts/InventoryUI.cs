using KINEMATION.FPSAnimationPack.Scripts.Player;
using System.Collections;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class InventoryUI : MonoBehaviour
{
    [SerializeField]
    private GameObject InventoryObject; // �κ��丮 â
    [SerializeField]
    private GameObject slotsParent;
    [SerializeField]
    private TextMeshProUGUI timer;      // Ÿ�̸�
    [SerializeField]
    private TextMeshProUGUI ammoText;   // źâ ��
    [SerializeField]
    private TextMeshProUGUI gazetAbleCount; // ���� ��� ���� Ƚ��
    [SerializeField]
    private Slider gazetCoolTimeSlider;     // ���� ��Ÿ�� �����̴�
    private float gazetCoolTime;            // ���� ��Ÿ��

    private Slot[] slots;
    private FPSPlayer player;
    [SerializeField]
    private Status status;  // �÷��̾��� �������ͽ�

    [Header("HP & BloodScreen UI")]
    [SerializeField]
    private Image imageBloodScreen;             // �÷��̾ ���ݹ޾��� �� ȭ�鿡 ǥ�õǴ� Image
    [SerializeField]
    private AnimationCurve curveBloodScreen;

    [Header("Die Panel")]
    [SerializeField]
    private GameObject PanelClosing;    // ��� �г�
    [SerializeField]
    private TextMeshProUGUI closingText;    // ��� �ؽ�Ʈ
    [SerializeField]
    private GameObject closingParent;       // ���ݱ��� ȹ���� �������� ������ ������ �θ� ��ü

    public Slot[] Slots => slots;       // ȹ�� ������ ����Ʈ

    private void Awake()
    {
        slots = slotsParent.GetComponentsInChildren<Slot>();
        player = FindAnyObjectByType<FPSPlayer>();
        InventoryObject.SetActive(false);
        status.onHPEvent.AddListener(UpdateHPHUD);
    }

    private void Start()
    {
        gazetCoolTime = 99;
    }

    private void Update()
    {
        // �κ��丮 â ����
        if (Input.GetKey(KeyCode.Tab))
        {
            InventoryObject.SetActive(true);
            GameManager.instance.ActiveUI();
        }
        else if(Input.GetKeyUp(KeyCode.Tab))
        {
            InventoryObject.SetActive(false);
            GameManager.instance.DeactiveUI();
        }

        if (GameManager.instance.isGameStart)
        {
            timer.text = $"{(int)GameManager.instance.Timer / 60} : {(int)GameManager.instance.Timer % 60}";
            ammoText.text = $"{player.GetActiveWeapon().CurrentAmmo} | {player.GetActiveWeapon().MaxAmmo}";
            gazetAbleCount.text = $"{player.Gazet.CurrentAbleCount}";
            gazetCoolTime += Time.deltaTime;
            gazetCoolTimeSlider.value = gazetCoolTime / player.Gazet.Rate;
            if (Input.GetKeyDown(KeyCode.Q) && gazetCoolTimeSlider.value >= 1 && player.Gazet.canUse)
            {
                gazetCoolTime = 0.0f;
            }
        }
    }

    public void AcquireItem(Item _item, int _count = 1)
    {
        if (Item.ItemType.Equipment != _item.itemType)
        {
            for (int i = 0; i < slots.Length; i++)
            {
                if (slots[i].item != null)
                {
                    if (slots[i].item.itemName == _item.itemName)
                    {
                        slots[i].SetSlotCount(_count);
                        return;
                    }
                }
            }
        }

        for (int i = 0; i < slots.Length; i++)
        {
            if (slots[i].item == null)
            {
                slots[i].AddItem(_item, _count);
                return;
            }
        }
    }

    private void UpdateHPHUD(float previous, float current)
    {   
        if(previous - current > 0)
        {
            StopCoroutine("OnBloodScreen");
            StartCoroutine("OnBloodScreen");
        }
    }

    private IEnumerator OnBloodScreen()
    {
        float percent = 0.0f;

        while(percent < 1)
        {
            percent += Time.deltaTime;

            Color color = imageBloodScreen.color;
            color.a = Mathf.Lerp(1,0,curveBloodScreen.Evaluate(percent));
            imageBloodScreen.color = color;

            yield return null;
        }
    }

    private int ItemCount()
    {
        int result = 0;
        foreach(Slot slot in slots)
        {
            if(slot.item != null)
            {
                result += slot.itemCount;
            }
        }
        return result;
    }

    private void AddResultItem()
    {
        foreach(Slot slot in slots)
        {
            if(slot.item != null)
            {
                Instantiate(slot, closingParent.transform);
            }
        }
    }

    private void Closing()
    {
        float playingTime = 900 - GameManager.instance.Timer;
        closingText.text = $"�÷��� �ð� : {(int)playingTime / 60}:{(int)playingTime % 60}\n" +
            $"������ �������� : {GameManager.instance.Stage}\n" +
            $"óġ�� �� : {GameManager.instance.KillCount} \n" +
            $"ȹ���� ������ : {ItemCount()} \n" +
            $"����� ���̺� : {GameManager.instance.WaveCount}";

        AddResultItem();
    }

    public void ActiveClosingPanel()
    { 
        GameManager.instance.ActiveUI();
        Closing();
        PanelClosing.SetActive(true);
    }

    private void OnEnable()
    {
        MovementCharacter.OnDie += ActiveClosingPanel;
    }

    private void OnDisable()
    {
        MovementCharacter.OnDie -= ActiveClosingPanel;
    }
}