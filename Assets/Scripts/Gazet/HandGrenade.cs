using KINEMATION.FPSAnimationPack.Scripts.Player;
using System.Collections;
using UnityEngine;

public class HandGrenade : GazetBase
{
    [Header("Audio")]
    [SerializeField]
    private AudioClip throwAudio;       // ���� ����

    [Header("Grenade")]
    [SerializeField]
    private GameObject grenadePrefab;   // ����ź ������

    private Transform grenadeSpawnPoint;// ����ź ���� ��ġ
    private FPSPlayer player;
    private AudioSource audioSource;

    private void Awake()
    {
        base.SetUp();
        audioSource = GetComponent<AudioSource>();
        player = FindAnyObjectByType<FPSPlayer>();
    }

    public override void StartGazetAction()
    {
        if(player != null)
        {
            if(isFirstTimeUse)
            {
                // ó�� ����
                isFirstTimeUse = false;
                SetGrenade();
            }
            else if(Time.time >= lastUseTime + Rate && gazetSetting.currentAbleCount > 0)
            {
                SetGrenade();
            }
        }
    }

    private IEnumerator OnThrow()
    {
        yield return new WaitForSeconds(0.7f);
        GameObject grenadeModel = Instantiate(grenadePrefab, player.GrenadeTransform.position, Quaternion.identity);
        grenadeModel.transform.parent = player.GrenadeTransform;
        yield return new WaitForSeconds(1.3f);
        // ����ź ���� ���
        grenadeSpawnPoint = player.GrenadeTransform;
        SpawnGrenadeProjectile();
    }

    // ����ź ����
    private void SetGrenade()
    {
        lastUseTime = Time.time;
        player.OnThrowGrenade();
        StartCoroutine(OnThrow());
    }

    // ����ź ��ô
    public void SpawnGrenadeProjectile()
    {
        GameObject grenadeClone = Instantiate(grenadePrefab, grenadeSpawnPoint.position, Random.rotation);
        grenadeClone.GetComponent<WeaponGrenadeProjectile>().Setup(gazetSetting.damage, player.gameObject.transform.forward);

        gazetSetting.currentAbleCount--;

        ResetGrenade();
    }

    // ����ź ���� ����
    private void ResetGrenade()
    {
        foreach(Transform child in player.GrenadeTransform)
        {
            if(child.gameObject.GetComponent<WeaponGrenadeProjectile>() != null)
            {
                Destroy(child.gameObject);
            }
        }
    }
}
