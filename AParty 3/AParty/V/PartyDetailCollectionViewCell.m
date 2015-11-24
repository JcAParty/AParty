//
//  PartyDetailCollectionViewCell.m
//  AParty
//
//  Created by puacirl on 15/11/16.
//  Copyright © 2015年 JConnor. All rights reserved.
//

#import "PartyDetailCollectionViewCell.h"
@interface PartyDetailCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIButton *hiButton;
@end

@implementation PartyDetailCollectionViewCell

- (void)awakeFromNib {
    self.hiButton.layer.cornerRadius = 6;
    self.hiButton.clipsToBounds = YES;
}
- (IBAction)hiClick:(UIButton *)sender {
    self.hiClick(self);
}

@end
