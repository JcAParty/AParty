//
//  PersonDetailViewController.m
//  AParty
//
//  Created by puacirl on 15/11/17.
//  Copyright © 2015年 JConnor. All rights reserved.
//
#import "BRPlaceholderTextView.h"
#import "VIPhotoView.h"
#import "PersonDetailViewController.h"
#import "PartyDetailFlowLayout.h"
#import "PersonPicCollectionViewCell.h"
@interface PersonDetailViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)UIButton *picButton;
@property(nonatomic,strong)UIButton *textButton;
@property(nonatomic,strong)UIView *footView;
@property(nonatomic,strong)UICollectionView *collectionView;


@end

@implementation PersonDetailViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"clearBG"] forBarMetrics:UIBarMetricsCompact];
    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
        NSArray *list=self.navigationController.navigationBar.subviews;
        for (id obj in list) {
            if ([obj isKindOfClass:[UIImageView class]]) {
                UIImageView *imageView=(UIImageView *)obj;
                NSArray *list2=imageView.subviews;
                for (id obj2 in list2) {
                    if ([obj2 isKindOfClass:[UIImageView class]]) {
                        UIImageView *imageView2=(UIImageView *)obj2;
                        imageView2.hidden=YES;
                    }
                }
            }
        }
    }

}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsCompact];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 2, 2)];
//    view.backgroundColor = [UIColor clearColor];
//    UIGraphicsEndImageContext();
//    
//    
//    [self.navigationController.navigationBar setBackgroundImage:[self convertViewToImage:view] forBarMetrics:UIBarMetricsCompact];

    
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,kScreenW , kScreenH*0.45)];
    [self.view addSubview:headerView];
    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, headerView.bounds.size.height)];
    iv.image = [UIImage imageNamed:@"zhanwei"];
    iv.userInteractionEnabled = YES;
    [headerView addSubview:iv];

    UILabel *sexLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(iv.frame)-66, 200, 20)];
    sexLabel.text = @"女，25岁 现居北京";
    sexLabel.textColor = [UIColor whiteColor];
    [iv addSubview:sexLabel];
    //打卡次数要不要
    UILabel *daKaNumberLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(iv.frame)-30, 200, 20)];
    daKaNumberLabel.text = @"";
    daKaNumberLabel.textColor = [UIColor whiteColor];
    [iv addSubview:daKaNumberLabel];

    UIButton *HIButton = [[UIButton alloc]initWithFrame:CGRectMake(kScreenW-60, CGRectGetMaxY(iv.frame)-50, 50, 30)];
    [HIButton setImage:[UIImage imageNamed:@"hi.png"] forState:UIControlStateNormal];
    [HIButton addTarget:self action:@selector(hiButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [iv addSubview:HIButton];
    
//    UIView *blackView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(iv.frame), kScreenW, 50)];
//    blackView.backgroundColor = APartyColor;
//    [headerView addSubview:blackView];
//    
//    _picButton = [[UIButton alloc]initWithFrame:CGRectMake(kScreenW*0.25-15, 10, 30, 30)];
//    [_picButton setImage:[UIImage imageNamed:@"picButton_normal"] forState:UIControlStateNormal];
//    [_picButton setImage:[UIImage imageNamed:@"picButton_select"] forState:UIControlStateSelected];
//    [_picButton addTarget:self action:@selector(picButtonClick) forControlEvents:UIControlEventTouchUpInside];
//    _picButton.tag = 1;
//    [blackView addSubview:_picButton];
//    
//    _textButton = [[UIButton alloc]initWithFrame:CGRectMake(kScreenW*0.75-15, 10, 30, 30)];
//    [_textButton setImage:[UIImage imageNamed:@"textButton_normal"] forState:UIControlStateNormal];
//    [_textButton setImage:[UIImage imageNamed:@"textButton_select"] forState:UIControlStateSelected];
//    [_textButton addTarget:self action:@selector(textButtonClick) forControlEvents:UIControlEventTouchUpInside];
//    _textButton.tag = 2;
//    [blackView addSubview:_textButton];
    
    _footView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(headerView.frame), kScreenW, kScreenH*0.55)];
    [self.view addSubview:_footView];
    
    _collectionView = [[UICollectionView alloc]initWithFrame:_footView.bounds collectionViewLayout:[[PartyDetailFlowLayout alloc]init]];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"PersonPicCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"Cell"];
    [_footView addSubview:_collectionView];

}
-(UIImage*)convertViewToImage:(UIView*)v{
    UIGraphicsBeginImageContext(v.bounds.size);
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

-(void)hiButtonClick{
        UIImageView *hiView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 80, (kScreenW-40), (kScreenW-40)-40)];
        hiView.image = [UIImage imageNamed:@"hiKuang"];
        hiView.userInteractionEnabled = YES;
        [self.view addSubview:hiView];
        UILabel *hiTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, hiView.bounds.size.width, 40)];
        [hiView addSubview:hiTitleLabel];
    hiTitleLabel.font = [UIFont systemFontOfSize:26];
    
        hiTitleLabel.text = @"HI";
        hiTitleLabel.textColor = [UIColor whiteColor];
        hiTitleLabel.textAlignment = NSTextAlignmentCenter;
        
        UILabel *promptTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 50, hiView.bounds.size.width-40, 20)];
        [hiView addSubview:promptTitleLabel];
        promptTitleLabel.text = @"请输入您要发送的信息";
        promptTitleLabel.font = [UIFont systemFontOfSize:20];
        promptTitleLabel.font = [UIFont systemFontOfSize:12];
        promptTitleLabel.textColor = [UIColor whiteColor];
        promptTitleLabel.textAlignment = NSTextAlignmentLeft;
        
        BRPlaceholderTextView *textView = [[BRPlaceholderTextView alloc]initWithFrame:CGRectMake(20, 90, hiView.bounds.size.width-40, 80)];
        [hiView addSubview:textView];
        textView.placeholder = @"联系我吧";
    
    
        UIImageView *iv = [[UIImageView alloc]initWithFrame:textView.bounds];
        iv.image = [UIImage imageNamed:@"textViewPatternImage"];
        
        
        textView.backgroundColor = [UIColor colorWithPatternImage:[self convertViewToImage:iv]];
        
        UIButton *sendButton = [[UIButton alloc]initWithFrame:CGRectMake(20, hiView.bounds.size.height-46, 100, 40)];
        [hiView addSubview:sendButton];
        [sendButton setImage:[UIImage imageNamed:@"sendButton"] forState:UIControlStateNormal];
        [sendButton addAction:^(UIButton *btn) {
            //send
            [self.view endEditing:YES];
            [hiView removeFromSuperview];
            
        } forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(hiView.bounds.size.width-120, hiView.bounds.size.height-46, 100, 40)];
        [hiView addSubview:cancelButton];
        [cancelButton setImage:[UIImage imageNamed:@"quxiao"] forState:UIControlStateNormal];
        [cancelButton addAction:^(UIButton *btn) {
            //cancel
            [self.view endEditing:YES];
            [hiView removeFromSuperview];
            
        } forControlEvents:UIControlEventTouchUpInside];
        
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
    return UIEdgeInsetsMake(10, (kScreenW-5*2)*0.033, 10, 0);
}
#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = APartyColor;
//    PersonDetailViewController *vc = [[PersonDetailViewController alloc]init];
//    [self.navigationController pushViewController:vc animated:YES];
    
    
    
    
    
    
    
    
    UIView *view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = APartyColor;
    [self.view.window addSubview:view];
    
    
    UIScrollView *sc = [[UIScrollView alloc]initWithFrame:CGRectMake(0, (kScreenH-kScreenW)*0.5, kScreenW, kScreenW)];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    [view addGestureRecognizer:tap];
    
    [view addSubview:sc];
    sc.delegate = self;
    sc.pagingEnabled = YES;
    sc.tag = 111;
    sc.contentSize = CGSizeMake(kScreenW*99, 0);
//create  展示的viphotoview
        UIImage *image =[UIImage imageNamed:@"zhanwei"];
        VIPhotoView *photoView = [[VIPhotoView alloc]initWithFrame:CGRectMake(kScreenW*indexPath.row, 0, kScreenW, kScreenW) andImage:image];
    sc.contentOffset = CGPointMake(kScreenW*indexPath.row, 0);
        [sc addSubview:photoView];
}
//查看大图
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.tag == 111) {
        NSInteger scrollPage = scrollView.contentOffset.x/kScreenW;
        
        
        UIImage *image =[UIImage imageNamed:@"zhanwei"];
        VIPhotoView *photoView = [[VIPhotoView alloc]initWithFrame:CGRectMake(kScreenW*scrollPage, 0, kScreenW, kScreenW) andImage:image];
        [scrollView addSubview:photoView];

    }
}

-(void)tapClick:(UITapGestureRecognizer *)tap{
    UIView *view = tap.view;
    [view removeFromSuperview];
}





//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
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
