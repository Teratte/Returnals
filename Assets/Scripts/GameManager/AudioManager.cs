using System.Collections;
using UnityEngine;

public class AudioManager : MonoBehaviour
{
    public static AudioManager instance;

    private AudioSource audioSource;

    [SerializeField]
    private AudioClip explosionClip;
    [SerializeField]
    private AudioClip truckClip;
    [SerializeField]
    private AudioClip workBenchClip;
    [SerializeField]
    private AudioClip tentClip;

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

    private IEnumerator TruckSound()
    {
        audioSource.clip = truckClip;
        audioSource.Play();

        yield return new WaitForSeconds(2.0f);

        audioSource.Stop();
    }
}
