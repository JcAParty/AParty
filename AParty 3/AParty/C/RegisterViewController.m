//
//  RegisterViewController.m
//  AParty
//
//  Created by puacirl on 15/11/17.
//  Copyright © 2015年 JConnor. All rights reserved.
//

#import "RegisterViewController.h"
#import "PersonInfoTableViewController.h"
@interface RegisterViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UITextField *verifyCodeTF;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLay;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bjtTopLayout;
@property(nonatomic,strong)UIButton *getVerifyCodeBtn;
@property(nonatomic,strong)NSTimer *timer;
@property (assign, nonatomic) NSInteger time;
@end

@implementation RegisterViewController


- (void)senderShow:(NSTimer *)timer {
    [_getVerifyCodeBtn setTitle:[NSString stringWithFormat:@"%zds", _time]
                 forState:UIControlStateNormal];
    if (_time <= 0.0) {
        [timer invalidate];
        timer = nil;
        _getVerifyCodeBtn.enabled = YES;
        [_getVerifyCodeBtn setTitle:@"重获验证码"
                     forState:UIControlStateNormal];
    }else{
        _getVerifyCodeBtn.enabled = NO;
    }
    _time --;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_timer invalidate];
    _timer = nil;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ([textField isEqual:_usernameTF]) {
        [_passwordTF becomeFirstResponder];
    } else if([textField isEqual:_passwordTF]){
        [self.view endEditing:YES];
        [self huoDeYZM];
    }else if([textField isEqual:_verifyCodeTF]){
        
        [self.view endEditing:YES];
    }
    
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [_usernameTF setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
     [_passwordTF setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
     [_verifyCodeTF setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    _usernameTF.returnKeyType = UIReturnKeyNext;
    _passwordTF.returnKeyType = UIReturnKeyContinue;
    _verifyCodeTF.returnKeyType = UIReturnKeyJoin;
    _usernameTF.delegate = self;
    _passwordTF.delegate = self;
    _verifyCodeTF.delegate = self;
    
    
    self.navigationController.navigationBar.alpha = 0.1;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bj"]];
    _usernameTF.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dengrukuang.png"]];
    _passwordTF.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dengrukuang.png"]];
    _verifyCodeTF.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dengrukuang.png"]];
    UIImageView *teleIV = [[UIImageView alloc]initWithFrame:CGRectMake(320, 0, 44, 44)];
    teleIV.image = [UIImage imageNamed:@"yonghu"];
    _usernameTF.leftView = teleIV;
    _usernameTF.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView *passwordIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    passwordIV.image = [UIImage imageNamed:@"mima"];
    _passwordTF.leftView = passwordIV;
    _passwordTF.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView *verifyCodeIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    verifyCodeIV.image = [UIImage imageNamed:@"yaoshi"];
    _verifyCodeTF.leftView = verifyCodeIV;
    _verifyCodeTF.leftViewMode = UITextFieldViewModeAlways;

    
    
    _getVerifyCodeBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_verifyCodeTF.bounds)-100, 0, 100,30 )];
    _getVerifyCodeBtn.layer.cornerRadius = 6;
    _getVerifyCodeBtn.clipsToBounds = YES;
    [_verifyCodeTF addSubview:_getVerifyCodeBtn];
    [_getVerifyCodeBtn setBackgroundImage:[UIImage imageNamed:@"yzm"] forState:UIControlStateNormal];
    
//    _verifyCodeTF.rightView = _getVerifyCodeBtn;
//    _verifyCodeTF.rightViewMode = UITextFieldViewModeAlways;
    [_getVerifyCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_getVerifyCodeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_getVerifyCodeBtn addTarget:self action:@selector(huoDeYZM) forControlEvents:UIControlEventTouchUpInside];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keybordShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keybordHide:) name:UIKeyboardDidHideNotification object:nil];
    
    
}

-(void)huoDeYZM{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                              target:self
                                            selector:@selector(senderShow:)
                                            userInfo:nil
                                             repeats:YES];
    _time = 60;
    [_timer fire];

}

-(void)keybordShow:(NSNotification*)noti{
        _bjtTopLayout.constant = -50;
        _topLay.constant = -105;
    [UIView animateWithDuration:.5 animations:^{
        [self.view layoutIfNeeded];
    }];

    
}

-(void)keybordHide:(NSNotification*)noti{
        _bjtTopLayout.constant = 0;
        _topLay.constant = -55;
    [UIView animateWithDuration:.5 animations:^{
        [self.view layoutIfNeeded];
    }];

    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (IBAction)registClick:(UIButton *)sender {
    [self.view endEditing:YES];
    PersonInfoTableViewController *vc = [UIStoryboard storyboardWithName:@"PersonInfoTableViewController" bundle:nil].instantiateInitialViewController;
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (IBAction)userArticle:(id)sender {
    
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
