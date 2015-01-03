/*
 Copyright (c) 2015 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import "YZPolygonHelper.h"

@implementation YZPolygonHelper

+ (CGPoint)findCentroidForNumberOfPoints:(NSInteger)numberOfPoints xAtIndexBlock:(YZFloatForIntegerBlock)xAtIndex yAtIndexBlock:(YZFloatForIntegerBlock)yAtIndex
{

    float a, cx, cy, t;
    int i, i1;
	
    /* First calculate the polygon's signed area A */

    a = 0.0;
    i1 = 1;
    for (i = 0; i < numberOfPoints; i++) {
        a += xAtIndex(i) * yAtIndex(i1) - xAtIndex(i1) * yAtIndex(i);
        i1 = (i1 + 1) % numberOfPoints;
    }
    a *= 0.5;

    /* Now calculate the centroid coordinates Cx and Cy */

    cx = cy = 0.0;
    i1 = 1;
    for (i = 0; i < numberOfPoints; i++) {
        t = xAtIndex(i) * yAtIndex(i1) - xAtIndex(i1) * yAtIndex(i);
        cx += (xAtIndex(i) + xAtIndex(i1)) * t;
        cy += (yAtIndex(i) + yAtIndex(i1)) * t;
        i1 = (i1 + 1) % numberOfPoints;
    }
    cx = cx / (6.0 * a);
    cy = cy / (6.0 * a);
	
	return CGPointMake(cx, cy);
	
}

+ (BOOL)isPointContained:(CGPoint)point inNumberOfPoints:(NSInteger)numberOfPoints xAtIndexBlock:(YZFloatForIntegerBlock)xAtIndex yAtIndexBlock:(YZFloatForIntegerBlock)yAtIndex
{
    BOOL result = NO;

    int i = 0;
    int j = (int)numberOfPoints - 1;
    for (; i < numberOfPoints; j = i++) {

        CGPoint iPoint = CGPointMake(xAtIndex(i), yAtIndex(i));
        CGPoint jPoint = CGPointMake(xAtIndex(j), yAtIndex(j));

        if (((iPoint.y > point.y) != (jPoint.y > point.y)) && (point.x < (jPoint.x - iPoint.x) * (point.y - iPoint.y) / (jPoint.y - iPoint.y) + iPoint.x))
            result = !result;
    }
    return result;
}

@end
