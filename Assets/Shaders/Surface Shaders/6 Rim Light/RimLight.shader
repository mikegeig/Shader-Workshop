Shader "Surface/RimLight" {
	Properties {
		_MainTex ("Texture", 2D) = "white" {}
		_BumpMap ("Normal Map", 2D) = "white" {}
		_Color ("Rim Color", Color) = (1, 1, 1, 1)
		_Power ("Rim Power", Range(0.5, 8.0)) = 3
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Lambert

		sampler2D _MainTex;
		sampler2D _BumpMap;
		float4 _Color;
		float _Power;

		struct Input {
			float2 uv_MainTex;
			float2 uv_BumpMap;
			float3 viewDir;
		};

		void surf (Input IN, inout SurfaceOutput o) 
		{
			o.Albedo = tex2D (_MainTex, IN.uv_MainTex);
			o.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap));
			
			half rim = 1.0 - dot(normalize(IN.viewDir), o.Normal);
			o.Emission = _Color.rgb * pow(rim, _Power);
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
