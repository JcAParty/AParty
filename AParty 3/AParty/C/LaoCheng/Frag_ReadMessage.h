//
//  Frag_ReadMessage.h
//  AParty
//
//  Created by user on 15/11/24.
//  Copyright © 2015年 JConnor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CzConst.h"
#import "CzConstants.h"
#import "CzLibrary.h"

@interface Frag_ReadMessage : UIViewController
@property (nonatomic) float
mainWidth,mainHeight,
dialogStartX,dialogStartY,dialogWidth,dialogHeight,
headStartX,headStartY,headWidth,headHeight,
nameStartX,nameStartY,nameWidth,nameHeight,
messageStartX,messageStartY,messageWidth,messageHeight,
bottomStartY,bottomHeight
;

@property (nonatomic) int currentMessageId;

@property (nonatomic,strong) UIView *dialogBack,*headView;
@property (nonatomic,strong) UILabel *lb_name,*btn_left,*btn_center,*btn_right,*btn_close;
@property (nonatomic,strong) UITextView *tv_message;
@property (nonatomic,strong) NSArray *messageArray;

-(instancetype) initWithFrame:(CGRect) frame;
-(void) initMessage;
-(void) initBottom;
-(void) clickClose;
-(void) clickDialogBackView;
@end
