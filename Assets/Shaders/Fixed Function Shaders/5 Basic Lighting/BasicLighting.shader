Shader "Fixed/BasicLighting" {

	SubShader {
		Pass
		{
			Material{
				Diffuse(0, 1, 0)
			}
			Lighting On
		}
	} 
	FallBack "Diffuse"
}
