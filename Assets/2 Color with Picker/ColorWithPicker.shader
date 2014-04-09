Shader "Custom/ColorWithPicker" {
	Properties {
		_Color("Color", Color) = (1, 0, 0)
	}
	SubShader {
		Color[_Color]
		Pass{}
	} 
	FallBack "Diffuse"
}
