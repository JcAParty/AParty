//
//  MomentsTableViewCell.h
//  AParty
//
//  Created by puacirl on 15/11/18.
//  Copyright © 2015年 JConnor. All rights reserved.
//
typedef enum : NSUInteger {
    commentButtonTypePortPhoto,
    commentButtonTypeLoveButton,
    commentButtonTypeCommentButton,
} commentButtonType;
#import <UIKit/UIKit.h>
@class MomentsTableViewCell;
@protocol CommentCellDelegate  <NSObject>
-(void)commentCell:(MomentsTableViewCell*)commentCell DidClickButtontype:(commentButtonType)btnType;
@end

@interface MomentsTableViewCell : UITableViewCell
@property(nonatomic,weak)id <CommentCellDelegate> delegate;

@property(nonatomic,strong)NSArray *textArray;

@end
