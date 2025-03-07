using UnityEngine;

public class GunPickUp : MonoBehaviour
{
    [SerializeField]
    private GameObject gunPrefab;
    [SerializeField]
    private Transform gunHoldPoint;

    private GameObject currentGun;

    private void OnTriggerEnter(Collider other)
    {
        if(other.CompareTag("Player"))
        {
            PickUpGun();
        }
    }

    private void PickUpGun()
    {
        if(currentGun == null)
        {
            currentGun = Instantiate(gunPrefab, gunHoldPoint);
            Destroy(gameObject);
        }
    }
}
