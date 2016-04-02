//
//  ViewController.m
//  Demo3_JS_GCD
//
//  Created by  江苏 on 16/3/18.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建线程队列（串行）
    dispatch_queue_t myQueue=dispatch_queue_create("myQueue", NULL);
//    dispatch_async(myQueue, ^{
//        for (int i=0; i<5; i++) {
//            [NSThread sleepForTimeInterval:1];
//            NSLog(@"这里是1号子线程");
//        }
//    });
//    dispatch_async(myQueue, ^{
//        for (int i=0; i<5; i++) {
//            [NSThread sleepForTimeInterval:1];
//            NSLog(@"这里是2号子线程");
//        }
//    });
    //创建并行队列
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i=0; i<5; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"这里是1号子线程");
        }
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i=0; i<5; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"这里是2号子线程");
        }
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
