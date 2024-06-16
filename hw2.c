#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "bmplib.h"
#include "hw2.h"

// Optimized convolution function
static Pixel convolution(Pixel* input, int x, int y, int width, int height, float* filter, int* filterIndices) {
    double r = 0;
    double g = 0;
    double b = 0;

    for (int i = 0; i < 9; ++i) {
        int dx = filterIndices[2 * i];
        int dy = filterIndices[2 * i + 1];

        int ix = x + dx;
        int iy = y + dy;

        if (ix >= 0 && ix < width && iy >= 0 && iy < height) {
            Pixel* pixel = &input[ix + iy * width];
            float f = filter[i];

            r += pixel->r * f;
            g += pixel->g * f;
            b += pixel->b * f;
        }
    }

    Pixel p;
    p.r = (unsigned char)(r < 0 ? 0 : (r > 255 ? 255 : r));
    p.g = (unsigned char)(g < 0 ? 0 : (g > 255 ? 255 : g));
    p.b = (unsigned char)(b < 0 ? 0 : (b > 255 ? 255 : b));

    return p;
}

void filter_optimized(void* args[]) {
    unsigned int width = *(unsigned int*)args[0];
    unsigned int height = *(unsigned int*)args[1];
    Pixel* input = (Pixel*)args[2];
    Pixel* output = (Pixel*)args[3];
    float* filter = (float*)args[4];

    int filterIndices[18];
    int filterSize = 3;
    int halfFilterSize = filterSize / 2;

    // Precompute filter indices
    int index = 0;
    for (int dy = -halfFilterSize; dy <= halfFilterSize; ++dy) {
        for (int dx = -halfFilterSize; dx <= halfFilterSize; ++dx) {
            filterIndices[2 * index] = dx;
            filterIndices[2 * index + 1] = dy;
            index++;
        }
    }

    for (int y = 0; y < height; ++y) {
        for (int x = 0; x < width; ++x) {
            output[x + y * width] = convolution(input, x, y, width, height, filter, filterIndices);
        }
    }
}
