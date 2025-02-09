using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    private MovementCharacter character;

    private void Awake()
    {
        character = GetComponent<MovementCharacter>();
    }

    private void Update()
    {
        character.UpdateMovement();
        character.UpdateAttack();
    }
}
