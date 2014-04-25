Shader "Fixed/ColorWithPicker" {
	Properties {
		_Color("Color", Color) = (1, 0, 0)
	}
	SubShader {
		Color[_Color] //notice square brackets with variables
		
		//Color can be above the pass to make it global
		Pass{}
	} 
	FallBack "Diffuse"
}
