//
//  ViewController.m
//  DemoOfDrawPicture
//
//  Created by 王俊岭 on 2017/6/16.
//  Copyright © 2017年 王俊岭. All rights reserved.
//

#import "ViewController.h"
#import "JLView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
    [self test];
    
}

- (void)test {//绘图
    JLView *view = [[JLView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    view.layer.borderWidth = 1.f;
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
