//
//  LoginViewController.m
//  AParty
//
//  Created by puacirl on 15/11/17.
//  Copyright © 2015年 JConnor. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

#import "UMSocial.h"
#import "FindPasswordViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *telephoneTF;
@property (weak, nonatomic) IBOutlet UITextField *passWordTF;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *teleTFCenterYConstraint;

@end

@implementation LoginViewController
- (IBAction)forgetPasswordClick:(UIButton *)sender {
    
    FindPasswordViewController *vc = [[UIStoryboard storyboardWithName:@"PersonInfoTableViewController" bundle:nil]instantiateViewControllerWithIdentifier:@"FindPasswordViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
}
- (IBAction)loginClick:(UIButton *)sender {
    [self.view endEditing:YES];
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary]valueForKey:UMShareToWechatSession];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            
        }
        
    });
    
    [[UMSocialDataService defaultDataService] requestSnsInformation:UMShareToWechatSession  completion:^(UMSocialResponseEntity *response){
        
        
        NSLog(@"SnsInformation is %@",response.data);
    }];

    

}





- (IBAction)newUserRegisterClick:(id)sender {
    RegisterViewController *vc = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(UIImage*)convertViewToImage:(UIView*)v{
    
    
    
    UIGraphicsBeginImageContext(v.bounds.size);
    
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ([textField isEqual:_telephoneTF]) {
        [self.passWordTF becomeFirstResponder];
    } else {
          [self.view endEditing:YES];
    }
    
  
    //LOGIN
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"bj"];

    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    iv.image = image;
    [_telephoneTF setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_passWordTF setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];

    
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[self convertViewToImage:iv]];
    _telephoneTF.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dengrukuang.png"]];
    _passWordTF.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dengrukuang.png"]];

    UIImageView *teleIV = [[UIImageView alloc]initWithFrame:CGRectMake(320, 0, 44, 44)];
    teleIV.image = [UIImage imageNamed:@"yonghu"];
    _telephoneTF.leftView = teleIV;
    _telephoneTF.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView *passwordIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    passwordIV.image = [UIImage imageNamed:@"mima"];
    _passWordTF.leftView = passwordIV;
    _passWordTF.leftViewMode = UITextFieldViewModeAlways;
    _telephoneTF.delegate = self;
    _passWordTF.delegate = self;
    _passWordTF.returnKeyType = UIReturnKeyGo;
    _telephoneTF.returnKeyType = UIReturnKeyNext;
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keybordShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keybordHide:) name:UIKeyboardDidHideNotification object:nil];


}

-(void)keybordShow:(NSNotification*)noti{
//    CGRect keyBoardFrame = [[[noti userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    self.teleTFCenterYConstraint.active =  NO;
}

-(void)keybordHide:(NSNotification*)noti{
//    self.teleTFCenterYConstraint.active =  YES;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
