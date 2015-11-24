//
//  BarInfoViewController.m
//  
//
//  Created by JConnor on 11/16/15.
//
//

#import "BarInfoViewController.h"
#import "PartyDetailTableViewCell.h"
@interface BarInfoViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation BarInfoViewController
-(void)createScrollView
{
   
    UIScrollView * scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,(kScreenH-64-39)*0.6)];
    scroll.bounces = NO;
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.showsVerticalScrollIndicator = NO;
//    scroll.contentSize = CGSizeMake(self.view.frame.size.width*5 , 0);
    for(int i = 0;i<7;i++)
    {
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width * i, 0, self.view.frame.size.width, (kScreenH-64-39)*0.6)];
        NSString * path = nil;
        if(i == 0)
        {
            path = [[NSBundle mainBundle] pathForResource:@"5" ofType:@"png"];
        }
        else if (i == 6)
        {
            path = [[NSBundle mainBundle]pathForResource:@"1" ofType:@"png"];
        }
        else
        {
            path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d",i] ofType:@"png"];
        }
        
        UIImage * image = [UIImage imageWithContentsOfFile:path];
        imageView.image = image;
        
        //添加视图
        [scroll addSubview:imageView];
    }
    
    //滚动视图上内容视图的大小
    scroll.contentSize = CGSizeMake(self.view.frame.size.width * 5, 0);
    
    //视图的偏移位置
    scroll.contentOffset = CGPointMake(self.view.frame.size.width, 0);
    
    scroll.delegate = self;
    
    scroll.pagingEnabled = YES;
    
    [self.view addSubview:scroll];
    
    UIView *transparentView= [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(scroll.frame)-40, kScreenW, 40)];
    [self.view addSubview:transparentView];
    transparentView.backgroundColor = APartyColor;
    transparentView.alpha = 0.7;
    
    UILabel *introduceLabel = [[UILabel alloc]initWithFrame:transparentView.bounds];
    [transparentView addSubview:introduceLabel];
    introduceLabel.font = [UIFont systemFontOfSize:12];
    introduceLabel.textColor = [UIColor whiteColor];
    introduceLabel.numberOfLines = 0;
    introduceLabel.text = @"party介绍party介绍party介绍party介绍party介绍party介绍party介绍party介绍party介绍party介绍party介绍party介绍party介绍party介绍party介绍party介绍party介绍party介绍party介绍party介绍party介绍party介绍party介绍";
    
    
    
    
}
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    // 倒是根据需求要几张图片再说
//    if(scrollView.contentOffset.x == 0)
//    {
//        scrollView.contentOffset = CGPointMake(5 * self.view.frame.size.width/2.5, 0);
//    }
//    else if (scrollView.contentOffset.x == 6 * self.view.frame.size.width)
//    {
//        scrollView.contentOffset = CGPointMake(self.view.frame.size.width, 0);
//    }
//}
-(UIView *)createHeaderView{

    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW , 70)];
    UIImageView *iconIv = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
    iconIv.image = [UIImage imageNamed:@"zhanwei"];
    [headerView addSubview:iconIv];
    iconIv.layer.cornerRadius = iconIv.bounds.size.width*0.5;
    iconIv.clipsToBounds = YES;
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(iconIv.frame)+10, 15, 200, 20)];
    nameLabel.text = @"夜店名jidis";
    nameLabel.textColor = [UIColor whiteColor];
    [headerView addSubview:nameLabel];
    
    UILabel *numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(iconIv.frame)+10, 35, 200, 20)];
    numberLabel.text = @"打卡1233次";
    numberLabel.textColor = [UIColor whiteColor];
    [headerView addSubview:numberLabel];

    
    
    
    
    return headerView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createScrollView];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, (kScreenH-64-39)*0.6, self.view.bounds.size.width, (kScreenH-64-39)*0.4+64) ];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    _tableView.backgroundColor = APartyColor;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.tableHeaderView = [self createHeaderView];
    _tableView.tableFooterView = [UIView new];
    _tableView.backgroundColor = APartyColor;
    _tableView.rowHeight = 70;
}
#pragma tableviewDatasource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PartyDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"PartyDetailTableViewCell" owner:self options:nil][0];
    }
    
    cell.label1.text = @"活动详情：";
    cell.label2.text = @"活动内容";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
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
