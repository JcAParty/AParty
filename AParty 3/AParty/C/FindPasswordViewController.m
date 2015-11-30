//
//  FindPasswordViewController.m
//  AParty
//
//  Created by puacirl on 15/11/25.
//  Copyright © 2015年 JConnor. All rights reserved.
//

#import "FindPasswordViewController.h"

@interface FindPasswordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *telephoneTF;
@property (weak, nonatomic) IBOutlet UITextField *verifyCodeTF;
@property (weak, nonatomic) IBOutlet UIButton *nextStepButton;
@property(nonatomic,strong)UIButton *getVerifyCodeBtn;
@property(nonatomic,strong)NSTimer *timer;
@property (assign, nonatomic) NSInteger time;

@end

@implementation FindPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = APartyColor;
    self.navigationItem.title = @"重置密码";
    
    [_telephoneTF setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_verifyCodeTF setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];

    _getVerifyCodeBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_verifyCodeTF.bounds)-100, 0, 100,44 )];
    _getVerifyCodeBtn.layer.cornerRadius = 6;
    _getVerifyCodeBtn.clipsToBounds = YES;
    [_verifyCodeTF addSubview:_getVerifyCodeBtn];
    [_getVerifyCodeBtn setBackgroundImage:[UIImage imageNamed:@"yzm"] forState:UIControlStateNormal];
    
    [_getVerifyCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_getVerifyCodeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_getVerifyCodeBtn addTarget:self action:@selector(huoDeYZM) forControlEvents:UIControlEventTouchUpInside];

    _nextStepButton.layer.cornerRadius = 6;
    _nextStepButton.clipsToBounds = YES;
}

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

-(void)huoDeYZM{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                              target:self
                                            selector:@selector(senderShow:)
                                            userInfo:nil
                                             repeats:YES];
    _time = 60;
    [_timer fire];
    
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
