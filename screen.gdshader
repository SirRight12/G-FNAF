shader_type spatial;
render_mode unshaded;

uniform sampler2D view_texture;

void fragment() {
	ALBEDO = texture(view_texture,vec2(UV.x,1.0-UV.y)).rgb;
}