Shader "VertFrag/BasicVertFrag" 
{
	SubShader 
	{
    	Pass 
    	{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			//Unity library which makes things easier
			#include "UnityCG.cginc" 

			//This struct can have any name
			struct v2f {
							//Semantics. The SV is for DirectX
			    float4 pos : SV_POSITION;
			    float3 color : COLOR0;
			};

			v2f vert (appdata_base v)
			{
			    v2f o;
			    o.pos = mul (UNITY_MATRIX_MVP, v.vertex);
			    o.color = v.normal * 0.5 + 0.5;
			    return o;
			}

			half4 frag (v2f i) : COLOR
			{
			    return half4 (i.color, 1);
			}
			ENDCG
    	}
    }
	Fallback "VertexLit"
} 

