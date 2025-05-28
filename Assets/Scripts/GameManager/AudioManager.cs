using System.Collections;
using UnityEngine;

public class AudioManager : MonoBehaviour
{
    public static AudioManager instance;

    private AudioSource audioSource;

    [SerializeField]
    private AudioClip explosionClip;// 폭발 사운드
    [SerializeField]
    private AudioClip truckClip;    // 출발 사운드
    [SerializeField]
    private AudioClip workBenchClip;// 제작대 클릭 사운드
    [SerializeField]
    private AudioClip tentClip;     // 텐트 클릭 사운드
    [SerializeField]
    private AudioClip endingClip;   // 엔딩 라디오 사운드

    private void Awake()
    {
        if(instance != null && instance != this)
        {
            Destroy(gameObject);
        }
        else
        {
            instance = this;
            audioSource = GetComponent<AudioSource>();
            DontDestroyOnLoad(gameObject);
        }
    }

    public void PlayExplosionSound()
    {
        audioSource.PlayOneShot(explosionClip);
    }

    public void PlayTruckSound()
    {
        StartCoroutine(TruckSound());
    }

    public void PlayTentSound()
    {
        audioSource.PlayOneShot(tentClip);
    }

    public void PlayWorkBenchSound()
    {
        audioSource.PlayOneShot(workBenchClip);
    }

    public void PlayEndingSound()
    {
        audioSource.clip = endingClip;
        audioSource.Play();
    }
    private IEnumerator TruckSound()
    {
        audioSource.clip = truckClip;
        audioSource.Play();

        yield return new WaitForSeconds(2.0f);

        audioSource.Stop();
    }
}
