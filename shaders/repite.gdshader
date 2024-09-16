shader_type canvas_item;

uniform vec2 tile_size = vec2(16.0, 16.0);  // حجم البلاطة بالبيكسل

void fragment() {
    // احسب إحداثيات UV بالنسبة لحجم البلاطة الثابت
    vec2 uv = FRAGCOORD.xy / tile_size;
    uv = fract(uv);  // حافظ على القيم بين 0.0 و 1.0
    COLOR = texture(TEXTURE, uv);
}
