Shader "Surface/SineWave" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Lambert vertex:vert
		#pragma target 3.0

		sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
		};
		
		void vert(inout appdata_full v){
			float phase = _Time * 30.0;
			float4 wpos = mul( _Object2World, v.vertex);
			float offset = (wpos.x + (wpos.z * 0.2)) * 0.5;
			wpos.y = sin(phase + offset) * 0.5;
       		v.vertex = mul(_World2Object, wpos);
		}

		void surf (Input IN, inout SurfaceOutput o) {
			half4 c = tex2D (_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
