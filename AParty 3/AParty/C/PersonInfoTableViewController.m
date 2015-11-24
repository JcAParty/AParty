//
//  PersonInfoTableViewController.m
//  AParty
//
//  Created by puacirl on 15/11/17.
//  Copyright © 2015年 JConnor. All rights reserved.
//

#import "PersonInfoTableViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface PersonInfoTableViewController ()<UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *portraitButton;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *yearsTF;
@property (weak, nonatomic) IBOutlet UITextField *sexTF;
@property (strong, nonatomic) UIPickerView *sexPickerView;
@property (strong, nonatomic) UIPickerView *agePickserView;

@end

@implementation PersonInfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = APartyColor;
    
    [_nameTF setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_yearsTF setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_sexTF setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapclick)];
    [self.view addGestureRecognizer:tap];
    
    self.tableView.tableFooterView = [UIView new];
    _portraitButton.layer.cornerRadius = _portraitButton.bounds.size.width*0.5;
    _portraitButton.clipsToBounds = YES;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveRightBarClick)];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _sexPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    _sexPickerView.dataSource = self;
    _sexPickerView.delegate = self;
    _sexTF.inputView = _sexPickerView;
    
    _agePickserView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    _agePickserView.dataSource = self;
    _agePickserView.delegate = self;
    _yearsTF.inputView = _agePickserView;

    
}

-(void)tapclick{
    [self.view endEditing:YES];
}

-(void)saveRightBarClick{
    [self.view endEditing:YES];

    
}

//#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (pickerView == _sexPickerView) {
        return 2;
    } else {
        return 80;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (pickerView == _sexPickerView) {
        return @[@"男", @"女"][row];
    } else {
        return [NSString stringWithFormat:@"%zd岁", row + 1];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (pickerView == _sexPickerView) {
        _sexTF.text = @[@"男", @"女"][row];
    } else {
//        _age = row + 1;
        _yearsTF.text = [NSString stringWithFormat:@"%zd岁", row + 1];
    }
}

- (IBAction)profileIV:(UIButton *)sender {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择图片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * gallerySelectAction = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:imagePickerController animated:YES completion:nil];

    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];

    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        UIAlertAction *photoSelectAction =  [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
            if(status == AVAuthorizationStatusAuthorized) {
                // authorized
                [self presentViewController:imagePickerController animated:YES completion:nil];
            } else if(status == AVAuthorizationStatusDenied){
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                message:@"请在设备的\"设置-隐私-相机\"中允许访问相机。"
                                                               delegate:self
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles:nil];
                [alert show];
                return ;
            } else if(status == AVAuthorizationStatusRestricted){
                NSLog(@"Restricted");
            } else if(status == AVAuthorizationStatusNotDetermined){
                // not determined
                [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                    if(granted){
                        [self presentViewController:imagePickerController animated:YES completion:nil];
                    } else {
                        return;
                    }
                }];
            }
        }];
        [alert addAction:photoSelectAction];
    }
    [alert addAction:gallerySelectAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    [self.portraitButton setBackgroundImage:image forState:UIControlStateNormal];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
}

@end
