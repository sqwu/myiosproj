//
//  IDInfoViewController.m
//  IDCardRecognition
//
//  Created by zhongfeng1 on 2017/2/21.
//  Copyright © 2017年 李中峰. All rights reserved.

//  请给个星：https://github.com/zhongfenglee/IDCardRecognition
//  请关注我：https://github.com/zhongfenglee

#import "IDInfoViewController.h"
#import "IDInfo.h"
#import "AVCaptureViewController.h"
#import "IDCardController.h"

@interface IDInfoViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *IDImageView;
@property (strong, nonatomic) IBOutlet UILabel *IDNumLabel;

@end

@implementation IDInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"身份证信息";
    
    self.IDImageView.layer.cornerRadius = 8;
    self.IDImageView.layer.masksToBounds = YES;
    
    self.IDNumLabel.text = _IDInfo.num;
    self.IDImageView.image = _IDImage;
}

#pragma mark - 错误，重新拍摄
- (IBAction)shootAgain:(UIButton *)sender {    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 正确，下一步
- (IBAction)nextStep:(UIButton *)sender {
    NSLog(@"经用户核对，身份证号码正确，那就进行下一步，比如身份证图像或号码经加密后，传递给后台");
    
    NSArray *vcArray = self.navigationController.viewControllers;
    for (UIViewController *tempVC in vcArray) {
        if ([tempVC isKindOfClass:[IDCardController class]]) {
            IDCardController *IDCardVC = (IDCardController *)tempVC;
            IDCardVC.IDCardFrontImg = _IDImage;
            IDCardVC.IDName         = _IDInfo.name;
            IDCardVC.IDNumber       = _IDInfo.num;
            [self.navigationController popToViewController:IDCardVC animated:YES];
        }
    }
}








@end
