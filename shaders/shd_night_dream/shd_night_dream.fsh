// night tint + soft dreamy glow + gentle wave, for one sprite
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;
uniform vec4  u_uvs;    // the sprite's left, top, right, bottom on its texture page
uniform vec3  u_tint;   // night colour (multiplied in)
uniform float u_wave;   // wave strength (fraction of the sprite's width)
uniform float u_blur;   // how far the soft glow spreads (fraction of the sprite's size)
uniform float u_glow;   // how strong the soft glow is

vec4 samp(vec2 uv)
{
    return texture2D(gm_BaseTexture, clamp(uv, u_uvs.xy, u_uvs.zw));
}

void main()
{
    vec2 size  = u_uvs.zw - u_uvs.xy;
    vec2 local = (v_vTexcoord - u_uvs.xy) / size;          // 0-1 across the sprite
    local.x += sin(local.y * 10.0 + u_time * 1.2) * u_wave; // slow sideways sway
    vec2 uv = u_uvs.xy + clamp(local, 0.0, 1.0) * size;

    vec4 base = samp(uv);

    // soft blurred copy for the glow
    vec2 o = vec2(u_blur) * size;
    vec4 soft = samp(uv + vec2( o.x, 0.0)) + samp(uv + vec2(-o.x, 0.0))
              + samp(uv + vec2(0.0,  o.y)) + samp(uv + vec2(0.0, -o.y))
              + samp(uv + o) + samp(uv - o)
              + samp(uv + vec2(o.x, -o.y)) + samp(uv + vec2(-o.x, o.y));
    soft /= 8.0;

    vec3 col = base.rgb + soft.rgb * soft.rgb * u_glow; // bright areas bloom more than dark ones
    col *= u_tint;
    gl_FragColor = vec4(col, base.a) * v_vColour;
}