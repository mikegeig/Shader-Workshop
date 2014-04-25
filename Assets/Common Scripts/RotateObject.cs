using UnityEngine;
using System.Collections;

public class RotateObject : MonoBehaviour {

	public float speed = 50;


	void Update () 
	{
		transform.Rotate(0, speed * Time.deltaTime, 0);
	}
}
