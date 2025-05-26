using KINEMATION.FPSAnimationPack.Scripts.Player;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class AmmoBoxHandler : KeyPressHandler
{
    [SerializeField]
    private List<WeaponType> weaponTypes;
    private FPSPlayer player; 

    private void Awake()
    {
        textInteract = GameObject.Find("InteractionText").GetComponent<TextMeshProUGUI>();
        player = FindAnyObjectByType<FPSPlayer>();
    }

    private void Update()
    {
        if (isNearby && Input.GetKeyDown(KeyCode.F))
        {
            Interact();
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        var player = other.GetComponent<PlayerController>();

        if(player != null)
        {
            isNearby = true;
            textInteract.text = "F키를 눌러 탄약 보충";
            textInteract.enabled = true;
        }
    }

    private void OnTriggerExit(Collider other)
    {
        var player = other.GetComponent<PlayerController>();

        if (player != null)
        {
            isNearby = false;
            textInteract.enabled = false;
        }
    }

    public override void Interact()
    {
        if(!isUsed)
        {
            int index = Random.Range(0, weaponTypes.Count);
            int addAmmo = Random.Range(20, 30);

            if (GameManager.instance.MaxAmmo.ContainsKey(weaponTypes[index].ToString()))
            {
                GameManager.instance.MaxAmmo[weaponTypes[index].ToString()] += addAmmo;
                player.GetActiveWeapon().SetUpAmmo();
            }

            textInteract.text = $"{weaponTypes[index].ToString()}의 탄알이 {addAmmo}개 추가";
            isUsed = true;
        }
        else
        {
            textInteract.text = "이미 사용됨";
        }
    }
}
