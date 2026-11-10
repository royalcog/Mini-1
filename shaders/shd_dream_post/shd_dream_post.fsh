// soft blur + soft glow for the whole screen
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2  u_texel;      // 1 / surface size
uniform float u_step;       // blur sample spacing, in surface pixels
uniform float u_glow_step;  // glow sample spacing, in surface pixels (wider than the blur)
uniform float u_soft;       // how much of the blurred image is mixed in (0 = sharp, 1 = fully blurred)
uniform float u_glow;       // how strongly bright areas bloom
uniform float u_thresh;     // how bright (overall) something has to be before it glows (0-1)

void main()
{
    vec3 sharp = texture2D(gm_BaseTexture, v_vTexcoord).rgb;

    vec3 blur = vec3(0.0);
    vec3 glow = vec3(0.0);
    float total = 0.0;
    for (int i = -3; i <= 3; i++)
    {
        for (int j = -3; j <= 3; j++)
        {
            float k = exp(-float(i * i + j * j) / 8.0);   // soft round falloff
            vec2  o = vec2(float(i), float(j)) * u_texel;

            blur += texture2D(gm_BaseTexture, v_vTexcoord + o * u_step).rgb * k;

            vec3  g   = texture2D(gm_BaseTexture, v_vTexcoord + o * u_glow_step).rgb;
            float lum = dot(g, vec3(0.299, 0.587, 0.114));          // overall brightness
            glow += g * max(lum - u_thresh, 0.0) / max(1.0 - u_thresh, 0.001) * k;

            total += k;
        }
    }
    blur /= total;
    glow /= total;

    vec3 col = mix(sharp, blur, u_soft) + glow * u_glow;
    gl_FragColor = vec4(col, 1.0);
}