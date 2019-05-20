//
//  JJTableViewCell.m
//  OCDemo
//
//  Created by yangchang on 2019/5/18.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "JJTableViewCell.h"


@interface JJTableViewCell ()

@property (nonatomic,strong) UIImageView *img;
@property (nonatomic,strong) UILabel *label;

@end

@implementation JJTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // insert here
        self.selectionStyle = 0;
        
        _img = [YCUI ui_imageView:CGRectZero fileName:@""];
        _img.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_img];
        
        _label = [YCUI ui_label:CGRectZero lines:1 align:NSTextAlignmentLeft font:[UIFont systemFontOfSize:17] textColor:[UIColor redColor] text:@""];
        [self.contentView addSubview:_label];
        
        _bottomLine = [YCUI ui_view:CGRectZero backgroundColor:[UIColor lightGrayColor] alpha:0.1 cornerRadius:0 borderWidth:0 borderColor:nil];
        [self.contentView addSubview:_bottomLine];
        
    }return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat w = self.contentView.bounds.size.width;
    CGFloat h = self.contentView.bounds.size.height;
    // insert here
    
    self.bottomLine.frame = CGRectMake(12, h-1, w,1);
    
    _img.frame = CGRectMake(0, 0, 40,40);
    _img.center = CGPointMake(12 + _img.Width * 0.5, h * 0.5);
    
    _label.frame = CGRectMake(_img.MaxX + 4, _img.center.y - 21 * 0.5, w - _img.MaxX - 4, 21);
}

- (void)refreshUI:(JJTModel *)model{
    [_img sd_setImageWithURL:[NSURL URLWithString:model.url]];
    _label.text = model.title;
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
