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
//    [self test1];//划单个线
//    [self test2];//画多个线
//    [self test3];//画矩形
//    [self test4];
//    [self test5];
//    [self test6];
//    [self test7];
//    [self test8];
//    [self test9];
    [self test10];
    
    
    
    
}

- (void)test10 { //关闭路径的设置
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGPoint points[4] = {
        CGPointMake(50, 50),
        CGPointMake(150, 50),
        CGPointMake(150, 150),
        CGPointMake(50, 150)
    };
    CGContextAddLines(ctx, points, 4);
    CGContextClosePath(ctx);//连接起始点
   
//    CGContextFillPath(ctx);  //填充
   // CGContextStrokePath(ctx); //划线,
                //    CGPathDrawingMode {
                //        kCGPathFill,           //填充
                //        kCGPathEOFill,           // eo填充, 即  奇偶填充
                //        kCGPathStroke,//划线
                //        kCGPathFillStroke,//填充划线
                //        kCGPathEOFillStroke//奇偶划线
                //    }
    [[UIColor blueColor] setFill];
    CGContextDrawPath(ctx,  kCGPathFill);// 等同CGContextFillPath(ctx)
//     CGContextDrawPath(ctx,  kCGPathEOFill);
//    CGContextDrawPath(ctx,  kCGPathStroke);//等同 CGContextStrokePath(ctx);
//    CGContextDrawPath(ctx,  kCGPathFillStroke); 
// CGContextDrawPath(ctx,  kCGPathEOFillStroke);
}



- (void)test9 {//贝塞尔曲线
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(contextRef, 50, 50);
//    CGContextAddQuadCurveToPoint(上下文, 控制点x, 控制点y, 结束点x, 结束点y)
    CGContextAddQuadCurveToPoint(contextRef, 100, 0, 150, 50);
    CGContextStrokePath(contextRef);
    
}


- (void)test8 { //虚线
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(contextRef, 0, 20);
    CGContextAddLineToPoint(contextRef, 200, 20);
    CGFloat lengths[] = {
       10, 5, 20, 30
    };
//    CGContextSetLineDash(上下文, 偏移(第一段线段的长度为  lengths[0]-偏移的距离), 线段数组, 数量);
    
    CGContextSetLineDash(contextRef, 5, lengths, 4);
    CGContextStrokePath(contextRef);
    
}


- (void)test7 {//设置线的特性
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    CGContextAddRect(contextRef, CGRectMake(50, 50, 150, 150));
    CGContextSetLineWidth(contextRef, 5);//线宽
//    CGContextSetRGBStrokeColor(contextRef, 1, 0, 0, 1);//颜色
    [[UIColor blueColor] setStroke];//同上,
    CGContextSetLineJoin(contextRef, kCGLineJoinRound);
    
    CGContextStrokePath(contextRef);
    
}
- (void)test6 { //画一个同心圆
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextAddArc(contextRef, 50, 50, 50, 0, 2*M_PI, 0);//圆形
    //画过一个之后要讲其实点移动到下一个圆上,
    CGContextMoveToPoint(contextRef, 80, 50);
    
    
    CGContextAddArc(contextRef, 50, 50, 30, 0, 2*M_PI, 0);//圆形
    CGContextStrokePath(contextRef);
}



- (void)test5 {//圆弧2 or圆
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    //设置路径
    // CGContextAddArc(上下文, 圆心x, 圆心y, 半径, 其实弧度, 结束弧度, 方向(逆时针和顺时针))
//    CGContextAddArc(contextRef, 50, 50, 50, 0, M_PI, 0);//圆弧
    CGContextAddArc(contextRef, 50, 50, 50, 0, 2*M_PI, 0);//圆形
 
    CGContextStrokePath(contextRef);
    
}




- (void)test4 {//画圆弧
    //获取当前上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    //设置起点
    CGContextMoveToPoint(contextRef, 200, 50);
    //添加路径  这个方法用起来有点复杂,  首先要有当前点假设为P0(200, 50),
    //其次是第一个点P1(50, 50),  然后是第二个点P2(50, 200);, 最后一个参数是半径,
    //绘制先从P0->P1, 画一条直线, 然后画一条弧线, 会显得要求是与直线P0P1, 和直线P1P2 相切,并且半径是50.
    CGContextAddArcToPoint(contextRef, 50, 50, 50, 200, 50);
    //绘制
    CGContextStrokePath(contextRef);
}
- (void)test3 {//画矩形
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    //添加路径
    CGContextAddRect(contextRef, CGRectMake(20, 40, 100, 100));
    // 绘制
    CGContextStrokePath(contextRef);
}

- (void)test2 {//画多个线
    //获取上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    //设置线的路径,  c语言数组
    CGPoint points[] = {
        CGPointMake(0, 0),
        CGPointMake(50, 50),
        CGPointMake(0, 50),
        CGPointMake(50, 100),
        CGPointMake(0, 0)
    };
    CGContextAddLines(contextRef, points, 5);
    //绘制
    CGContextStrokePath(contextRef);
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
