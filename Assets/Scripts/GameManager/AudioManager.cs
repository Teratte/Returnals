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

    private IEnumerator TruckSound()
    {
        audioSource.clip = truckClip;
        audioSource.Play();

        yield return new WaitForSeconds(5.0f);

        audioSource.Stop();
    }
}
