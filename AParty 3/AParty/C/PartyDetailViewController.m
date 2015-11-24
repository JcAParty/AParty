//
//  PartyDetailViewController.m
//  AParty
//
//  Created by puacirl on 15/11/16.
//  Copyright © 2015年 JConnor. All rights reserved.
//
#import "BRPlaceholderTextView.h"
#import "BarInfoViewController.h"
#import "PartyDetailViewController.h"
#import "PartyDetailCollectionViewCell.h"
#import "PartyDetailFlowLayout.h"
#import "PersonDetailViewController.h"
@interface PartyDetailViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;
@property (weak, nonatomic) IBOutlet UILabel *partyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *daKanumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *partyDetailLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation PartyDetailViewController
- (IBAction)partyDetailButtonClick:(id)sender {
    BarInfoViewController *vc = [[BarInfoViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = APartyColor;
    _imageIcon.layer.cornerRadius = _imageIcon.bounds.size.width*0.5;
    _imageIcon.clipsToBounds = YES;
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"PartyDetailCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"reuseCell"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.collectionViewLayout= [[PartyDetailFlowLayout alloc]init];
    
    
    
}

#pragma collection datasource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 222;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PartyDetailCollectionViewCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"reuseCell" forIndexPath:indexPath];
    
    cell.hiClick = ^(PartyDetailCollectionViewCell *partyCell){
        
        UIImageView *hiView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 80, (kScreenW-40), (kScreenW-40)-40)];
        hiView.image = [UIImage imageNamed:@"hiKuang"];
        hiView.userInteractionEnabled = YES;
        [self.view addSubview:hiView];
        UILabel *hiTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, hiView.bounds.size.width, 40)];
        [hiView addSubview:hiTitleLabel];
        hiTitleLabel.text = @"HI";
        hiTitleLabel.textColor = [UIColor whiteColor];
        hiTitleLabel.textAlignment = NSTextAlignmentCenter;
        
        UILabel *promptTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 50, hiView.bounds.size.width-40, 20)];
        [hiView addSubview:promptTitleLabel];
        promptTitleLabel.text = @"请输入您要发送的信息";
        promptTitleLabel.font = [UIFont systemFontOfSize:12];
        promptTitleLabel.textColor = [UIColor whiteColor];
        promptTitleLabel.textAlignment = NSTextAlignmentLeft;
        
        BRPlaceholderTextView *textView = [[BRPlaceholderTextView alloc]initWithFrame:CGRectMake(20, 90, hiView.bounds.size.width-40, 60)];
        [hiView addSubview:textView];
        textView.placeholder = @"请输入要发送的信息";
        
        
        UIImageView *iv = [[UIImageView alloc]initWithFrame:textView.bounds];
        iv.image = [UIImage imageNamed:@"textViewPatternImage"];
        
        
        textView.backgroundColor = [UIColor colorWithPatternImage:[self convertViewToImage:iv]];
        
        UIButton *sendButton = [[UIButton alloc]initWithFrame:CGRectMake(20, hiView.bounds.size.height-46, 60, 25)];
        [hiView addSubview:sendButton];
        [sendButton setImage:[UIImage imageNamed:@"sendButton"] forState:UIControlStateNormal];
        [sendButton addAction:^(UIButton *btn) {
            //send
            [self.view endEditing:YES];
            [hiView removeFromSuperview];
            
        } forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(hiView.bounds.size.width-80, hiView.bounds.size.height-46, 60, 25)];
        [hiView addSubview:cancelButton];
        [cancelButton setImage:[UIImage imageNamed:@"quxiao"] forState:UIControlStateNormal];
        [cancelButton addAction:^(UIButton *btn) {
            //cancel
            [self.view endEditing:YES];
            [hiView removeFromSuperview];

        } forControlEvents:UIControlEventTouchUpInside];
        
        
    };
    return cell;
    
}


-(UIImage*)convertViewToImage:(UIView*)v{
    
    
    
    UIGraphicsBeginImageContext(v.bounds.size);
    
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}





- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((kScreenW-5*1)*0.47, 190);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, (kScreenW-5*1)*0.03, 10, 0);
}
#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = APartyColor;
    PersonDetailViewController *vc = [[PersonDetailViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


@end
