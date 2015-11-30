//
//  CzConst.h
//  AParty
//
//  Created by user on 15/11/24.
//  Copyright © 2015年 JConnor. All rights reserved.
//

#import <Foundation/Foundation.h>

static const NSString//
*SERVER_PATH=@"http://www.aprty.com/api",
*INTERFACE_GET_MESSAGE=@"/get_message";

extern const int COLOR_PINK;
extern const int COLOR_ITEM_BACK;
extern const int COLOR_APARTY;

extern NSString *headTip;
extern NSMutableDictionary *selectMessageItemDictionary;
@interface CzConstants : NSObject
+(NSArray*) getTestPicArray;
@end
