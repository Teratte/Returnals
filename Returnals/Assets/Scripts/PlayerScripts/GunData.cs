using UnityEngine;

[CreateAssetMenu(menuName = "Scriptable/GunData", fileName = "Gun Data")]
public class GunData : ScriptableObject
{
    public float damage = 25; // 공격력

    public int startAmmo = 100; // 처음에 주어질 전체 탄알
    public int magCapacity = 25;// 탄창 용량

    public float timebetTime = 0.12f; // 탄알 발사 간격
    public float reloadTime = 1.8f;   // 장전 시간
}
