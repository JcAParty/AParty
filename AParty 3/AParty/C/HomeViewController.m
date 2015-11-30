//
//  HomeViewController.m
//  
//
//  Created by JConnor on 11/11/15.
//
//
#import "SearchViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import "MyAnimatedAnnotationView.h"
#import "HomeViewController.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Map/BMKMapView.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>
#import "PartyDetailViewController.h"
#import "MyPointAnnotation.h"



@interface HomeViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate>
@property(nonatomic,strong)BMKLocationService *localManager;
@property(nonatomic,strong)BMKMapView *mapView;
@property(nonatomic,strong)BMKMapManager *mapManager;
@property(nonatomic,strong)UIImageView *alertView;
@property(nonatomic,strong)UIButton *clearButton;


@end

@implementation HomeViewController


-(void)search{
    SearchViewController *search = [[SearchViewController alloc]initWithNibName:@"SearchViewController" bundle:nil];
    [self.navigationController pushViewController:search animated:YES];
    
}

//-(void)tapclick{
//    [_alertView removeFromSuperview];
//    
//}
- (void)viewDidLoad {
        [super viewDidLoad];
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapclick)];
//    [self.view addGestureRecognizer:tap];

    self.navigationItem.title = @"AParty";
    
    
        _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [self.view addSubview:_mapView];
        [_mapView setTrafficEnabled:YES];
    _mapView.delegate = self;

//        _mapManager = [[BMKMapManager alloc]init];
//        // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
//        BOOL ret = [_mapManager start:BaiduMapAK  generalDelegate:nil];
//        if (!ret) {
//            NSLog(@"manager start failed!");
//        }
    _localManager = [[BMKLocationService alloc]init];
    _localManager.delegate = self;
    //启动LocationService
    [_localManager startUserLocationService];
    _mapView.showsUserLocation = YES;
    UIButton *locateButton = [[UIButton alloc]initWithFrame:CGRectMake(20, kScreenH-100, 30, 30)];
    [locateButton setBackgroundImage:[UIImage imageNamed:@"locationButton_normal"] forState:UIControlStateNormal];
    [locateButton addTarget:self action:@selector(locationClick) forControlEvents:UIControlEventTouchUpInside];
     [locateButton setBackgroundImage:[UIImage imageNamed:@"locationButton"] forState:UIControlStateHighlighted];
    [_mapView addSubview:locateButton];
    
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
//    [self.view addGestureRecognizer:tap];
    
}

//-(void)tapClick:(UITapGestureRecognizer *)tap{
//    
//       if (self.alertView&&[tap.view isEqual:_mapView]) {
//        [self.alertView removeFromSuperview];
//           self.alertView = nil;
//
//    }
//}






 - (void) viewDidAppear:(BOOL)animated {
     [super viewDidAppear:YES];
     _mapView.showMapScaleBar = YES;
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(search)];

 // 添加一个PointAnnotation
 
     MyPointAnnotation* annotation = [[MyPointAnnotation alloc]init];
//     annotation.highLight = NO;
     annotation.type = 1;
     CLLocationCoordinate2D coor;
     coor.latitude = 39.915;
     coor.longitude = 116.404;
     annotation.coordinate = coor;
     annotation.title = @" ";
     [_mapView addAnnotation:annotation];
 }
 // Override

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(MyPointAnnotation <BMKAnnotation>*)annotation
 {
     if ([annotation isKindOfClass:[MyPointAnnotation class]]) {
//         BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
//         newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
         MyAnimatedAnnotationView *myView = [[MyAnimatedAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];

         if (annotation.type == 1) {
              myView.image = [UIImage imageNamed:@"dibiao"];
         }else if (annotation.type == 2){
             UIView *imageView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 180, 180)];
             UIImageView *iv = [[UIImageView alloc]initWithFrame:imageView.bounds];
             iv.image = [UIImage imageNamed:@"dibiaokuang.png"];
             [imageView addSubview:iv];
             
             UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 30, 140, 30)];
             nameLabel.text = @"夜店名";
             nameLabel.font = [UIFont systemFontOfSize:32];
             nameLabel.textAlignment = UIViewContentModeCenter;
             nameLabel.textColor = [UIColor whiteColor];
             [imageView addSubview:nameLabel];
             
             UILabel *numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 70, 140, 30)];
             numberLabel.text = @"1234人";
             numberLabel.font = [UIFont systemFontOfSize:28];
             numberLabel.textAlignment = UIViewContentModeCenter;
             numberLabel.textColor = [UIColor whiteColor];
             
             [imageView addSubview:numberLabel];
             
             UILabel *daKaLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 110, 140, 30)];
             daKaLabel.text = @"可打卡";
             daKaLabel.font = [UIFont systemFontOfSize:28];
             daKaLabel.textAlignment = UIViewContentModeCenter;
             daKaLabel.textColor = [UIColor whiteColor];
             [imageView addSubview:daKaLabel];
             myView.image = [self convertViewToImage:imageView];
             
         }
         return myView;
 }
 return nil;
}
 
-(UIImage*)convertViewToImage:(UIView*)v{
    
    
    
    UIGraphicsBeginImageContext(v.bounds.size);
    
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}

-(void)pressBarBtn:(id)sender
{
    SearchViewController * hsVC = [[SearchViewController alloc]init];
    [self.navigationController pushViewController:hsVC animated:YES];
}
-(void)clearButtonClick:(UIButton*)btn{
    [btn removeFromSuperview];
}
-(void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view{
    [mapView deselectAnnotation:view.annotation animated:NO];

    _clearButton = [[UIButton alloc]initWithFrame:self.view.frame];
    [self.view addSubview:_clearButton];
    [_clearButton addTarget:self action:@selector(clearButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    BMKPointAnnotation *ann = view.annotation;
    if (![ann isMemberOfClass:[MyPointAnnotation class]]) {
        return;
    }
    
    _alertView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    _alertView.center = self.view.center;
    _alertView.image = [UIImage imageNamed:@"kuang1.png"];
    _alertView.userInteractionEnabled = YES;
    UIButton *partyNameLabel = [[UIButton alloc]initWithFrame:CGRectMake(15, 94, 270, 30)];
    [partyNameLabel setBackgroundImage:[UIImage imageNamed:@"dingweikuang.png"] forState:UIControlStateNormal];
    [partyNameLabel setTitle:@"party Name" forState:UIControlStateNormal];
    partyNameLabel.contentHorizontalAlignment = UIViewContentModeCenter;
    
//    partyNameLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dingweikuang1.png"]];
//    partyNameLabel.text = @"party NAme";
//    partyNameLabel.textAlignment = NSTextAlignmentCenter;
//    partyNameLabel.textColor = [UIColor whiteColor];
    [_alertView addSubview:partyNameLabel];
    
    UIButton *sureBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 190, 60, 25)];
    [sureBtn setBackgroundImage:[UIImage imageNamed:@"queding.png"] forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(sureclick) forControlEvents:UIControlEventTouchUpInside];
    [_alertView addSubview:sureBtn];
    
    UIButton *cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(220, 190, 60, 25)];
    [cancelBtn setBackgroundImage:[UIImage imageNamed:@"quxiao.png"] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancelclick) forControlEvents:UIControlEventTouchUpInside];
    [_alertView addSubview:cancelBtn];

    [_clearButton addSubview:_alertView];
    
}


-(void)sureclick{
    [_clearButton removeFromSuperview];
    PartyDetailViewController *vc = [[PartyDetailViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];

}

-(void)cancelclick{
    [_clearButton removeFromSuperview];

}

- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    
    
    
    
    NSArray *array = self.mapView.annotations;
    for (MyPointAnnotation *pointAnn in array) {
        
        BOOL ptInCircle = BMKCircleContainsCoordinate(userLocation.location.coordinate,pointAnn.coordinate , 50000);
        if (ptInCircle) {
            pointAnn.type = 2;
            BMKAnnotationView *annView = [_mapView viewForAnnotation:pointAnn];
            UIView *imageView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 180, 180)];
            UIImageView *iv = [[UIImageView alloc]initWithFrame:imageView.bounds];
            iv.image = [UIImage imageNamed:@"dibiaokuang.png"];
            [imageView addSubview:iv];
            
            UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 30, 140, 30)];
            nameLabel.text = @"夜店名";
            nameLabel.font = [UIFont systemFontOfSize:32];
            nameLabel.textAlignment = UIViewContentModeCenter;
            nameLabel.textColor = [UIColor whiteColor];
            [imageView addSubview:nameLabel];
            
            UILabel *numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 70, 140, 30)];
            numberLabel.text = @"1234人";
            numberLabel.font = [UIFont systemFontOfSize:28];
            numberLabel.textAlignment = UIViewContentModeCenter;
            numberLabel.textColor = [UIColor whiteColor];
            
            [imageView addSubview:numberLabel];
            
            UILabel *daKaLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 110, 140, 30)];
            daKaLabel.text = @"可打卡";
            daKaLabel.font = [UIFont systemFontOfSize:28];
            daKaLabel.textAlignment = UIViewContentModeCenter;
            daKaLabel.textColor = [UIColor whiteColor];
            [imageView addSubview:daKaLabel];
            annView.image = [self convertViewToImage:imageView];
        }else{
            pointAnn.type = 1;
        BMKAnnotationView *annView = [_mapView viewForAnnotation:pointAnn];
        annView.image = [UIImage imageNamed:@"dibiao"];
        }
    }
    
}


-(void)locationClick{
    [_mapView updateLocationData:_localManager.userLocation];
    _mapView.centerCoordinate = _localManager.userLocation.location.coordinate;
    
    CLLocationCoordinate2D loc = [_localManager.userLocation.location coordinate];
    //放大地图到自身的经纬度位置。
    BMKCoordinateRegion viewRegion = BMKCoordinateRegionMake(loc, BMKCoordinateSpanMake(0.02f,0.02f));
    BMKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];
    [_mapView setRegion:adjustedRegion animated:YES];
    

    
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
