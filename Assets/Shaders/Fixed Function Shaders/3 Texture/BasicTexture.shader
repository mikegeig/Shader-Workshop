Shader "Fixed/BasicTexture" {
	Properties {
		//_MainTex ("Texture", 2D) = "white" {}
		_MainTex ("Texture", 2D) = "white" {}
	}
	SubShader 
	{
		Pass
		{
			SetTexture[_MainTex]
			//SetTexture[_MainTex] {combine texture] //same thing as above
			
		}
	}  
	FallBack "Diffuse"
}
