[System.Serializable]
public struct GazetSetting
{
    public string name;     // 가젯 이름
    public int maxAbleCount; // 최대 사용 가능 횟수
    public int currentAbleCount;   // 현재 사용 가능 횟수
    public float rate;  // 재사용 대기 시간
    public float damage;    // 데미지
}
