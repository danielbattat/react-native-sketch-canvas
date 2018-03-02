//
//  RNSketchCanvasData.m
//  RNSketchCanvas
//
//  Created by terry on 03/08/2017.
//  Copyright © 2017 Terry. All rights reserved.
//

#import "RNSketchData.h"

@implementation RNSketchData

- (instancetype)initWithId:(NSInteger)pathId strokeColor:(UIColor*)strokeColor strokeWidth:(float)strokeWidth
{
    self = [super init];
    if (self) {
        _pathId = pathId;
        _strokeColor = strokeColor;
        _strokeWidth = strokeWidth;
        _points = [[NSMutableArray alloc] init];
    }
    return self;
}

- (instancetype)initWithId:(NSInteger)pathId strokeColor:(UIColor*) strokeColor strokeWidth:(float)strokeWidth points: (NSArray *)points
{
    self = [super init];
    if (self) {
        _pathId = pathId;
        _strokeColor = strokeColor;
        _strokeWidth = strokeWidth;
        _points = points.mutableCopy;
    }
    return self;
}

- (NSArray*)addPoint:(CGPoint) point {
    [_points addObject: [NSValue valueWithCGPoint: point]];
    return _points;
}

@end
