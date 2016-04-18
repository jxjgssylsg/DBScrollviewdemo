//
//  ViewController.m
//  DBScrollviewdemo_01
//
//  Created by Mr_db on 16/4/16.
//  Copyright (c) 2016年 Mr_db. All rights reserved.
//

#import "DBViewController.h"
#import "DBTransformViewController.h"
#import "DBRotateViewController.h"

@interface DBViewController ()

@end

@implementation DBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    int widthOut = self.view.frame.size.width;
    int widthIn  = widthOut - 20;
    btnArray = [[NSMutableArray alloc] init];
    
    //
    textFieldNumber = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, widthIn - 70, 30)];
    
    textFieldNumber.backgroundColor = [UIColor whiteColor];
    textFieldNumber.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:textFieldNumber];
    
    //声明一个 UIButton
    btnStart = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnStart setTitle:@"开始" forState:UIControlStateNormal];
    btnStart.frame = CGRectMake(widthIn - 50, 10, 60, 30);
    [btnStart addTarget:self action:@selector(btnStartAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnStart];
    
    //
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, widthOut, self.view.frame.size.height - 50)];
    scrollView.backgroundColor = [UIColor grayColor];
    scrollView.pagingEnabled = NO;
    scrollView.showsHorizontalScrollIndicator = YES;
    scrollView.delegate = self;
    
    [self.view addSubview:scrollView];
    
    //demo2 添加旋转控制器  - 注释下面的几句话就变成了demo1
    DBTransformViewController *trans = [[DBTransformViewController alloc] init];
    trans.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:trans];
    [self.view addSubview:trans.view];
    // ---demo2
    
    //----demo3
    DBRotateViewController *rotateScrollView = [[DBRotateViewController alloc] init];
    rotateScrollView.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:rotateScrollView];
    [self.view addSubview:rotateScrollView.view];
    //------demo3
    
    
}

- (IBAction)btnStartAction:(id)sender
{
    [textFieldNumber resignFirstResponder];
    int i;
    UIButton *button;
    for (i = 0; i< [btnArray count]; i++) {
        button = (UIButton *)[btnArray objectAtIndex:i];
        [button removeFromSuperview];
    }
    [btnArray removeAllObjects];
    int number = [textFieldNumber.text intValue];
    for (i = 0; i<number; i++) {
        button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle:[NSString stringWithFormat:@"%d", i] forState:UIControlStateNormal];
        button.frame = CGRectMake(10, 10 + i * 40, self.view.frame.size.width - 20, 60);
        [button addTarget:self action:@selector(btnAlert:) forControlEvents:UIControlEventTouchUpInside];
        [btnArray addObject:button];
        [scrollView addSubview:button];
        button.backgroundColor = [UIColor whiteColor];
    }
    
    //设置contentSize的大小
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, number*40 + 10);
    
}

- (void)btnAlert:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    NSString *str = [NSString stringWithFormat:@"您按下了%@键",btn.currentTitle];
    UIAlertView *alterview = [[UIAlertView alloc] initWithTitle:@"" message:str delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alterview show];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScroll");
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDragging");
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"scrollViewDidEndDragging");
}


- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDecelerating");
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndDecelerating");
}


- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewShouldScrollToTop");
    
    return YES;
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScrollToTop");
}

@end
