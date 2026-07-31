#version 120

uniform sampler2D texture;
uniform sampler2D desktop;
uniform vec2 screenSize;

varying vec2 uvCoord;

vec4 desktopPixel(vec2 offset)
{
    vec2 pixel = vec2(1.0 / screenSize.x, 1.0 / screenSize.y);
    return texture2D(desktop, vec2(uvCoord.x, -uvCoord.y) + offset * pixel);
}

float selectionMask(vec2 offset)
{
    vec2 pixel = vec2(1.0 / screenSize.x, 1.0 / screenSize.y);
    return step(0.01, texture2D(texture, uvCoord + offset * pixel).a);
}

void main()
{
    // A lightweight 5x5 box blur for everything outside the selection.
    vec4 blurred = vec4(0.0);
    for (int x = -2; x <= 2; ++x) {
        for (int y = -2; y <= 2; ++y) {
            blurred += desktopPixel(vec2(float(x), float(y)) * 2.5);
        }
    }
    blurred /= 25.0;

    vec4 sharp = desktopPixel(vec2(0.0));
    float selected = selectionMask(vec2(0.0));

    // Detect the inside edge of the mask and draw a OneDark-blue outline.
    float inner = selectionMask(vec2(-2.0, 0.0))
                * selectionMask(vec2(2.0, 0.0))
                * selectionMask(vec2(0.0, -2.0))
                * selectionMask(vec2(0.0, 2.0));
    float edge = selected * (1.0 - inner);

    vec4 result = mix(blurred, sharp, selected);
    result.rgb = mix(result.rgb, vec3(0.380, 0.686, 0.937), edge * 0.9);
    result.a = 1.0;
    gl_FragColor = result;
}
