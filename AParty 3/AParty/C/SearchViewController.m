//
//  SearchViewController.m
//  AParty
//
//  Created by puacirl on 15/11/13.
//  Copyright © 2015年 JConnor. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *searchTF;
@property (weak, nonatomic) IBOutlet UIView *historyView;
@property (weak, nonatomic) IBOutlet UIView *hotView;

@end

@implementation SearchViewController
//是取消啊，注意
- (IBAction)search:(id)sender {
    //是取消啊，注意
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = APartyColor;
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
//                                                                             style:UIBarButtonItemStylePlain
//                                                                            target:nil
//                                                                            action:nil];

    
    _searchTF.returnKeyType = UIReturnKeySearch;
    _searchTF.delegate = self;
    
    NSArray *array = @[@"酒吧酒吧1号",@"酒吧酒吧1号",@"酒吧酒吧1号",@"酒吧酒吧1号",@"酒吧酒吧1号"];

    for (int i = 0; i<array.count; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake((i%3)*(self.view.bounds.size.width/3),-40+(i/3)*(self.historyView.bounds.size.height-30)/2, self.historyView.bounds.size.width/3, self.historyView.bounds.size.width/2)];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [btn setTitle:array[i] forState:UIControlStateNormal];
        btn.contentMode = UIViewContentModeCenter;
        btn.titleLabel.textAlignment = UIViewContentModeCenter;
        [_historyView addSubview:btn];
    }

}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
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
