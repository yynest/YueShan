//
//  StoreCVCell.m
//  YueShan
//
//  Created by Fedora on 2017/1/10.
//  Copyright © 2017年 opq. All rights reserved.
//

#import "StoreCVCell.h"

@implementation StoreCVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.layer.borderColor=[UIColor lightGrayColor].CGColor;
    self.layer.borderWidth=0.5;
}

@end
