//
//  ViewController.m
//  JiaJu
//
//  Created by MaSong on 2017/6/13.
//  Copyright © 2017年 MaSong. All rights reserved.
//

#import "ViewController.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "UIView+Helper.h"
#import "LifetimeViewController.h"
#import "MemoryViewController.h"
#import "StoryViewController.h"
#import "EvaluateViewController.h"
#import "AboutViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *lifetimeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *memoryImageView;
@property (weak, nonatomic) IBOutlet UIImageView *storyImageView;
@property (weak, nonatomic) IBOutlet UIImageView *evaluateImageView;
@property (weak, nonatomic) IBOutlet UIImageView *aboutImageView;

@property (weak, nonatomic) IBOutlet UIImageView *maskImageView;

@property (weak, nonatomic) IBOutlet UILabel *lifetimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *memoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *storyLabel;
@property (weak, nonatomic) IBOutlet UILabel *evaluateLabel;
@property (weak, nonatomic) IBOutlet UILabel *aboutLabel;
@property (weak, nonatomic) IBOutlet UIButton *lifetimeButton;
@property (weak, nonatomic) IBOutlet UIButton *memoryButton;
@property (weak, nonatomic) IBOutlet UIButton *storyButton;
@property (weak, nonatomic) IBOutlet UIButton *evaluateButton;
@property (weak, nonatomic) IBOutlet UIButton *aboutButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [self makeNavigationBarTranslucent ];
    
    CGRect bounds = [UIScreen mainScreen].bounds;
    CGFloat with = bounds.size.width;
    CGFloat height = bounds.size.height;
    
    CGFloat baseWith = 375.0f;
    CGFloat baseHeight = 667.0f;
    _lifetimeImageView.frame = CGRectMake(2, 2, with * 221 / baseWith, height * 374 / baseHeight);
    _memoryImageView.frame = CGRectMake(2,_lifetimeImageView.bottom + 2, with * 221 / baseWith, height * 286 / baseHeight);
    
    
    _storyImageView.frame = CGRectMake(_lifetimeImageView.right + 2,2, with * 148 / baseWith, height * 221 / baseHeight);
    _evaluateImageView.frame = CGRectMake(_storyImageView.left, _storyImageView.bottom + 2, with * 148 / baseWith, height * 248 / baseHeight);
    _aboutImageView.frame = CGRectMake(_storyImageView.left, _evaluateImageView.bottom + 2, with * 148 / baseWith, height * 189 / baseHeight);
    
    _maskImageView.frame = bounds;
    
    _lifetimeLabel.right = _lifetimeImageView.right;
    _lifetimeLabel.bottom = _lifetimeImageView.bottom;
    
    _memoryLabel.right = _memoryImageView.right;
    _memoryLabel.top = _memoryImageView.top;
    
    _storyLabel.x = _storyImageView.x;
    _storyLabel.bottom = _storyImageView.bottom;
    
    _evaluateLabel.x = _evaluateImageView.x;
    _evaluateLabel.top = _evaluateImageView.top;
    
    _aboutLabel.bottom = _aboutImageView.bottom;
    _aboutLabel.centerX = _aboutImageView.centerX;
    
    _lifetimeButton.frame = _lifetimeImageView.frame;
    _memoryButton.frame = _memoryImageView.frame;
    _storyButton.frame = _storyImageView.frame;
    _evaluateButton.frame = _evaluateImageView.frame;
    _aboutButton.frame = _aboutImageView.frame;
    

}

- (IBAction)didClickLitetimeButton:(id)sender {
    LifetimeViewController *lifetimeVC = [LifetimeViewController new];
    [self.navigationController pushViewController:lifetimeVC animated:YES];

}
- (IBAction)didClickMemoryButton:(id)sender {
    MemoryViewController *memoryVC = [MemoryViewController new];
    [self.navigationController pushViewController:memoryVC animated:YES];
}

- (IBAction)didClickStoryButton:(id)sender {
    StoryViewController *storyVC = [StoryViewController new];
    [self.navigationController pushViewController:storyVC animated:YES];
}
- (IBAction)didClickEvaluateButton:(id)sender {
    EvaluateViewController *evaluateVC = [EvaluateViewController new];
    [self.navigationController pushViewController:evaluateVC animated:YES];
}
- (IBAction)didClickAboutButton:(id)sender {
    AboutViewController *aboutVC = [AboutViewController new];
    [self.navigationController pushViewController:aboutVC animated:YES];
}



@end
