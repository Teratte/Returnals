using UnityEngine;

[CreateAssetMenu(menuName = "Scriptable/GunData", fileName = "Gun Data")]
public class GunData : ScriptableObject
{
    public float damage = 25; // ���ݷ�

    public int startAmmo = 100; // ó���� �־��� ��ü ź��
    public int magCapacity = 25;// źâ �뷮

    public float timebetTime = 0.12f; // ź�� �߻� ����
    public float reloadTime = 1.8f;   // ���� �ð�
}
