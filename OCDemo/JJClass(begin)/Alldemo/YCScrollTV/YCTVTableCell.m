//
//  YCTVTableCell.m
//  OCDemo
//
//  Created by yangchang on 2019/5/29.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "YCTVTableCell.h"


@interface YCTVTableCell ()

@property (nonatomic,strong) UILabel *label;

@end

@implementation YCTVTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // insert here
        _label = [[UILabel alloc] init];
        [self.contentView addSubview:_label];
    }return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat w = self.contentView.bounds.size.width;
    CGFloat h = self.contentView.bounds.size.height;
    // insert here
    _label.frame = CGRectMake(0, 0, w, h);
}

//- (void)refreshUI:(id)model;
- (void)refreshUI:(id)model{
    _label.text = model;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
