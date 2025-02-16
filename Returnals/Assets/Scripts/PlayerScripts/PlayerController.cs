using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    private MovementCharacter character;
    private Status status;

    bool isNotAttack = true;
    float notAttackTime = 0.0f;
    [SerializeField]
    private float recoverAbleTime = 3.0f;
    bool isRecover = false;

    private void Awake()
    {
        character = GetComponent<MovementCharacter>();
        status = GetComponent<Status>();
    }

    private void Update()
    {
        character.UpdateMovement();
        character.UpdateAttack();

        if(isNotAttack && status.PlayerHP < status.MaxHP)
        {
            notAttackTime += Time.deltaTime;
        }

        if (notAttackTime >= recoverAbleTime)
        {
            notAttackTime = 0.0f;
            isRecover = true;
        }

        if(isRecover &&  status.PlayerHP < status.MaxHP)
        {
            status.PlayerHP += Time.deltaTime * 5.0f;
            if(status.PlayerHP >= status.MaxHP)
            {
                isRecover = false;
            }
        }

        status.PlayerHP = Mathf.Clamp(status.PlayerHP,0,status.MaxHP);
    }
}
