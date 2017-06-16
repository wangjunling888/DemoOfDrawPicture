//
//  JLView.m
//  啊啊啊
//
//  Created by 王俊岭 on 2017/6/16.
//  Copyright © 2017年 王俊岭. All rights reserved.
//

#import "JLView.h"

@implementation JLView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/
- (void)drawRect:(CGRect)rect {
    [self test1];//划线
}



- (void)test1 {//划线
    //1, 获取上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    //2. 起点和终点
    CGContextMoveToPoint(contextRef, 0, 0);
    CGContextAddLineToPoint(contextRef, 100, 100);
    //3. 绘制
    CGContextStrokePath(contextRef);
}


@end
