//
//  StoryViewController.m
//  JiaJu
//
//  Created by MaSong on 2017/6/16.
//  Copyright © 2017年 MaSong. All rights reserved.
//

#import "StoryViewController.h"

@interface StoryViewController ()
@property (strong, nonatomic) UITextView *textView;
@property (strong, nonatomic) NSMutableAttributedString *content;
@end

@implementation StoryViewController

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
    
    self.title = @"故事";
    
    _content = [NSMutableAttributedString new];
    
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(5, 5, self.view.bounds.size.width - 10, self.view.bounds.size.height - 10)];
    _textView.editable = NO;
    [self.view addSubview:_textView];
   
    
    
    [self appendTextWithNewline:@"    黄家驹小时候是个顽皮的熊孩子，经常被爸爸妈妈进行棍棒教育。刑具包括各种棍子、鸡毛掸、水喉等。闯小祸是女子单打，闯大祸就是男子单打，闯了特大祸估计就是男女混合双打。"];
    [self appendImage:@"f444e198be2443ac836be912ebdc5a35_th.jpg"];
    [self appendImage:@"44fa3a6d-3f56-49e1-a973-1a7e6f07d14e.jpg"];
    
    
    [self appendTextWithNewline:@"    黄家驹从小就辩才无双，一起玩耍的小伙伴和他斗嘴、吵架永远赢不了。于是家强就更惨了，打又打不过，说又说不过！"];
    [self appendImage:@"06ab5271-4435-4958-8e1a-0d8c963e86e3.jpg"];
    [self appendImage:@"c4a28ef8-1f09-4104-af73-7660d3f9f53b.jpg"];
    
    
    [self appendTextWithNewline:@"    9岁的时候，一般小孩还处在蒙昧状态，他已经体验到了“失恋”的滋味。那时他喜欢一个从上海搬家到苏屋邨的小萝莉，就托邻居的小女孩做红娘，去问上海萝莉喜不喜欢他。邻居小女孩带话回来：上海萝莉喜欢的是他的“死敌”，并且从此不再搭理他。人生第一次表白宣告失败。三年之后，朋友告诉他，原来邻居的小女孩暗恋他好久了，做中间人时在上海萝莉面前说了许多他的坏话…"];
    [self appendImage:@"timg (7).jpeg"];
    
    
    
    [self appendTextWithNewline:@"    16岁的时候，开始了他的初恋。他的初恋情人是他的同校同学，他们每天早上都在公交站邂逅，后来托朋友介绍认识，约她去游泳、看电影，渐渐发展至单独约会。这段初恋维持了四年时间，他主动提出分手的，因为他没有稳定的收入，还沉迷音乐，很难给对方安全感。女孩本来不愿意分手，但后来认识了别的男孩，分手不到半年就闪婚了。黄家驹应该是很喜欢她的，他那么不屑情歌，却作词作曲写了一首《喜欢你》追忆那段情。"];
    [self appendImage:@"04f05e0d424540b48a3b4f00acb4e893_th.jpg"];
    
    [self appendTextWithNewline:@"    一次他去参加地下乐队，遭到主吉他手的羞辱，黄家驹回家后对弟弟黄家强说自己有了人生的第一个目标，就是弹奏得比这位乐手更出色，这件事后，他开始了勤练吉他。"];
    [self appendImage:@"4a0fefd76ab04389935bea1d9608610b_th.jpg"];
    
    
    
    [self appendTextWithNewline:@"    在黄家驹的丧礼上，有三位女性至为瞩目——除了在灵堂表现失常的林楚麒、头披黑纱的简小姐（黄家驹的前任女友）外，还有据说是黄家驹的最后一任女友——Rita。Rita是Beyond经理人公司Amuse的员工，与Beyond已相处了年多日子。对于这个“家驹女友”的身份，她却持绝对否认的态度。但经过年多的共处，他们确实建立了一份互相信任的情谊，而Rita本人又极之欣赏Beyond，所以私底下与家驹是非常好的朋友。"];
    [self appendImage:@"timg (26).jpeg"];
    [self appendImage:@"5cea4f15b5474bb5aa653867fe876989_th.jpg"];
    
    _textView.attributedText = _content;
    _textView.contentOffset = CGPointMake(0, 0);
}


@end
