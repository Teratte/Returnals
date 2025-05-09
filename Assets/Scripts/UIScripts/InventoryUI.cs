using KINEMATION.FPSAnimationPack.Scripts.Player;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class InventoryUI : MonoBehaviour
{
    [SerializeField]
    private GameObject InventoryObject; // 인벤토리 창
    [SerializeField]
    private GameObject slotsParent;
    [SerializeField]
    private TextMeshProUGUI timer;      // 타이머
    [SerializeField]
    private TextMeshProUGUI ammoText;   // 탄창 수
    [SerializeField]
    private TextMeshProUGUI gazetAbleCount; // 가젯 사용 가능 횟수
    [SerializeField]
    private Slider gazetCoolTimeSlider;     // 가젯 쿨타임 슬라이더
    private float gazetCoolTime;            // 가젯 쿨타임

    private Slot[] slots;
    private FPSPlayer player;

    public Slot[] Slots => slots;       // 획득 아이템 리스트

    private void Awake()
    {
        slots = slotsParent.GetComponentsInChildren<Slot>();
        player = FindAnyObjectByType<FPSPlayer>();
        InventoryObject.SetActive(false);
    }

    private void Start()
    {
        gazetCoolTime = 99;
    }

    private void Update()
    {
        // 인벤토리 창 열기
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
            timer.text = $"{(int)GameManager.instance.Timer}";
            ammoText.text = $"{player.GetActiveWeapon().CurrentAmmo} / {player.GetActiveWeapon().MaxAmmo}";
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
}