// night tint + soft dreamy glow + gentle wave. the wave + glow are in ROOM pixels,
// so everything drawn with it (house, characters) sways together
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vWorld;

uniform float u_time;
uniform vec4  u_uvs;    // the sprite's left, top, right, bottom on its texture page
uniform vec2  u_pxuv;   // texture distance per room pixel (x is negative for flipped sprites)
uniform vec3  u_tint;   // night colour (multiplied in)
uniform float u_wave;   // sway, in room pixels
uniform float u_freq;   // how tight the waves are
uniform float u_speed;  // how fast they move
uniform float u_blur;   // glow spread, in room pixels
uniform float u_glow;   // glow strength

vec4 samp(vec2 uv)
{
    return texture2D(gm_BaseTexture, clamp(uv, u_uvs.xy, u_uvs.zw));
}

void main()
{
    float _shift = sin(v_vWorld.y * u_freq + u_time * u_speed) * u_wave;
    vec2 uv = v_vTexcoord - vec2(_shift * u_pxuv.x, 0.0);

    vec4 base = samp(uv);

    vec2 o = vec2(u_blur) * abs(u_pxuv);
    vec4 soft = samp(uv + vec2( o.x, 0.0)) + samp(uv + vec2(-o.x, 0.0))
              + samp(uv + vec2(0.0,  o.y)) + samp(uv + vec2(0.0, -o.y))
              + samp(uv + o) + samp(uv - o)
              + samp(uv + vec2(o.x, -o.y)) + samp(uv + vec2(-o.x, o.y));
    soft /= 8.0;

    vec3 col = base.rgb + soft.rgb * soft.rgb * u_glow;
    col *= u_tint;
    gl_FragColor = vec4(col, base.a) * v_vColour;
}