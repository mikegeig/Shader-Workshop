Shader "Surface/ExpandContract" {
	Properties{
		_Amount ("Amount", Range(-.005, .005)) = 0
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Lambert vertex:vert

		float _Amount;

		struct Input {
			float4 color : COLOR;
		};
		
		void vert(inout appdata_full v)
		{
			v.vertex.xyz += v.normal * _Amount;
		}

		void surf (Input IN, inout SurfaceOutput o) {
			o.Albedo = 1;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
