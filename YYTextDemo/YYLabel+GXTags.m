//
//  YYLabel+GXTags.m
//  YYTextDemo
//
//  Created by bill on 2018/1/2.
//  Copyright © 2018年 ibireme. All rights reserved.
//

#import "YYLabel+GXTags.h"
#import "NSAttributedString+YYText.h"

@implementation YYLabel (GXTags)

-(void)addTags:(NSArray<NSString *> *)tags{
    NSMutableAttributedString * _attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    
    for(NSString * tag in tags){
        NSMutableAttributedString * _mAttributedString = [[NSMutableAttributedString alloc] initWithString:tag];
        _mAttributedString.yy_font = [UIFont systemFontOfSize:16];
        _mAttributedString.yy_color = [UIColor blueColor];
        
        YYTextBorder * _border = [YYTextBorder new];
        _border.cornerRadius = 6.0;
        _border.insets = UIEdgeInsetsMake(0, -4, 0, -4);
        _border.strokeWidth = 0.5;
        _border.strokeColor = _mAttributedString.yy_color;
        _border.lineStyle = YYTextLineStyleSingle;
        //        border.fillColor = [UIColor greenColor];
        _mAttributedString.yy_textBackgroundBorder = _border;
        //        one.yy_textBorder = border;
        
        [_attributedString appendAttributedString:[_mAttributedString copy]];
        
        NSMutableAttributedString * _spaceAttributedString = [[NSMutableAttributedString alloc] initWithString:@"    "];
        _spaceAttributedString.yy_font = [UIFont systemFontOfSize:16];
        [_attributedString appendAttributedString:[_spaceAttributedString copy]];
    }
    
    
    self.attributedText = [_attributedString copy];
}




@end
