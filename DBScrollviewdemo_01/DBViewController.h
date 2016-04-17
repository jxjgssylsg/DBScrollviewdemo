//
//  ViewController.h
//  DBScrollviewdemo_01
//
//  Created by Mr_db on 16/4/16.
//  Copyright (c) 2016年 Mr_db. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DBViewController : UIViewController<UIScrollViewDelegate>
{
    UITextField *textFieldNumber;
    UIButton   *btnStart;
    UIScrollView *scrollView;
    NSMutableArray *btnArray;
}

- (IBAction)btnStartAction:(id)sender;
- (IBAction)btnAlert:(id)sender;

@end

