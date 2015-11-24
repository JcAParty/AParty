//
//  MomentsViewController.m
//  
//
//  Created by JConnor on 11/11/15.
//
//

#import "MomentsViewController.h"
#import "MomentsTableViewCell.h"
#import "SendMomentViewController.h"
#import "PersonDetailViewController.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import <AVFoundation/AVFoundation.h>

@interface MomentsViewController ()<CommentCellDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *loveView;
@property(nonatomic, strong)UIImage *image;
@end

@implementation MomentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"圈子";
    self.view.backgroundColor = APartyColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.titleLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"jiuba"]];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    //未打卡
    //self.view = [[UIView alloc]initWithFrame:self.view.frame];
    //UIImageView *iv = [[UIImageView alloc]initWithFrame:self.view.frame];
    //iv.image = [UIImage imageNamed:@"weidaka"];
    //[self.view addSubview:iv];
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    UIButton *camerBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [camerBtn setImage:[UIImage imageNamed:@"camera"] forState:UIControlStateNormal];
    [camerBtn addTarget:self action:@selector(cameraClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:camerBtn];

}

#pragma navigation
-(void)cameraClick{
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
    SendMomentViewController *vc = [[SendMomentViewController alloc]init];
    
    vc.image = [info objectForKey:UIImagePickerControllerEditedImage];


    [picker dismissViewControllerAnimated:NO completion:nil];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma Tableview


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 424;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MomentsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MomentsTableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textArray = @[@"kjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjih",@"kjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjih",@"kjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfi啊啊啊"];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 555;
    return [tableView fd_heightForCellWithIdentifier:@"MomentsTableViewCell" cacheByIndexPath:nil configuration:^(MomentsTableViewCell *cell) {
        cell.textArray = @[@"kjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjih",@"kjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjih",@"kjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfihgjihkjihfaidjhfiahfihfiahgfi啊啊啊"];
    }];
    
}

#pragma commentCellDelegate
-(void)commentCell:(MomentsTableViewCell *)commentCell DidClickButtontype:(commentButtonType)btnType{
    
    switch (btnType) {
        case commentButtonTypeCommentButton:
            
            break;
        case commentButtonTypeLoveButton:
            
            break;
        case commentButtonTypePortPhoto:
        {
            PersonDetailViewController *vc = [[PersonDetailViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
           
    }
    
}

@end
