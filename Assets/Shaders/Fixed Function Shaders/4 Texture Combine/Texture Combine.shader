Shader "Fixed/Texture Combine" {
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
			
			//Math: +, -, *, Lerp()

			//Can use:
			//-previous - previous texture
			//-texture - current texture
			//-primary - primary color of vertex
			//-constant - a specifiable color
			
			//As well as:
			//-Double
			//-Quad
			//-one -    (that is "one minus")
		}
	}
	FallBack "Diffuse"
}
