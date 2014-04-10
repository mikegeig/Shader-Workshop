Shader "VertFrag/SineWave" {
    Properties {
        _MainTex ("Base (RGB) RefStrength (A)", 2D) = "white" {}
    }
     
    SubShader 
    {
	    Pass
	    {
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"

			sampler2D _MainTex;
			float4 _MainTex_ST;

			struct v2f {
			    float4  pos : SV_POSITION;
			    float2  uv : TEXCOORD0;
			};

			v2f vert (appdata_base v)
			{
			    v2f o;
			    
			    float phase = _Time * 30.0;
        		float4 wpos = mul( _Object2World, v.vertex);
        		float offset = (wpos.x + (wpos.z * 0.2)) * 0.5;
       			wpos.y = sin(phase + offset) * 0.5;
               	v.vertex = mul(_World2Object, wpos);
			    
			    o.pos = mul (UNITY_MATRIX_MVP, v.vertex);
			    o.uv = TRANSFORM_TEX (v.texcoord, _MainTex);
			    return o;
			}

			half4 frag (v2f i) : COLOR
			{
			    return tex2D (_MainTex, i.uv);
			}
			ENDCG
       }
    }
    FallBack "Reflective/VertexLit"
}
