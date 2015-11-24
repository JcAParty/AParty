//
//  MyAnimatedAnnotationView.h
//  IphoneMapSdkDemo
//
//  Created by wzy on 14-11-27.
//  Copyright (c) 2014年 Baidu. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKMapComponent.h>

@interface MyAnimatedAnnotationView : BMKAnnotationView
@property (nonatomic, strong) UIView *view;

@property (nonatomic, strong) NSString *personNum;
@property (nonatomic, strong) NSString *annotationImageName;
@property (nonatomic, strong) NSString *highImageName;

@property (nonatomic,assign) BOOL select;
@end
