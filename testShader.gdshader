shader_type canvas_item;


void fragment(){
	vec4 input_color = texture(TEXTURE, UV);
	vec4 color = input_color/3.0;
	color = vec4(color.r, color.g, color.b, input_color.a);
	
	COLOR = color;
}

