Shader "Fixed/BasicLighting" {
	Properties {
		
	}
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
