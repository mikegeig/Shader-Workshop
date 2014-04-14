Shader "Surface/EdgeFade" {
	Properties {
		_MainTex ("Texture", 2D) = "white" {}
		_Power ("Accuracy", Range(0.0, 1.0)) = 1
	}
	SubShader {
		Tags { "RenderType"="Opaque" "Queue"="Transparent"}
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Lambert alpha

		sampler2D _MainTex;
		float4 _Color;
		float _Power;

		struct Input {
			float2 uv_MainTex;
			float3 viewDir;
		};

		void surf (Input IN, inout SurfaceOutput o) 
		{
			o.Albedo = tex2D (_MainTex, IN.uv_MainTex);
			
			half rim = dot(normalize(IN.viewDir), o.Normal);
			
			o.Alpha = rim < _Power ? rim : 1;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
