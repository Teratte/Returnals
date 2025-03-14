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

        Instantiate(muzzle, fireTr.position, fireTr.localRotation);

        if (Physics.Raycast(fireTr.position, fireTr.forward, out hit, distance))
        {
            Instantiate(impact, hit.point, Quaternion.LookRotation(hit.normal));
        }

        if (Physics.Raycast(fireTr.position, fireTr.forward + new Vector3(-.2f, 0.0f, 0.0f), out hit_1, distance))
        {
            Instantiate(impact, hit_1.point, Quaternion.LookRotation(hit_1.normal));
        }

        if (Physics.Raycast(fireTr.position, fireTr.forward + new Vector3(0.0f, .1f, 0.0f), out hit_2, distance))
        {
            Instantiate(impact, hit_2.point, Quaternion.LookRotation(hit_2.normal));
        }

        if (Physics.Raycast(fireTr.position, fireTr.forward + new Vector3(0.0f, -.1f, 0.0f), out hit_3, distance))
        {
            Instantiate(impact, hit_3.point, Quaternion.LookRotation(hit_3.normal));
        }
    }
}
