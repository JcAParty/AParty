//
//  ItemForMessageVC.h
//  AParty
//
//  Created by user on 15/11/24.
//  Copyright © 2015年 JConnor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CzLibrary.h"
#import "CzConstants.h"

@interface ItemForMessageVC :UIViewController
@property (nonatomic) float mainWidth,mainHeight,
leftPhotoStartX,leftPhotoWidth,
centerStartX,centerWidth,
rightStartX,rightWidth,
basicTextSize;

@property (nonatomic,strong) UIView *vw_leftHead;
@property (nonatomic,strong) UILabel *lb_name,*lb_time,*lb_messageCount,*lb_btnCheck;

@property (nonatomic) int pinkColor;

-(instancetype) initWithFrame:(CGRect) frame;

@end
