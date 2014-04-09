Shader "Custom/Texture Combine" {
	Properties {
		_MainTex ("Texture", 2D) = "white" {}
		_Tex2 ("Second Texture", 2D) = "white" {}
	}
	SubShader 
	{
		Pass
		{
			SetTexture[_MainTex]
			SetTexture[_Tex2] {combine texture * previous}
			
			//Can use:
			//-previous
			//-texture
			//-primary
			//-constant
			
			//As well as:
			//-Double
			//-Quad
			//-one -    (that is "one minus")
		}
	}
	FallBack "Diffuse"
}
