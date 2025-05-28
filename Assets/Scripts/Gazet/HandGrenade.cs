using KINEMATION.FPSAnimationPack.Scripts.Player;
using System.Collections;
using UnityEngine;

public class HandGrenade : GazetBase
{
    [Header("Audio")]
    [SerializeField]
    private AudioClip throwAudio;       // °ø°Ý »ç¿îµå

    [Header("Grenade")]
    [SerializeField]
    private GameObject grenadePrefab;   // ¼ö·ùÅº ÇÁ¸®ÆÕ

    private Transform grenadeSpawnPoint;// ¼ö·ùÅº »ý¼º À§Ä¡
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
                // Ã³À½ ½ÇÇà
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
        // ¼ö·ùÅº »ý¼º Àå¼Ò
        grenadeSpawnPoint = player.GrenadeTransform;
        SpawnGrenadeProjectile();
    }

    // ¼ö·ùÅº ÀåÂø
    private void SetGrenade()
    {
        lastUseTime = Time.time;
        player.OnThrowGrenade();
        StartCoroutine(OnThrow());
    }

    // ¼ö·ùÅº ÅõÃ´
    public void SpawnGrenadeProjectile()
    {
        GameObject grenadeClone = Instantiate(grenadePrefab, grenadeSpawnPoint.position, Random.rotation);
        grenadeClone.GetComponent<WeaponGrenadeProjectile>().Setup(gazetSetting.damage, player.gameObject.transform.forward);

        gazetSetting.currentAbleCount--;

        ResetGrenade();
    }

    // ¼ö·ùÅº ÀåÂø ÇØÁ¦
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
