#version 330 core

in vec3 v_MainColor;
in vec3 v_BackgroundColor;
in vec2 v_StyleST;
in vec2 v_IconST;

uniform sampler2D u_UI;


void main() {

    vec4 icon       = texture2D(u_UI, v_IconST) * vec4(v_MainColor, 1.0f);
    vec4 background = texture2D(u_UI, v_StyleST) * vec4(v_BackgroundColor, 1.0f);

    gl_FragColor = (icon.a <= 0.2f) ? background : icon;

    if (gl_FragColor.a <= 0.2f)
        discard;

} // main()
