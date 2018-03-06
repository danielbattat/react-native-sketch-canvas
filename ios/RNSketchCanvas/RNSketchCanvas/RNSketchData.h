//
//  RNSketchCanvasData.h
//  RNSketchCanvas
//
//  Created by terry on 03/08/2017.
//  Copyright © 2017 Terry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RNSketchData : NSObject

@property NSMutableArray *points;
@property NSInteger pathId;
@property float strokeWidth;
@property UIColor *strokeColor;

- (instancetype)initWithId:(NSInteger)pathId strokeColor:(UIColor *)strokeColor strokeWidth:(float)strokeWidth points:(NSArray *)points;
- (instancetype)initWithId:(NSInteger)pathId strokeColor:(UIColor *)strokeColor strokeWidth:(float)strokeWidth;
- (NSArray*)addPoint:(CGPoint)point;

@end
