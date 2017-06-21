//
//  LifetimeViewController.m
//  JiaJu
//
//  Created by MaSong on 2017/6/16.
//  Copyright © 2017年 MaSong. All rights reserved.
//

#import "LifetimeViewController.h"
@interface LifetimeViewController ()
@property (strong, nonatomic) UITextView *textView;
@property (strong, nonatomic) NSMutableAttributedString *content;
@end

@implementation LifetimeViewController

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
    
    self.title = @"一生不羁放纵爱自由";
    
    _content = [NSMutableAttributedString new];
    
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(5, 5, self.view.bounds.size.width - 10, self.view.bounds.size.height - 10)];
    _textView.editable = NO;
    [self.view addSubview:_textView];
    
    
    [self appendTextWithNewline:@"    \"原谅我这一生不羁放纵爱自由……\""];
    [self appendImage:@"20170614163220_f618f646242eef63b9aabf9a06508d72_1.png"];
    [self appendText:@"\n"];
    
    [self appendTextWithNewline:@"    1962年6月10日出生，自小与家人居住在九龙深水埗区苏屋邨一个不到三十平方米的小单位,属于真正的草根阶层。家里一共5个兄弟姐妹，他有两个姐姐、一个哥哥和一个弟弟，弟弟是Beyond乐队低音吉他手黄家强。中学毕业后，做过办公室助理、电视台布景员、推销员等。17岁时，黄家驹在邻居搬家的时候捡来了一把木吉他，这把木吉他是他的第一件乐器。"];
    [self appendImage:@"20170614163220_f618f646242eef63b9aabf9a06508d72_2.png"];
    [self appendImage:@"ba29755773574d6ba8666da878dc917a_th.jpg"];
    [self appendImage:@"3478c01a5a6d4c138c7a3d23500f82e0_th.jpg"];
    [self appendImage:@"f444e198be2443ac836be912ebdc5a35_th.jpg"];
    [self appendImage:@"1d76d421a6704a35ae5fc0c923592f08_th.jpg"];
    [self appendImage:@"timg (3).jpeg"];
    [self appendImage:@"timg (5).jpeg"];
    [self appendImage:@"timg (6).jpeg"];
    [self appendImage:@"timg (8).jpeg"];
    
    
    
    [self appendTextWithNewline:@"    1980年，黄家驹经琴行老板介绍认识叶世荣，彼此音乐兴趣相近，故联同两位朋友邓炜谦及李荣潮组成乐队，这支乐队也是Beyond的雏型。Beyond这个名字是第一代主音吉他手邓炜谦所改，意思是“超越”，叶世荣曾说：“取名Beyond不是要超越别人，而是要超越自己。”"];
    [self appendImage:@"timg(10).jpeg"];
    
    
    [self appendTextWithNewline:@"    1983年，Beyond正式组建，黄家驹担任乐队主唱；经过几次人事变动后，1983年底，黄家驹的弟弟黄家强加入成为低音吉他手。"];
    [self appendImage:@"timg (15).jpeg"];
    
    
    
    [self appendTextWithNewline:@"    1984年，Beyond除了参与一些乐队的演出外，开始尝试写更多的音乐作品。香港的一家唱片公司集合了一些地下乐队灌录了一张名为《香港》的唱片，其中收录了Beyond的两首英文原创歌曲。"];
    [self appendImage:@"xianggang.jpg"];
    
    
     [self appendTextWithNewline:@"    1985年，主音吉他手黄贯中加入。"];
     [self appendImage:@"1b4c510fd9f9d72aa5d8a0e8d12a2834359bbb83.jpg"];
    
    
     [self appendTextWithNewline:@"    1986年，Beyond发行了唱片《再见理想》，同年刘志远加入Beyond。"];
     [self appendImage:@"737b4847gw1dweuioth1oj.jpg"];
     [self appendImage:@"timg (13).jpeg"];
     [self appendImage:@"timg (14).jpeg"];
    
    
     [self appendTextWithNewline:@"    1987年，Beyond出了一张EP《永远等待》，专辑中的歌曲《昔日舞曲》登上了香港电台流行榜，并被电视台拍成MTV，这也是Beyond第一首作品被拍成MTV。他们被星探陈健添发现，被新艺宝唱片公司签下。"];
     [self appendImage:@"timg (16).jpeg"];
    
    
     [self appendTextWithNewline:@"    1988年，就凭《大地》走红。刘志远因出国留学离开Beyond乐队。"];
     [self appendImage:@"timg (17).jpeg"];
    
    
     [self appendTextWithNewline:@"    1989年，由黄家驹作曲，小美填词，以歌颂母亲为题的《真的爱你》大热，成为家传户晓的颂母歌曲，更夺得十大劲歌金曲及十大中文金曲两大奖项。"];
     [self appendImage:@"zhendeaini.jpg"];
    
    
     [self appendTextWithNewline:@"    1990年，由黄家驹作曲及填词，以歌颂当时刚出狱的南非黑人民权领袖曼德拉为题材的《光辉岁月》大热，夺得十大劲歌金曲奖，黄家驹亦凭此曲夺得“最佳填词奖”。"];
     [self appendImage:@"timg (18).jpeg"];
    
    
    
     [self appendTextWithNewline:@"    1991年，Beyond于香港体育馆举办五场《生命接触演唱会》，成为第一队于香港体育馆举行演唱会的摇滚乐队。由于对香港乐坛感到失望，加上希望乐队能冲出香港，故在九十年代初期Beyond决定发展东南亚、台湾、中国大陆、日本等亚洲市场。此时，日本经理人公司对Beyond感到兴趣，与他们签约，带Beyond往日本发展。同年年尾，Beyond转投华纳唱片，开始Beyond的华纳时代。黄家驹表示，这是他们希望有更大自由度去玩音乐。"];
     [self appendImage:@"timg (19).jpeg"];
    
    
     [self appendTextWithNewline:@"    1992年，黄家驹获得香港新城电台的“作曲人奖”,Beyond开始长居日本。"];
     [self appendImage:@"timg (20).jpeg"];
    
    
     [self appendTextWithNewline:@"    1993年6月24日凌晨1时，为宣传即将发行的日语唱片，乐队应邀到富士电视台位于河田町的4号录影室拍摄游戏节目《小内小南的 想做什么 就做什么》（日语：ウッチャンナンチャンのやるならやらねば!），游戏进行了15分钟便发生意外，黄家驹在狭窄并沾满水渍的台上奔跑时不慎滑倒，强大冲力使身旁3块布景板的固定装置脱落，布景板松开，黄家驹与身旁的节目主持内村光良一同翻落2.7米的台下。黄家驹头部朝下摔落，左边额头首先着地，随即昏迷。内村光良则胸部着地，仅受轻伤。鉴于黄家驹头部严重受创，院方不敢轻举妄动，因此并未施以手术清走脑内瘀血。"];
     [self appendImage:@"timg (21).jpeg"];
     [self appendImage:@"timg (22).jpeg"];
    
    
     [self appendTextWithNewline:@"    1993年6月30日下午4时15分在东京女子医科大学医院逝世，终年31岁，院方公布死因为急性脑膜下血肿、头盖骨骨折、脑挫伤及急性脑肿胀。"];
     [self appendImage:@"timg (25).jpeg"];
    
    
     [self appendTextWithNewline:@"    1993年7月5日，黄家驹的遗体被运往将军澳华人永远坟场15段6台25号安葬。"];
     [self appendImage:@"timg (23).jpeg"];
    
    
     [self appendTextWithNewline:@"    \"原谅我这一生不羁放纵爱自由……\""];
     [self appendImage:@"timg (24).jpeg"];
    
    
    _textView.attributedText = _content;
    _textView.contentOffset = CGPointMake(0, 0);
}


@end
