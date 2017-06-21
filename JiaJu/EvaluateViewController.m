//
//  EvaluateViewController.m
//  JiaJu
//
//  Created by MaSong on 2017/6/16.
//  Copyright © 2017年 MaSong. All rights reserved.
//

#import "EvaluateViewController.h"

@interface EvaluateViewController ()
@property (strong, nonatomic) UITextView *textView;
@property (strong, nonatomic) NSMutableAttributedString *content;
@end

@implementation EvaluateViewController

- (NSAttributedString *)withString:(NSString *)text{
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 10;// 字体的行间距
    UIFont *font = [UIFont systemFontOfSize:16];
    UIColor *textColor = [UIColor lightGrayColor];
    NSDictionary *attributes = @{
                                 NSFontAttributeName: font,
                                 NSParagraphStyleAttributeName:paragraphStyle,
                                 NSForegroundColorAttributeName: textColor
                                 };
    
    return [[NSMutableAttributedString alloc]initWithString:text attributes:attributes];
}

- (NSAttributedString *)withImage:(NSString *)imageName{
    
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image = [UIImage imageNamed:imageName];
    CGFloat oldWidth = textAttachment.image.size.width;
    CGFloat scaleFactor = oldWidth / (_textView.frame.size.width - 20);
    textAttachment.image = [UIImage imageWithCGImage:textAttachment.image.CGImage scale:scaleFactor orientation:UIImageOrientationUp];
    
    return [NSAttributedString attributedStringWithAttachment:textAttachment];
}

- (void)appendText:(NSString *)text{
    [_content appendAttributedString:[self withString:text]];
}

- (void)appendTextWithNewline:(NSString *)text{
    [_content appendAttributedString:[self withString:text]];
    [self appendText:@"\n"];
}

- (void)appendImage:(NSString *)imageName{
    [_content appendAttributedString:[self withImage:imageName]];
    [self appendText:@"\n"];
    [self appendText:@"\n"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"评价";
    
    _content = [NSMutableAttributedString new];
    
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(5, 5, self.view.bounds.size.width - 10, self.view.bounds.size.height - 10)];
    _textView.editable = NO;
    [self.view addSubview:_textView];
    
    
    [self appendImage:@"timg (27).jpeg"];
    [self appendTextWithNewline:@"    黄家驹的出身其实很普通，既非大富之家亦没有艺术氛围，完全是因为对音乐的极度热爱。纵观黄家驹的作品与人生，你会发现有一种种雄浑的力量贯穿始终。虽然他亦不乏细腻的情歌和手法前卫的作品，但试图用音乐的语言去表达种种人生的意义，这似乎成了他一生的责任."];
    [self appendImage:@"timg (28).jpeg"];
    [self appendTextWithNewline:@"    黄家驹的作品中，更多的是感恩、抚慰、和平和励志的元素，黄家驹是在唱灵魂和心灵的歌，在唱那些小人物的歌。他在用歌声捍卫和平，用音符关爱世界。"];
    [self appendImage:@"timg (30).jpeg"];
    [self appendTextWithNewline:@"    黄家驹的一生，始终都像是在圆一个音乐梦。在纷杂的演艺圈里，很少有传出关于BEYOND的负面新闻与个人的绯闻轶事。而歌迷心目中的黄家驹除了是位全才型的歌手外，根本没有任何花边新闻。90年代初的创作对他来讲亦是一次重要转折。BEYOND成员的非洲之行，使他看到了这片饥荒大地上的人与事，战争与和平，压迫与反抗，无奈与泪痕。他回港后一曲《amani》，在倾诉饱受战火蹂躏的儿童的同时，亦指出了生命的尊严与可贵；而《光辉岁月》是专为黑人领袖曼德拉而作，在颂扬曼氏的同时，亦折射出人类大同的趋势与战争的愚昧。"];
    [self appendImage:@"timg (31).jpeg"];
    [self appendTextWithNewline:@"    黄家驹生前最后一张BEYOND的作品辑《乐与怒》，更是达到了他创作生命的颠峰。主打曲《海阔天空》表达了一种浑然忘我而又似人海孤鸿的境界，多年的追求，多少心事与梦幻，多少爱意与天真，在这红尘世上穿梭。此歌既是他的内心写照又是孤身寻梦人的生命符号"];
    [self appendImage:@"timg (29).jpeg"];
    
    _textView.attributedText = _content;
    _textView.contentOffset = CGPointMake(0, 0);
    
}


@end
