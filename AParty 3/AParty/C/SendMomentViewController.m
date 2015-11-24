//
//  SendMomentViewController.m
//  AParty
//
//  Created by puacirl on 15/11/18.
//  Copyright © 2015年 JConnor. All rights reserved.
//

#import "SendMomentViewController.h"
#import "BRPlaceholderTextView.h"
@interface SendMomentViewController ()
@property(nonatomic,strong)BRPlaceholderTextView *textField;
@end

@implementation SendMomentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = APartyColor;
    [self setUpNavi];
    self.textField = [[BRPlaceholderTextView alloc]initWithFrame:CGRectMake(0, 84, kScreenW, 80)];
    _textField.placeholder = @"请输入要发送的文字";
    _textField.backgroundColor = APartyColor;
    
    self.iv = [[UIImageView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.textField.frame)+40, kScreenW-40, kScreenW-40)];
    self.iv.image = self.image;
    [self.view addSubview:self.iv];
    [self.view addSubview:self.textField];


}

-(void)setUpNavi{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonClick)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(leftButtonClick)];
    
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 44)];
    UILabel *sendMomentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 30)];
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, 60, 14)];
    nameLabel.font = [UIFont systemFontOfSize:13];
    sendMomentLabel.textColor = [UIColor whiteColor];
    nameLabel.textColor = [UIColor whiteColor];
    [titleView addSubview:sendMomentLabel];
    [titleView addSubview:nameLabel];
    
    sendMomentLabel.text = @"发圈子";
    nameLabel.text = @"wendy";
    
    self.navigationItem.titleView = titleView;
    
}

-(void)rightButtonClick{
    [self.view endEditing:YES];
}

-(void)leftButtonClick{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
