using System.Collections;
using UnityEngine;

public class ShotGun : MonoBehaviour
{
    [SerializeField]
    private Transform fireTr;
    [SerializeField]
    private float distance = 15.0f;
    [SerializeField]
    private float inaccuracyDitance = 5.0f;
    [SerializeField]
    private int bulletsPerShot = 6;
    [SerializeField]
    private GameObject laser;
    [SerializeField]
    private float waitTime = 1.5f;
    [SerializeField]
    private float fadeDuration = 0.3f;

    private float lastFireTime = 0.0f;

    public ParticleSystem muzzle;
    public GameObject impact;

    private void Update()
    {
        if (Input.GetButtonDown("Fire1") && Time.time >= lastFireTime + waitTime)
            Shoot();
    }

    private void Shoot()
    {
        muzzle.gameObject.transform.position = fireTr.position;
        muzzle.gameObject.transform.rotation = fireTr.rotation;
        muzzle.Play();

        for(int i = 0;i < bulletsPerShot; i++)
        {
            RaycastHit hit;
            Vector3 shootingDir = GetShootingDirection();
            if(Physics.Raycast(fireTr.position, shootingDir, out hit, distance))
            {
                Instantiate(impact, hit.point, hit.transform.rotation); 
                CreateLaser(hit.point);
            }
            else
            {
                CreateLaser(fireTr.position + shootingDir * distance);
            }
        }

        lastFireTime = Time.time;
    }

    Vector3 GetShootingDirection()
    {
        Vector3 targetPos = fireTr.position + fireTr.forward * distance;
        targetPos = new Vector3(
            targetPos.x + Random.Range(-inaccuracyDitance, inaccuracyDitance),
            targetPos.y + Random.Range(-inaccuracyDitance, inaccuracyDitance),
            targetPos.z + Random.Range(-inaccuracyDitance, inaccuracyDitance)
            );

        Vector3 direction = targetPos - fireTr.position;
        return direction.normalized;
    }

    void CreateLaser(Vector3 end)
    {
        LineRenderer lr = Instantiate(laser).GetComponent<LineRenderer>();
        lr.SetPositions(new Vector3[2] { fireTr.position, end });
        StartCoroutine(FadeLaser(lr));
    }

    IEnumerator FadeLaser(LineRenderer lr)
    {
        float alpha = 1;
        while(alpha > 0)
        {
            alpha -= Time.deltaTime / fadeDuration;
            lr.startColor = new Color(lr.startColor.r, lr.startColor.g, lr.startColor.b, alpha);
            lr.endColor = new Color(lr.endColor.r, lr.endColor.g, lr.endColor.b, alpha);
            yield return null;
        }

        Destroy(lr.gameObject);
    }
}
