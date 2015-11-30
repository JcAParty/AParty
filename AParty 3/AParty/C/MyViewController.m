//
//  MyViewController.m
//  
//
//  Created by JConnor on 11/11/15.
//
//
#import "Masonry.h"

#import "MyViewController.h"
#import "PersonPicCollectionViewCell.h"
#import "PartyDetailFlowLayout.h"

#import "UMSocial.h"
#import "UMSocialWechatHandler.h"

#import "EditPersonInfoTableViewController.h"
#import "AboutWeViewController.h"
@interface MyViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)UIImageView *headerBackgroundIV;
@property(nonatomic,strong)UIImageView *portHeaderIV;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UIImageView *addressIV;
@property(nonatomic,strong)UILabel *addressLabel;

@property(nonatomic,strong)UIView *bottomView;
@property(nonatomic,strong)UILabel *introLabel;
@property(nonatomic,strong)UIButton *progressButton;
@property (nonatomic,strong)UICollectionView *collectionView;

@end

@implementation MyViewController
//text UMengShare
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = APartyColor;
    [self setNAV];
    
    _headerBackgroundIV = [[UIImageView alloc]init];
    [self.view addSubview:_headerBackgroundIV];
    [_headerBackgroundIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(self.view).multipliedBy(0.5);
    }];
    
    _portHeaderIV = [[UIImageView alloc]init];
    [_headerBackgroundIV addSubview:_portHeaderIV];
    [_portHeaderIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_headerBackgroundIV);
        make.centerY.equalTo(_headerBackgroundIV).offset(10);
        make.width.equalTo(@120);
        make.height.equalTo(@120);
    }];
    _portHeaderIV.layer.cornerRadius = 60;
    _portHeaderIV.clipsToBounds = YES;
    _portHeaderIV.layer.borderWidth = 2;
    _portHeaderIV.layer.borderColor = [UIColor whiteColor].CGColor;
    

    
    _nameLabel = [UILabel new];
    [_headerBackgroundIV addSubview:_nameLabel];
    _nameLabel.textColor = [UIColor whiteColor];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_portHeaderIV);
        make.top.equalTo(_portHeaderIV.mas_bottom).offset(10);
    }];
    
    _addressLabel = [UILabel new];
    [_headerBackgroundIV addSubview:_addressLabel];
    _addressLabel.textColor = [UIColor whiteColor];
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameLabel.mas_bottom).offset(5);
        make.centerX.equalTo(_portHeaderIV).offset(15);
    }];
    
    _addressIV = [UIImageView new];
    [_headerBackgroundIV addSubview:_addressIV];
    [_addressIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_addressLabel);
        make.right.equalTo(_addressLabel.mas_left).offset(-4);
        make.width.equalTo(@15);
        make.height.equalTo(@15);
    }];
    
    _headerBackgroundIV.image = [UIImage imageNamed:@"bj"];
    _portHeaderIV.image = [UIImage imageNamed:@"1"];
    _nameLabel.text = @"Name";
    _addressLabel.text = @"address";
    _addressIV.image = [UIImage imageNamed:@"dingw"];
    
    
    _bottomView = [UIView new];
    [self.view addSubview:_bottomView];
    _bottomView.backgroundColor = [UIColor clearColor];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(_headerBackgroundIV.mas_bottom);
        make.left.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
    }];
    
    _introLabel = [UILabel new];
    [_bottomView addSubview:_introLabel];
    _introLabel.textColor = [UIColor whiteColor];
    _introLabel.font = [UIFont systemFontOfSize:13];
    [_introLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_bottomView).offset(80);
        make.centerX.equalTo(_bottomView);
    }];
    
    _progressButton = [UIButton new];
    _progressButton.titleLabel.textColor = [UIColor whiteColor];
    [_progressButton setBackgroundImage:[UIImage imageNamed:@"sendBackground"] forState:UIControlStateNormal];
    [_progressButton addAction:^(UIButton *btn) {
        
        
    } forControlEvents:UIControlEventTouchUpInside];
    [_bottomView addSubview:_progressButton];
    [_progressButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_introLabel.mas_bottom).offset(10);
        make.centerX.equalTo(_bottomView);
        make.size.mas_equalTo(CGSizeMake(120, 50));
    }];
    
    
    _introLabel.text = @"您还未打卡，打卡后离店信息自动清零";
    [_progressButton setTitle:@"去打卡" forState:UIControlStateNormal];
    
    
}
//右上角设置功能
-(void)setNAV{
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 24, 24)];
    [rightBtn addAction:^(UIButton *btn) {
        UIButton *clearButton = [[UIButton alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [self.view.window addSubview:clearButton];
        [clearButton addAction:^(UIButton *btn) {
            [btn removeFromSuperview];
        } forControlEvents:UIControlEventTouchUpInside];
        
        
        
        UIView *setView = [[UIView alloc]init];
        [clearButton addSubview:setView];
        setView.backgroundColor = [UIColor blackColor];
        setView.alpha = 0.7;
        [setView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(64);
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.bottom.equalTo(_headerBackgroundIV).multipliedBy(0.9);
        }];
        
        UIButton *editBtn = [UIButton new];
        [setView addSubview:editBtn];
        [editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(setView).offset(0);
            make.left.equalTo(setView);
            make.right.equalTo(setView);
            make.height.equalTo(setView.mas_height).multipliedBy(0.25);
        }];
        editBtn.titleLabel.font = [UIFont systemFontOfSize:22];
        editBtn.titleLabel.textColor = [UIColor whiteColor];
        editBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [editBtn setTitle:@"编辑资料" forState:UIControlStateNormal];
        [editBtn addAction:^(UIButton *btn) {
            [setView removeFromSuperview];
            EditPersonInfoTableViewController *vc = [[UIStoryboard storyboardWithName:@"My" bundle:nil] instantiateViewControllerWithIdentifier:@"EditPersonInfoTableViewController"];
            [self.navigationController pushViewController:vc animated:YES];
            
        } forControlEvents:UIControlEventTouchUpInside];
        
        
        UIButton *aboutMyButton = [UIButton new];
        [setView addSubview:aboutMyButton];
        [aboutMyButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(setView.mas_centerY).offset(0);
            make.left.equalTo(setView);
            make.right.equalTo(setView);
            make.height.equalTo(setView.mas_height).multipliedBy(0.25);
        }];
        aboutMyButton.titleLabel.font = [UIFont systemFontOfSize:22];
        aboutMyButton.titleLabel.textColor = [UIColor whiteColor];
        aboutMyButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [aboutMyButton setTitle:@"关于我们" forState:UIControlStateNormal];
        [aboutMyButton addAction:^(UIButton *btn) {
            [setView removeFromSuperview];
            AboutWeViewController *vc = [[UIStoryboard storyboardWithName:@"My" bundle:nil] instantiateViewControllerWithIdentifier:@"AboutWeViewController"];
            [self.navigationController pushViewController:vc animated:YES];
            
        } forControlEvents:UIControlEventTouchUpInside];

        UIButton *shareButton = [UIButton new];
        [setView addSubview:shareButton];
        [shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(setView.mas_centerY).offset(0);
            make.left.equalTo(setView);
            make.right.equalTo(setView);
            make.height.equalTo(setView.mas_height).multipliedBy(0.25);
        }];
        shareButton.titleLabel.font = [UIFont systemFontOfSize:22];
        shareButton.titleLabel.textColor = [UIColor whiteColor];
        shareButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [shareButton setTitle:@"分享" forState:UIControlStateNormal];
        [shareButton addAction:^(UIButton *btn) {
            [setView removeFromSuperview];
            [UMSocialSnsService presentSnsIconSheetView:self
                                                 appKey:kUMAppkey
                                              shareText:@"你要分享的文字"
                                             shareImage:[UIImage imageNamed:@"bj"]
                                        shareToSnsNames:[NSArray arrayWithObjects:UMShareToWechatTimeline,UMShareToWechatSession,nil]
                                               delegate:nil];
            
        } forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *LoginOutButton = [UIButton new];
        [setView addSubview:LoginOutButton];
        [LoginOutButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(setView).offset(0);
            make.left.equalTo(setView);
            make.right.equalTo(setView);
            make.height.equalTo(setView.mas_height).multipliedBy(0.25);
        }];
        LoginOutButton.titleLabel.font = [UIFont systemFontOfSize:22];
        LoginOutButton.titleLabel.textColor = [UIColor whiteColor];
        LoginOutButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [LoginOutButton setTitle:@"注销" forState:UIControlStateNormal];
        [LoginOutButton addAction:^(UIButton *btn) {
            [setView removeFromSuperview];

            
        } forControlEvents:UIControlEventTouchUpInside];
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"function"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
//    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 24, 24)];
//    [leftBtn addAction:^(UIButton *btn) {
//        
//    } forControlEvents:UIControlEventTouchUpInside];
//    [leftBtn setBackgroundImage:[UIImage imageNamed:@"function"] forState:UIControlStateNormal];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];

    
    
    
    
    
}



-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_headerBackgroundIV.frame), kScreenW, kScreenH-CGRectGetMaxY(_headerBackgroundIV.frame)) collectionViewLayout:[[PartyDetailFlowLayout alloc]init]];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerNib:[UINib nibWithNibName:@"PersonPicCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"Cell"];
        
        
        
    }
    return _collectionView;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];

    LoginViewController *vc = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
//    [self.view addSubview:self.collectionView];
    
    
    

    
}
#pragma CollectionViewDelegate

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 222;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PersonPicCollectionViewCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.backgroundColor = APartyColor;
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((kScreenW-5*2)*0.31, (kScreenW-5*2)*0.31);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, (kScreenW-5*2)*0.03, 10, 0);
}
#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    cell.backgroundColor = APartyColor;
//    //    PersonDetailViewController *vc = [[PersonDetailViewController alloc]init];
//    //    [self.navigationController pushViewController:vc animated:YES];
//    
//    
//    
//    
//    
//    
//    
//    
//    UIView *view = [[UIView alloc]initWithFrame:self.view.window.bounds];
//    view.backgroundColor = APartyColor;
//    [self.view addSubview:view];
//    
//    
//    UIScrollView *sc = [[UIScrollView alloc]initWithFrame:CGRectMake(0, (kScreenH-kScreenW)*0.5, kScreenW, kScreenW)];
//    [view addSubview:sc];
//    sc.delegate = self;
//    sc.pagingEnabled = YES;
//    sc.tag = 111;
//    sc.contentSize = CGSizeMake(kScreenW*99, 0);
//    //create  展示的viphotoview
//    UIImage *image =[UIImage imageNamed:@"zhanwei"];
//    VIPhotoView *photoView = [[VIPhotoView alloc]initWithFrame:CGRectMake(kScreenW*indexPath.row, 0, kScreenW, kScreenW) andImage:image];
//    sc.contentOffset = CGPointMake(kScreenW*indexPath.row, 0);
//    [sc addSubview:photoView];
//}
////查看大图
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    if (scrollView.tag == 111) {
//        NSInteger scrollPage = scrollView.contentOffset.x/kScreenW;
//        
//        
//        UIImage *image =[UIImage imageNamed:@"zhanwei"];
//        VIPhotoView *photoView = [[VIPhotoView alloc]initWithFrame:CGRectMake(kScreenW*scrollPage, 0, kScreenW, kScreenW) andImage:image];
//        [scrollView addSubview:photoView];
//        
//    }
//}







//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


@end
