#version 330 core
layout (points) in;
layout (triangle_strip, max_vertices = 28) out;

out vec3 v_MainColor;
out vec3 v_BackgroundColor;
out vec2 v_StyleST;
out vec2 v_IconST;

in DATA {
    
    vec3  d_MainColor;
    vec3  d_BackgroundColor;
    uvec2 d_Dim;
    int   d_StyleData;
    mat4  d_Camera;
    
} data_in[];

const vec2  ATLAS_DIM               = uvec2(416, 64);
const uint  ICON_X_WIDTH            = uint(64);
const float ICON_NORMALIZED_X_WIDTH = ICON_X_WIDTH / ATLAS_DIM.x;
const float ICON_LAYER_OFFSET       = 1.0f / 256.0f;
const vec2  ROUNDED_BORDER_ORIGIN   = vec2(384.0f / ATLAS_DIM.x, 0.0f);
const vec2  SQUARE_BORDER_ORIGIN    = vec2(384.0f / ATLAS_DIM.x, 0.5f);
const uint  BORDER_PIXEL_SIZE       = uint(28);
const vec2  BORDER_NORMALIZED_SIZE  = vec2(BORDER_PIXEL_SIZE / ATLAS_DIM.x, BORDER_PIXEL_SIZE / ATLAS_DIM.y);
const uint  BORDER_WIDTH            = uint(6);


void leftBorder(bool rounded) {

        vec2 origin = rounded ? ROUNDED_BORDER_ORIGIN : SQUARE_BORDER_ORIGIN;

        gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(BORDER_WIDTH, 0.0f, 0.0f, 0.0f));
        v_MainColor       = data_in[0].d_MainColor;
        v_BackgroundColor = data_in[0].d_BackgroundColor;
        v_StyleST         = origin + vec2(BORDER_NORMALIZED_SIZE.x, 0.0f);
        EmitVertex();

        gl_Position       = data_in[0].d_Camera * gl_in[0].gl_Position;
        v_MainColor       = data_in[0].d_MainColor;
        v_BackgroundColor = data_in[0].d_BackgroundColor;
        v_StyleST         = origin;
        EmitVertex();

        gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(BORDER_WIDTH, BORDER_WIDTH, 0.0f, 0.0f));
        v_MainColor       = data_in[0].d_MainColor;
        v_BackgroundColor = data_in[0].d_BackgroundColor;
        v_StyleST         = origin + BORDER_NORMALIZED_SIZE;
        EmitVertex();

        gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(0.0f, BORDER_WIDTH, 0.0f, 0.0f));
        v_MainColor       = data_in[0].d_MainColor;
        v_BackgroundColor = data_in[0].d_BackgroundColor;
        v_StyleST         = origin + vec2(0.0f, BORDER_NORMALIZED_SIZE.y);
        EmitVertex();

        gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(BORDER_WIDTH, data_in[0].d_Dim.y - BORDER_WIDTH, 0.0f, 0.0f));
        v_MainColor       = data_in[0].d_MainColor;
        v_BackgroundColor = data_in[0].d_BackgroundColor;
        v_StyleST         = origin + BORDER_NORMALIZED_SIZE;
        EmitVertex();

        gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(0.0f, data_in[0].d_Dim.y - BORDER_WIDTH, 0.0f, 0.0f));
        v_MainColor       = data_in[0].d_MainColor;
        v_BackgroundColor = data_in[0].d_BackgroundColor;
        v_StyleST         = origin + vec2(0.0f, BORDER_NORMALIZED_SIZE.y);
        EmitVertex();

        gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(BORDER_WIDTH, data_in[0].d_Dim.y, 0.0f, 0.0f));
        v_MainColor       = data_in[0].d_MainColor;
        v_BackgroundColor = data_in[0].d_BackgroundColor;
        v_StyleST         = origin + vec2(BORDER_NORMALIZED_SIZE.x, 0.0f);
        EmitVertex();

        gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(0.0f, data_in[0].d_Dim.y, 0.0f, 0.0f));
        v_MainColor       = data_in[0].d_MainColor;
        v_BackgroundColor = data_in[0].d_BackgroundColor;
        v_StyleST         = origin;
        EmitVertex();


        EndPrimitive();

} // leftBorder()


void rightBorder(bool rounded) {

        vec2 origin = rounded ? ROUNDED_BORDER_ORIGIN : SQUARE_BORDER_ORIGIN;

        gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(data_in[0].d_Dim.x, 0.0f, 0.0f, 0.0f));
        v_MainColor       = data_in[0].d_MainColor;
        v_BackgroundColor = data_in[0].d_BackgroundColor;
        v_StyleST         = origin;
        EmitVertex();

        gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(data_in[0].d_Dim.x - BORDER_WIDTH, 0.0f, 0.0f, 0.0f));
        v_MainColor       = data_in[0].d_MainColor;
        v_BackgroundColor = data_in[0].d_BackgroundColor;
        v_StyleST         = origin + vec2(BORDER_NORMALIZED_SIZE.x, 0.0f);
        EmitVertex();

        gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(data_in[0].d_Dim.x, BORDER_WIDTH, 0.0f, 0.0f));
        v_MainColor       = data_in[0].d_MainColor;
        v_BackgroundColor = data_in[0].d_BackgroundColor;
        v_StyleST         = origin + vec2(0.0f, BORDER_NORMALIZED_SIZE.y);
        EmitVertex();

        gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(data_in[0].d_Dim.x - BORDER_WIDTH, BORDER_WIDTH, 0.0f, 0.0f));
        v_MainColor       = data_in[0].d_MainColor;
        v_BackgroundColor = data_in[0].d_BackgroundColor;
        v_StyleST         = origin + BORDER_NORMALIZED_SIZE;
        EmitVertex();

        gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(data_in[0].d_Dim.x, data_in[0].d_Dim.y - BORDER_WIDTH, 0.0f, 0.0f));
        v_MainColor       = data_in[0].d_MainColor;
        v_BackgroundColor = data_in[0].d_BackgroundColor;
        v_StyleST         = origin + vec2(0.0f, BORDER_NORMALIZED_SIZE.y);
        EmitVertex();

        gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(data_in[0].d_Dim.x - BORDER_WIDTH, data_in[0].d_Dim.y - BORDER_WIDTH, 0.0f, 0.0f));
        v_MainColor       = data_in[0].d_MainColor;
        v_BackgroundColor = data_in[0].d_BackgroundColor;
        v_StyleST         = origin + BORDER_NORMALIZED_SIZE;

        EmitVertex();

        gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(data_in[0].d_Dim.x, data_in[0].d_Dim.y, 0.0f, 0.0f));
        v_MainColor       = data_in[0].d_MainColor;
        v_BackgroundColor = data_in[0].d_BackgroundColor;
        v_StyleST         = origin;
        EmitVertex();

        gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(data_in[0].d_Dim.x - BORDER_WIDTH, data_in[0].d_Dim.y, 0.0f, 0.0f));
        v_MainColor       = data_in[0].d_MainColor;
        v_BackgroundColor = data_in[0].d_BackgroundColor;
        v_StyleST         = origin + vec2(BORDER_NORMALIZED_SIZE.x, 0.0f);
        EmitVertex();


        EndPrimitive();

} // rightBorder()


void center() {

        gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(data_in[0].d_Dim.x - BORDER_WIDTH, 0.0f, 0.0f, 0.0f));
        v_MainColor       = data_in[0].d_MainColor;
        v_BackgroundColor = data_in[0].d_BackgroundColor;
        v_StyleST         = ROUNDED_BORDER_ORIGIN + vec2(0.0f, BORDER_NORMALIZED_SIZE.y);
        EmitVertex();

        gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(BORDER_WIDTH, 0.0f, 0.0f, 0.0f));
        v_MainColor       = data_in[0].d_MainColor;
        v_BackgroundColor = data_in[0].d_BackgroundColor;
        v_StyleST         = ROUNDED_BORDER_ORIGIN + vec2(0.0f, BORDER_NORMALIZED_SIZE.y);
        EmitVertex();

        gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(data_in[0].d_Dim.x - BORDER_WIDTH, BORDER_WIDTH, 0.0f, 0.0f));
        v_MainColor       = data_in[0].d_MainColor;
        v_BackgroundColor = data_in[0].d_BackgroundColor;
        v_StyleST         = ROUNDED_BORDER_ORIGIN + BORDER_NORMALIZED_SIZE;
        EmitVertex();

        gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(BORDER_WIDTH, BORDER_WIDTH, 0.0f, 0.0f));
        v_MainColor       = data_in[0].d_MainColor;
        v_BackgroundColor = data_in[0].d_BackgroundColor;
        v_StyleST         = ROUNDED_BORDER_ORIGIN + BORDER_NORMALIZED_SIZE;
        EmitVertex();

        gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(data_in[0].d_Dim.x - BORDER_WIDTH, data_in[0].d_Dim.y - BORDER_WIDTH, 0.0f, 0.0f));
        v_MainColor       = data_in[0].d_MainColor;
        v_BackgroundColor = data_in[0].d_BackgroundColor;
        v_StyleST         = ROUNDED_BORDER_ORIGIN + BORDER_NORMALIZED_SIZE;
        EmitVertex();

        gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(BORDER_WIDTH, data_in[0].d_Dim.y - BORDER_WIDTH, 0.0f, 0.0f));
        v_MainColor       = data_in[0].d_MainColor;
        v_BackgroundColor = data_in[0].d_BackgroundColor;
        v_StyleST         = ROUNDED_BORDER_ORIGIN + BORDER_NORMALIZED_SIZE;
        EmitVertex();

        gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(data_in[0].d_Dim.x - BORDER_WIDTH, data_in[0].d_Dim.y, 0.0f, 0.0f));
        v_MainColor       = data_in[0].d_MainColor;
        v_BackgroundColor = data_in[0].d_BackgroundColor;
        v_StyleST         = ROUNDED_BORDER_ORIGIN + vec2(0.0f, BORDER_NORMALIZED_SIZE.y);
        EmitVertex();

        gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(BORDER_WIDTH, data_in[0].d_Dim.y, 0.0f, 0.0f));
        v_MainColor       = data_in[0].d_MainColor;
        v_BackgroundColor = data_in[0].d_BackgroundColor;
        v_StyleST         = ROUNDED_BORDER_ORIGIN + vec2(0.0f, BORDER_NORMALIZED_SIZE.y);
        EmitVertex();


        EndPrimitive();

} // center()


void icon() {

    float offset = (data_in[0].d_StyleData >> 3) * ICON_NORMALIZED_X_WIDTH;

    gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(data_in[0].d_Dim.x * 0.5f - data_in[0].d_Dim.y * 0.5f, 0.0f, ICON_LAYER_OFFSET, 0.0f));
    v_MainColor       = data_in[0].d_MainColor;
    v_BackgroundColor = data_in[0].d_BackgroundColor;
    v_IconST          = vec2(offset, 0.0f);
    EmitVertex();

    gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(data_in[0].d_Dim.x * 0.5f - data_in[0].d_Dim.y * 0.5f, data_in[0].d_Dim.y, ICON_LAYER_OFFSET, 0.0f));
    v_MainColor       = data_in[0].d_MainColor;
    v_BackgroundColor = data_in[0].d_BackgroundColor;
    v_IconST          = vec2(offset, 1.0f);
    EmitVertex();

    gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(data_in[0].d_Dim.x * 0.5f + data_in[0].d_Dim.y * 0.5f, 0.0f, ICON_LAYER_OFFSET, 0.0f));
    v_MainColor       = data_in[0].d_MainColor;
    v_BackgroundColor = data_in[0].d_BackgroundColor;
    v_IconST          = vec2(offset + ICON_NORMALIZED_X_WIDTH, 0.0f);
    EmitVertex();

    gl_Position       = data_in[0].d_Camera * (gl_in[0].gl_Position + vec4(data_in[0].d_Dim.x * 0.5f + data_in[0].d_Dim.y * 0.5f, data_in[0].d_Dim.y, ICON_LAYER_OFFSET, 0.0f));
    v_MainColor       = data_in[0].d_MainColor;
    v_BackgroundColor = data_in[0].d_BackgroundColor;
    v_IconST          = vec2(offset + ICON_NORMALIZED_X_WIDTH, 1.0f);
    EmitVertex();


    EndPrimitive();

} // icon()


void main() {

    const int ROUNDED_LEFT  = 0x01;
    const int ROUNDED_RIGHT = 0x02;
    const int ICON          = 0x04;

    leftBorder(((data_in[0].d_StyleData & ROUNDED_LEFT) == ROUNDED_LEFT));
    rightBorder(((data_in[0].d_StyleData & ROUNDED_RIGHT) == ROUNDED_RIGHT));

    center();

    if ((data_in[0].d_StyleData & ICON) == ICON)
        icon();

} // main()
