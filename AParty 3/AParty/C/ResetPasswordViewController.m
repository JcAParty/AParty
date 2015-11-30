//
//  ResetPasswordViewController.m
//  AParty
//
//  Created by puacirl on 15/11/25.
//  Copyright © 2015年 JConnor. All rights reserved.
//
#import "ResetPasswordViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>
@interface ResetPasswordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *passwordTF1;
@property (weak, nonatomic) IBOutlet UITextField *password2;
@property (weak, nonatomic) IBOutlet UIButton *sureButton;

@end

@implementation ResetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = APartyColor;
    self.navigationItem.title = @"重置密码";
    [_passwordTF1 setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_password2 setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    _sureButton.layer.cornerRadius = 6;
    _sureButton.clipsToBounds = YES;

}
- (IBAction)sureClick:(UIButton *)sender {
    if (![_passwordTF1.text isEqualToString:_password2.text]) {
  //      [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    } else {
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
