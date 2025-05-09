using System.Collections;
using UnityEngine;
using UnityEngine.UIElements;

public class HandGrenade : GazetBase
{
    [Header("Audio")]
    [SerializeField]
    private AudioClip throwAudio;       // 공격 사운드

    [Header("Grenade")]
    [SerializeField]
    private GameObject grenadePrefab;   // 수류탄 프리팹
    [SerializeField]
    private RuntimeAnimatorController grenadeAnimator;  // 수류탄 던지는 애니메이션 컨트롤러

    private Transform grenadeSpawnPoint;// 수류탄 생성 위치
    private PlayerAnimator playerAnimator;
    private AudioSource audioSource;

    private void Awake()
    {
        base.SetUp();
        audioSource = GetComponent<AudioSource>();
        playerAnimator = FindAnyObjectByType<PlayerAnimator>();
    }

    public void Update()
    {
        if(playerAnimator != null)
        {
            if(playerAnimator.Animator.runtimeAnimatorController == grenadeAnimator)
            {
                if(Input.GetMouseButtonDown(0))
                {
                    StartCoroutine(OnThrow());
                }
            }
        }
    }

    public override void StartGazetAction()
    {
        if(playerAnimator != null)
        {
            if(isFirstTimeUse)
            {
                // 처음 실행
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
        // 수류탄 생성 장소
        grenadeSpawnPoint = playerAnimator.RightGunBone;
        // 던지는 애니메이션 작동
        playerAnimator.Animator.SetTrigger("onAttack");
        SpawnGrenadeProjectile();
        // 던지는 사운드 재생
        audioSource.PlayOneShot(throwAudio);

        yield return new WaitForEndOfFrame();

        while(true)
        {
            int movementHash = Animator.StringToHash("Movement");
            AnimatorStateInfo stateInfo = playerAnimator.Animator.GetCurrentAnimatorStateInfo(0);
            if(stateInfo.shortNameHash == movementHash)
            {
                playerAnimator.SetArsenal(1);
                ResetGrenade();
                yield break;
            }

            yield return null;
        }
    }

    // 수류탄 장착
    private void SetGrenade()
    {
        lastUseTime = Time.time;
        playerAnimator.ResetArsenal();
        playerAnimator.Animator.runtimeAnimatorController = grenadeAnimator;
        GameObject grenadeModel = Instantiate(grenadePrefab, playerAnimator.RightGunBone.position, Quaternion.identity);
        grenadeModel.transform.parent = playerAnimator.RightGunBone.transform;
    }

    // 수류탄 투척
    public void SpawnGrenadeProjectile()
    {
        GameObject grenadeClone = Instantiate(grenadePrefab, grenadeSpawnPoint.position, Random.rotation);
        grenadeClone.GetComponent<WeaponGrenadeProjectile>().Setup(gazetSetting.damage, transform.parent.up*(-1));

        gazetSetting.currentAbleCount--;
    }

    // 수류탄 장착 해제
    private void ResetGrenade()
    {
        foreach(Transform child in playerAnimator.RightGunBone)
        {
            if(child.gameObject.GetComponent<WeaponGrenadeProjectile>() != null)
            {
                Destroy(child.gameObject);
            }
        }
    }
}
