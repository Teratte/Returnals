using System.Collections;
using UnityEngine;

public class Gun : MonoBehaviour
{
    public enum State
    {
        Ready,
        Empty,
        Reloading
    }

    public State state { get; private set; }

    [SerializeField]
    private Transform fireTransform;    // 발사 시작점

    private LineRenderer bulletlineRenderer;  // 발사 궤적 라인

    [SerializeField]
    private GunData gunData;             // 총의 데이터

    private float fireDistance = 50.0f; // 발사 사정 거리

    [SerializeField]
    private int ammoRemain = 100;   // 남은 전체 탄알 
    [SerializeField]
    private int magAmmo;            // 현재 탄창에 남아있는 탄알

    private float lastFireTime;     // 총을 마지막으로 발사한 시점

    private void Awake()
    {
        // 사용할 컴포넌트 가져오기
        bulletlineRenderer = GetComponent<LineRenderer>();

        // 사용할 점을 두 개로 변경
        bulletlineRenderer.positionCount = 2;
        // 라인 렌더러를 비활성화
        bulletlineRenderer.enabled = false;
    }

    private void OnEnable()
    {
        // 전체 예비 탄알 양 초기화
        ammoRemain = gunData.startAmmo;
        // 현재 탄창을 가득 채우기
        magAmmo = gunData.magCapacity;

        // 총의 현재 상태를 총을 쏠 준비가 된 상태로 변경
        state = State.Ready;
        // 마지막으로 총을 쏜 시점 초기화
        lastFireTime = 0.0f;
    }

    public void Fire()
    {
        // 현재 상태가 준비 상태
        // 현재 시간이 발사된 시간에서 발사 간격 시간만큼 지났을 때
        if(state == State.Ready && Time.time >= lastFireTime + gunData.timebetTime)
        {
            // 시간 초기화
            lastFireTime = Time.time;
            // 발사 효과 재생
            Shot();
        }
    }   
    
    public void Shot()
    {
        // 레이캐스트에 의한 충돌 정보를 저장하는 컨테이너
        RaycastHit hit;
        // 탄알이 맞은 곳을 저장할 변수
        Vector3 hitPosition = Vector3.zero;

        if(Physics.Raycast(fireTransform.position, fireTransform.forward, out hit, fireDistance) )
        {
            // 레이가 어떤 물체와 충돌한 경우

            // 충돌한 상대방으로부터
            
            // 레이가 충돌한 위치 저장
            hitPosition = hit.point;
        }
        else
        {
            // 레이가 다른 물체와 충돌하지 않았다면
            // 탄알이 최대 사정거리까지 날아갔을 때의 위치를 충돌 위치로 사용
            hitPosition = fireTransform.position + fireTransform.forward * fireDistance;
        }

        // 발사 이펙트 재생 시작
        StartCoroutine(ShotEffect(hitPosition));

        // 남은 탄알 수를 -1
        magAmmo--;
        // 남은 탄알 수가 0이하면
        if(magAmmo <= 0)
        {
            // 현재 상태를 탄알 빔으로 변경
            state = State.Empty;
        }
    }

    private IEnumerator ShotEffect(Vector3 hitPosition)
    {
        // 선의 시작점은 총구의 위치
        bulletlineRenderer.SetPosition(0, fireTransform.position);
        // 선의 끝점은 맞은 위치
        bulletlineRenderer.SetPosition(1, hitPosition);

        // 라인렌더러를 활성화하여 탄알 궤적을 그림
        bulletlineRenderer.enabled = true;

        // 0.03초 동안 잠시 처리 대기
        yield return new WaitForSeconds(0.03f);

        // 라인렌더러를 비활성화하여 탄알 궤적을 지움.
        bulletlineRenderer.enabled = false;
    }

    public bool Reload()
    {
        if(state == State.Reloading || ammoRemain <= 0 || magAmmo >= gunData.magCapacity)
        {
            return false;
        }

        StartCoroutine(ReloadingRoutine());
        return true;
    }

    private IEnumerator ReloadingRoutine()
    {
        // 현재 상태를 재장전 상태로 전환
        state = State.Reloading;
        
         yield return new WaitForSeconds(gunData.reloadTime);

        int ammoToFill = gunData.magCapacity - magAmmo;

        if(ammoRemain < ammoToFill)
        {
            ammoToFill = ammoRemain;
        }

        magAmmo += ammoToFill;
        ammoRemain -= ammoToFill;

        state = State.Ready;
      
    }
}
