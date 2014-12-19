/*
 Copyright (c) 2014 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import "YZPolygonHelper.h"

@implementation YZPolygonHelper

+ (CGPoint)findCentroidForNumberOfPoints:(NSInteger)numberOfPoints xAtIndexBlock:(YZFloatForIntegerBlock)xAtIndex yAtIndexBlock:(YZFloatForIntegerBlock)yAtIndex{
	
	CGPoint theCentroid;
	CGPoint a;
	CGPoint b;
	
	double signedArea = 0.0;
	double k = 0.0;  // Partial signed area
	
	// For all vertices except last
	int i=0;
	for (i=0; i<numberOfPoints; ++i)
	{
		if(i == numberOfPoints-1){
			a = CGPointMake(xAtIndex(i), yAtIndex(i));
			b = CGPointMake(xAtIndex(0), yAtIndex(i));
		}else{
			a = CGPointMake(xAtIndex(i), yAtIndex(i));
			b = CGPointMake(xAtIndex(i+1), yAtIndex(i+1));
		}
		k = a.x*b.y - a.y*b.x;
		signedArea += k;
		theCentroid.x += (a.x + b.x)*k;
		theCentroid.y += (a.y + b.y)*k;
	}
	
	signedArea *= 0.5;
	theCentroid.x /= (6.0*signedArea);
	theCentroid.y /= (6.0*signedArea);
	
	return theCentroid;
	
}

+ (BOOL)isPointContained:(CGPoint)point inNumberOfPoints:(NSInteger)numberOfPoints xAtIndexBlock:(YZFloatForIntegerBlock)xAtIndex yAtIndexBlock:(YZFloatForIntegerBlock)yAtIndex
{
	BOOL result = NO;
	
	int i = 0;
	int j = (int)numberOfPoints - 1;
	for ( ; i < numberOfPoints; j = i++)
	{
		
		CGPoint iPoint = CGPointMake(xAtIndex(i), yAtIndex(i));
		CGPoint jPoint = CGPointMake(xAtIndex(j), yAtIndex(j));
		
		if (((iPoint.y > point.y) != (jPoint.y>point.y)) &&
			(point.x < (jPoint.x-iPoint.x) * (point.y-iPoint.y) / (jPoint.y-iPoint.y) + iPoint.x))
			result = !result;
	}
	return result;
}


@end
