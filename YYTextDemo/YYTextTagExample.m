//
//  YYTextTagExample.m
//  YYKitExample
//
//  Created by ibireme on 15/8/19.
//  Copyright (c) 2015 ibireme. All rights reserved.
//

#import "YYTextTagExample.h"
#import "YYText.h"
#import "UIView+YYAdd.h"
#import "YYTextExampleHelper.h"
@import Masonry;

@interface YYTextTagExample () <YYTextViewDelegate>
@property (nonatomic, assign) YYTextView *textView;
@end

@implementation YYTextTagExample

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
//        self.automaticallyAdjustsScrollViewInsets = NO;
//    }
    
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    NSArray *tags = @[@"red12", @"orange", @"◉yellow", @"◉green", @"◉blue", @"◉purple45", @"◉gray"];
    NSArray *tagStrokeColors = @[
        UIColorHex(fa3f39),
        UIColorHex(f48f25),
        UIColorHex(f1c02c),
        UIColorHex(54bc2e),
        UIColorHex(29a9ee),
        UIColorHex(c171d8),
        UIColorHex(818e91)
    ];
    NSArray *tagFillColors = @[
        UIColorHex(fb6560),
        UIColorHex(f6a550),
        UIColorHex(f3cc56),
        UIColorHex(76c957),
        UIColorHex(53baf1),
        UIColorHex(cd8ddf),
        UIColorHex(a4a4a7)
    ];

    UIFont *font = [UIFont systemFontOfSize:14];
    for (int i = 0; i < tags.count; i++) {
        NSString *tag = tags[i];
        UIColor *tagStrokeColor = [UIColor greenColor];
        UIColor *tagFillColor = [UIColor whiteColor];
        NSMutableAttributedString *tagText = [[NSMutableAttributedString alloc] initWithString:tag];
//        [tagText yy_insertString:@"   " atIndex:0];
        [tagText yy_appendString:@"  "];
        tagText.yy_font = font;
//        tagText.yy_color = [UIColor greenColor];
        [tagText yy_setTextBinding:[YYTextBinding bindingWithDeleteConfirm:NO] range:tagText.yy_rangeOfAll];
        
        [tagText yy_setTextHighlightRange:NSMakeRange(0, tagText.length)
                                    color:[UIColor greenColor]
                          backgroundColor:[UIColor whiteColor]
                                tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
                                    NSLog(@"range:%@ rect:%@",NSStringFromRange(range),NSStringFromCGRect(rect));
//                                    NSLog(@"-----------text:%@",text);
                                    NSString * string = text.string;
                                    NSLog(@"text string:%@",[string substringWithRange:range]);
                                    
        }];
        
        YYTextBorder *border = [YYTextBorder new];
        border.strokeWidth = 0.5;
        border.strokeColor = tagStrokeColor;
        border.fillColor = tagFillColor;
        border.cornerRadius = 20; // a huge value
        border.lineJoin = kCGLineJoinBevel;
        
        border.insets = UIEdgeInsetsMake(-2, -2, -2, -2);
        [tagText yy_setTextBackgroundBorder:border range:[tagText.string rangeOfString:tag]];
        
        [text appendAttributedString:tagText];
    }
    text.yy_lineSpacing = 20;
    text.yy_lineBreakMode = NSLineBreakByWordWrapping;
    
    [text yy_appendString:@"\n"];
    [text appendAttributedString:text]; // repeat for test
    
    YYTextView *textView = [YYTextView new];
    textView.attributedText = text;
//    textView.size = CGSizeMake(self.view.size.width, 100);
    textView.textContainerInset = UIEdgeInsetsMake(10 + 64, 20, 10, 10);
    textView.allowsCopyAttributedString = NO;
    textView.allowsPasteAttributedString = NO;
    textView.selectable = NO;
    textView.editable = NO;
    
//    textView.delegate = self;
//    if (kiOS7Later) {
//        textView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
//    } else {
//        textView.height -= 64;
//    }
//    textView.scrollIndicatorInsets = textView.contentInset;
//    textView.selectedRange = NSMakeRange(text.length, 0);
    [self.view addSubview:textView];
    self.textView = textView;
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [textView becomeFirstResponder];
//    });
    
//    textView.size = CGSizeMake(300, 100);
    
    __weak typeof(self) weakSelf = self;
                  
      [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
          make.top.and.left.and.right.equalTo(weakSelf.view);
          make.height.mas_equalTo(30);
      }];
}
//
//- (void)edit:(UIBarButtonItem *)item {
//    if (_textView.isFirstResponder) {
//        [_textView resignFirstResponder];
//    } else {
//        [_textView becomeFirstResponder];
//    }
//}
//
//#pragma mark text view
//
//- (void)textViewDidBeginEditing:(YYTextView *)textView {
//    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
//                                                                                target:self
//                                                                                action:@selector(edit:)];
//    self.navigationItem.rightBarButtonItem = buttonItem;
//}
//
//- (void)textViewDidEndEditing:(YYTextView *)textView {
//    self.navigationItem.rightBarButtonItem = nil;
//}
//
//- (void)textView:(YYTextView *)textView didTapHighlight:(YYTextHighlight *)highlight inRange:(NSRange)characterRange rect:(CGRect)rect{
//    NSLog(@"rect:%@",NSStringFromCGRect(rect));
//}



@end
