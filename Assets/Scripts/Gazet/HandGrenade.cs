using System.Collections;
using UnityEngine;
using UnityEngine.UIElements;

public class HandGrenade : GazetBase
{
    [Header("Audio")]
    [SerializeField]
    private AudioClip throwAudio;       // ���� ����

    [Header("Grenade")]
    [SerializeField]
    private GameObject grenadePrefab;   // ����ź ������
    [SerializeField]
    private RuntimeAnimatorController grenadeAnimator;  // ����ź ������ �ִϸ��̼� ��Ʈ�ѷ�

    private Transform grenadeSpawnPoint;// ����ź ���� ��ġ
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
        // ����ź ���� ���
        grenadeSpawnPoint = playerAnimator.RightGunBone;
        // ������ �ִϸ��̼� �۵�
        playerAnimator.Animator.SetTrigger("onAttack");
        SpawnGrenadeProjectile();
        // ������ ���� ���
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

    // ����ź ����
    private void SetGrenade()
    {
        lastUseTime = Time.time;
        playerAnimator.ResetArsenal();
        playerAnimator.Animator.runtimeAnimatorController = grenadeAnimator;
        GameObject grenadeModel = Instantiate(grenadePrefab, playerAnimator.RightGunBone.position, Quaternion.identity);
        grenadeModel.transform.parent = playerAnimator.RightGunBone.transform;
    }

    // ����ź ��ô
    public void SpawnGrenadeProjectile()
    {
        GameObject grenadeClone = Instantiate(grenadePrefab, grenadeSpawnPoint.position, Random.rotation);
        grenadeClone.GetComponent<WeaponGrenadeProjectile>().Setup(gazetSetting.damage, transform.parent.up*(-1));

        gazetSetting.currentAbleCount--;
    }

    // ����ź ���� ����
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
