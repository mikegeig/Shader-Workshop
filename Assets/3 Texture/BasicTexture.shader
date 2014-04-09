Shader "Custom/BasicTexture" {
	Properties {
		_MainTex ("Texture", 2D) = "white" {}
		//_MainTex ("Texture", 2D) = "white" {TexGen EyeLinear}
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
