//
//  MomentsTableViewCell.m
//  AParty
//
//  Created by puacirl on 15/11/18.
//  Copyright © 2015年 JConnor. All rights reserved.
//
#import <Masonry.h>
#import "MomentsTableViewCell.h"
@interface MomentsTableViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *portrBtn;
@property (weak, nonatomic) IBOutlet UILabel *nemeLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *photoButton;
//@property (weak, nonatomic) IBOutlet UIView *otherPersonCommentView;
@property (weak, nonatomic) IBOutlet UIView *otherView;
@property (nonatomic,strong)UILabel *label;
@property (weak, nonatomic) IBOutlet UIView *loveView;
@end

@implementation MomentsTableViewCell
- (IBAction)portButton:(UIButton *)sender {
    [self.delegate commentCell:self DidClickButtontype:commentButtonTypePortPhoto];
}
- (IBAction)loveClick:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    
    
    [self.delegate commentCell:self DidClickButtontype:commentButtonTypeLoveButton];
}
- (IBAction)commentClick:(id)sender {
    [self.delegate commentCell:self DidClickButtontype:commentButtonTypeCommentButton];
}


//-(void)layoutSubviews{
//    [super layoutSubviews];
//    for (int i = 0; i<self.textArray.count; i++) {
//        if (i==0) {
//            UILabel *label = [[UILabel alloc]init];
//            label.textColor = [UIColor whiteColor];
//
//            [self addSubview:label];
//            label.text = self.textArray[i];
//            label.numberOfLines = 0;
//            label.lineBreakMode = NSLineBreakByWordWrapping;
//            [label mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.left.equalTo(self.loveView).with.offset(10);
//                make.top.equalTo(self.loveView).offset(10);
//                make.right.equalTo(self.loveView).offset(-10);
//                
//            }];
//            _label = label;
//        } else {
//            UILabel *label = [[UILabel alloc]init];
//            label.textColor = [UIColor whiteColor];
//            [self addSubview:label];
//            label.text = self.textArray[i];
//            label.numberOfLines = 0;
//            label.lineBreakMode = NSLineBreakByWordWrapping;
//            [label mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.left.equalTo(self).with.offset(10);
//                make.top.equalTo(self.label).offset(10);
//                make.right.equalTo(self).offset(-10);
//                make.bottom.equalTo(self).offset(-10);
//            }];
//            _label = label;
//        }
//    }
//}

-(void)setTextArray:(NSArray *)textArray{
    [_otherView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    _textArray = textArray;
    
    
    
    for (int i = 0; i<self.textArray.count; i++) {
        UILabel *label = [[UILabel alloc]init];
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor redColor];
        [self.otherView addSubview:label];
        label.numberOfLines = 0;
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.translatesAutoresizingMaskIntoConstraints = NO;
  _otherView.backgroundColor = [UIColor redColor];
        if (i==0) {
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left).offset(10);
                make.top.equalTo(self.loveView.mas_bottom).offset(10);
                make.right.equalTo(self.mas_right).offset(-10);
            }];
            _label = label;
        }
            else {
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView).with.offset(10);
                make.top.equalTo(self.label.mas_bottom).offset(10);
                make.right.equalTo(self.contentView).offset(-10);
            }];
            _label = label;
        }
        label.text = self.textArray[i];
    }
    
    [_otherView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(_loveView.mas_bottom);
//        make.bottom.equalTo(self.contentView);
        make.bottom.equalTo(_label.mas_bottom);
    }];
    
}


@end
