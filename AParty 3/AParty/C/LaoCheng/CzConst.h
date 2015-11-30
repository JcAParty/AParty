//
//  Const.h
//  TianHuangTT
//
//  Created by user on 15/9/29.
//  Copyright © 2015年 czstudio. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark ----全局常量
#pragma mark ----屏幕各种尺寸
extern float const SCALE_HEAD_BAR_HEIGHT;
extern float const SCALE_BOTTOM_BAR_HEIGHT;
extern float const SCALE_BODY_MARGIN;

#pragma mark ----主界面头部
extern float const DIAMOND_START_X;
extern float const DIAMOND_START_Y;
extern float const DIAMOND_W_IN_HEAD_H;
extern float const DIAMOND_H_IN_HEAD_H;

#pragma mark ----主界面底部
extern int const BUTTON_SUM ;

#pragma mark ----页面
extern int const ADD;
extern int const REMOVE ;
extern int const LEFT ;
extern int const RIGHT;
extern int const UP ;
extern int const DOWN;

#pragma mark ----页面滑动响应

extern int const SLIDE_TYPE_NONE;
extern int const SLIDE_TYPE_MENU;
extern int const SLIDE_TYPE_REFRESH;
extern int const SLIDE_TYPE_DISTANCE;


#pragma mark ----全局变量－－开始－－－－
extern float version;
extern NSString *appSoreId;
extern float animationDuration;
extern UIViewAnimationOptions options ;
extern NSInteger *animationCurve;         // slow at beginning and end
//extern int AnimationCurve=UIViewAnimationCurveEaseIn;            // slow at beginning
//extern int AnimationCurve=UIViewAnimationCurveEaseOut;           // slow at end
//extern int AnimationCurve=UIViewAnimationCurveLinear;

extern BOOL isDebug;
//全局视图
extern UIView *upperView;

//选中的表情输入VIew
extern UIView *selectedTextView;

//滑动响应类型
extern int slideType;
#pragma mark ----尺寸
extern float screenWidth,screenHeight,statusBarHeight,menuWidth,headHeight,navBarHeight,navBarStartY,bodyStartY,bodyHeight;
extern CGRect appRect;
//extern CGRect statusBarRect,appRect,bodyContainerRect,headContainerRect;

#pragma mark ----全局BOOL变量
extern BOOL//
//isAnimation,//页面是否有动画
isHaveUpperPage,//是否存在上啦页面
isHaveFloatPage,//是否存在悬浮页面（半透明）
isForAppStore,
isFirstEnterApp;//是否安装完App后第一次进入

#pragma mark ----常用全局变量
extern int currentPageId,currentNavPageId;

#pragma mark ----常用命令缩行
#define NullExtraData [[NSMutableDictionary alloc]init]
#define FONT(a) [UIFont systemFontOfSize:a]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define CzDebug(message) [CzLibrary debugAlert:message]
#pragma mark ----全局View


#pragma mark ----地理位置
extern float currentLongitude,currentLatitude;
extern NSString *addressString;

#pragma  mark ----其他－－－－－
extern float marginZero[4];

#pragma mark ----颜色值 －－－
extern int//
COLOR_MAIN_BLUE,
COLOR_BACKGROUND_GREY,
COLOR_BACKGROUND_DARK_GREY,
COLOR_THIN_GREY,
COLOR_LIGHT_GREY ,
COLOR_HEAVEY_GREY,
COLOR_DARK_GREY,
COLOR_HINT_TEXT,
COLOR_INPUT_TEXT,
COLOR_RED_CZ,
COLOR_GREEN_CZ,
COLOR_DARK_GREEN,
COLOR_PICKER_BACK,
COLOR_FLOAT_BLACK_BACK,
COLOR_HEAD_BLACK_BACK,
COLOR_FLOAT_WHITE_BACK,
COLOR_BLACK,
COLOR_CLICK_GREY,

ENDCOLOR;

#pragma mark ------ 拍照 相关 －－－－－
extern NSString *camerCapturedFileName,
*camerCapturedFilePath;
extern UIImage *capturedOriginalImage,*imageForUpLoad;



#pragma mark ------格式对齐
extern const int ALIGNMENT_CENTER,
ALIGNMENT_LEFT,
ALIGNMENT_RIGHT;

#pragma mark ------测试常用假数据
extern  NSArray *testPicArray;
//本地数据库
extern BOOL isUpdatingDataBase;

@interface CzConst : NSObject



@end
