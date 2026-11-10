// soft blur + soft glow for the whole screen
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2  u_texel;   // 1 / surface size
uniform float u_step;    // distance between blur samples, in surface pixels
uniform float u_soft;    // how much of the blurred image is mixed in (0 = sharp, 1 = fully blurred)
uniform float u_glow;    // how strongly bright areas bloom
uniform float u_thresh;  // how bright something has to be before it glows (0-1)

void main()
{
    vec3 sharp = texture2D(gm_BaseTexture, v_vTexcoord).rgb;

    vec3 blur = vec3(0.0);
    vec3 bright = vec3(0.0);
    float total = 0.0;
    for (int i = -3; i <= 3; i++)
    {
        for (int j = -3; j <= 3; j++)
        {
            float k = exp(-float(i * i + j * j) / 8.0);   // soft round falloff
            vec3 c = texture2D(gm_BaseTexture, v_vTexcoord + vec2(float(i), float(j)) * u_texel * u_step).rgb;
            blur   += c * k;
            bright += max(c - u_thresh, 0.0) * k;
            total  += k;
        }
    }
    blur   /= total;
    bright /= total;

    vec3 col = mix(sharp, blur, u_soft) + bright * u_glow;
    gl_FragColor = vec4(col, 1.0);
}