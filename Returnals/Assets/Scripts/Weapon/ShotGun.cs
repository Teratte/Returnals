using UnityEngine;

public class ShotGun : MonoBehaviour
{
    [SerializeField]
    private Transform fireTr;
    [SerializeField]
    private float distance = 15.0f;

    public ParticleSystem muzzle;
    public ParticleSystem impact;

    private void Update()
    {
        if (Input.GetButtonDown("Fire1"))
            Shoot();
    }

    private void Shoot()
    {
        RaycastHit hit;
        RaycastHit hit_1;
        RaycastHit hit_2;
        RaycastHit hit_3;

        muzzle.gameObject.transform.position = fireTr.position;
        muzzle.gameObject.transform.rotation = fireTr.rotation;
        muzzle.Play();

        if (Physics.Raycast(fireTr.position, fireTr.forward, out hit, distance))
        {
            impact.gameObject.transform.position = hit.point;
            impact.gameObject.transform.rotation = hit.transform.localRotation;
            impact.Play();
        }

        if (Physics.Raycast(fireTr.position, fireTr.forward + new Vector3(-.2f, 0.0f, 0.0f), out hit_1, distance))
        {
            impact.gameObject.transform.position = hit_1.point;
            impact.gameObject.transform.rotation = hit_1.transform.localRotation;
            impact.Play();
        }

        if (Physics.Raycast(fireTr.position, fireTr.forward + new Vector3(0.0f, .1f, 0.0f), out hit_2, distance))
        {
            impact.gameObject.transform.position = hit_2.point;
            impact.gameObject.transform.rotation = hit_2.transform.localRotation;
            impact.Play();
        }

        if (Physics.Raycast(fireTr.position, fireTr.forward + new Vector3(0.0f, -.1f, 0.0f), out hit_3, distance))
        {
            impact.gameObject.transform.position = hit_3.point;
            impact.gameObject.transform.rotation = hit_3.transform.localRotation;
            impact.Play();
        }
    }
}
