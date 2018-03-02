//
//  RNSketchCanvasDelegate.m
//  RNSketchCanvas
//
//  Created by terry on 03/08/2017.
//  Copyright © 2017 Terry. All rights reserved.
//

#import "RNSketchCanvasDelegate.h"

@implementation RNSketchCanvasDelegate

CGPoint midPoint (CGPoint p1, CGPoint p2) {
    return CGPointMake((p1.x + p2.x) * 0.5, (p1.y + p2.y) * 0.5);
}

- (void)drawCurveFromPoints:(NSArray *)points inContext:(CGContextRef)context {
    for (int i = 0; i < points.count; i++) {
        
        CGPoint currentPoint = [points[i] CGPointValue];
        CGPoint previousPoint = [points[i] CGPointValue];
        CGPoint tertiaryPoint = [points[i] CGPointValue];
        if (i == 1) {
            previousPoint = [points[i - 1] CGPointValue];
            tertiaryPoint = [points[i - 1] CGPointValue];
        } else {
            previousPoint = [points[i - 1] CGPointValue];
            tertiaryPoint = [points[i - 2] CGPointValue];
        }
        
        CGPoint mid1 = midPoint(previousPoint, tertiaryPoint);
        CGPoint mid2 = midPoint(currentPoint, tertiaryPoint);
        CGContextMoveToPoint(context, mid1.x, mid1.y);
        CGContextAddQuadCurveToPoint(context,
                                     previousPoint.x,
                                     previousPoint.y,
                                     mid2.x,
                                     mid2.y);
        
        CGContextStrokePath(context);
        
    }
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)context {
    for (int index=0; index<_paths.count; index++) {
        RNSketchData *data = _paths[index];
        CGContextSetLineWidth(context, (float)data.strokeWidth);
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextSetStrokeColorWithColor(context, [data.strokeColor CGColor]);
        
        if (data.points) {
            if (data.points.count > 1) {
                [self drawCurveFromPoints:data.points inContext:context];
            } else if (data.points.count == 1) {
                CGPoint p = [data.points[0] CGPointValue];
                CGContextMoveToPoint(context, p.x, p.y);
                CGContextAddLineToPoint(context, p.x, p.y);
                CGContextStrokePath(context);
            }
        } else {
            [self drawCurveFromPoints:_currentPoints inContext:context];
        }
    }
}

@end
