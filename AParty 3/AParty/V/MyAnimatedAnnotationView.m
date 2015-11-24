//
//  MyAnimatedAnnotationView.m
//  IphoneMapSdkDemo
//
//  Created by wzy on 14-11-27.
//  Copyright (c) 2014年 Baidu. All rights reserved.
//

#import "MyAnimatedAnnotationView.h"

@implementation MyAnimatedAnnotationView


- (id)initWithAnnotation:(id<BMKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
//        [self setBounds:CGRectMake(0.f, 0.f, 30.f, 30.f)];
        [self setBounds:CGRectMake(0.f, 0.f, 50.f, 50.f)];

        [self setBackgroundColor:[UIColor clearColor]];
        
//        _annotationImageView = [[UIImageView alloc] initWithFrame:self.bounds];
//        _annotationImageView.contentMode = UIViewContentModeCenter;
//        [self addSubview:_annotationImageView];
    }
    return self;
}

//-(void)setSelect:(BOOL)select{
//    
//    [_view removeFromSuperview];
//    
//    if (select) {
//        _view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
//        _view.center = self.center;
//        UIImageView *iv = [[UIImageView alloc]initWithFrame:_view.bounds];
//        iv.image = [UIImage imageNamed:self.highImageName];
//        [_view addSubview:iv];
//        UILabel *numLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 30, 60, 20)];
//        numLabel.textColor = [UIColor whiteColor];
//        numLabel.text = self.personNum;
//        [_view addSubview:numLabel] ;
//        UIButton *btn = [[UIButton alloc]initWithFrame:self.bounds];
//        btn.backgroundColor = [UIColor clearColor];
//        [self addSubview:btn];
//        
//        
//    } else{
//        _view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
//        _view.center = self.center;
//
//        UIImageView *iv = [[UIImageView alloc]initWithFrame:_view.bounds];
//        iv.image = [UIImage imageNamed:self.annotationImageName];
//        [_view addSubview:iv];
//        
//        
//    }
//    [self addSubview:_view];
//    
//    
//    
//    
//    
//}







//- (void)setPersonNum:(NSString *)number {
//    
////    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
//    
//    
//    [self updateImageView];
//}
//
//- (void)updateImageView {
//    if ([_annotationImageView isAnimating]) {
//        [_annotationImageView stopAnimating];
//    }
//    
////    _annotationImageView.animationImages = _annotationImages;
////    _annotationImageView.animationDuration = 0.5 * [_annotationImages count];
//    _annotationImageView.animationRepeatCount = 0;
//    [_annotationImageView startAnimating];
//}

@end
