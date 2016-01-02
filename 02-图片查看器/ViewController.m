//
//  ViewController.m
//  02-图片查看器
//
//  Created by zhanglu1988em on 16/1/2.
//  Copyright © 2016年 wbder. All rights reserved.
//

#import "ViewController.h"
#import "ResourceMode.h"

#define Spacing         10
@interface ViewController ()
@property (nonatomic,strong) UILabel* titleLbl;
@property (nonatomic,strong) UIImageView* imageView;
@property (nonatomic,strong) UILabel* descLbl;
@property (nonatomic,strong) UIButton* leftBtn;
@property (nonatomic,strong) UIButton* rightBtn;
@property (nonatomic,strong) NSArray* arryM;
@property (nonatomic,assign) int index;


@end

@implementation ViewController


-(NSArray*) arryM
{
    if (_arryM == nil) {
        _arryM = [ResourceMode Resources];
    }
    return _arryM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 40)];
    [_titleLbl setText:@"1/5"];
    [_titleLbl setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:_titleLbl];
    
    
    CGFloat imageW = 200.0;
    CGFloat imageH = 200.0;
    CGFloat x = (self.view.bounds.size.width - imageW) * 0.5 ;
    CGFloat y = CGRectGetMaxY(_titleLbl.frame) + Spacing;
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, imageW, imageH)];
    [self.view addSubview:_imageView];
    
    
    CGFloat descY = CGRectGetMaxY(_imageView.frame);
    _descLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, descY, self.view.bounds.size.width, 40)];
    [_descLbl setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:_descLbl];
    
    _leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    CGFloat centerX = self.imageView.frame.origin.x * 0.5;
    CGFloat centerY = self.imageView.center.y;
    _leftBtn.center = CGPointMake(centerX, centerY);
    [_leftBtn setBackgroundImage:[UIImage imageNamed :@"left_normal"] forState:UIControlStateNormal];
    [_leftBtn setBackgroundImage:[UIImage imageNamed :@"left_highted"]  forState:UIControlStateHighlighted];
    [self.leftBtn addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventTouchUpInside];
    self.leftBtn.tag = -1;
    [self.view addSubview:_leftBtn];
    
    
    _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    centerX = CGRectGetMaxX(_imageView.frame) + (self.view.bounds.size.width - CGRectGetMaxX(_imageView.frame)) * 0.5;
    centerY = self.imageView.center.y;
    self.rightBtn.tag = 1;
    _rightBtn.center = CGPointMake(centerX, centerY);

    
    _rightBtn.center = CGPointMake(centerX, centerY);
    [_rightBtn setBackgroundImage:[UIImage imageNamed :@"right_normal"] forState:UIControlStateNormal];
    [_rightBtn setBackgroundImage:[UIImage imageNamed :@"right_highted"]  forState:UIControlStateHighlighted];
    [self.rightBtn addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:_rightBtn];
    [self actioAdvance ];
    NSLog(@"%@",self.arryM);
    
  }

// 优化之前
-(void) actioRetreat
{
    ResourceMode *mode = [self.arryM objectAtIndex:_index --];
    [self.imageView setImage:[UIImage imageNamed:mode.imagename]];
    [self.descLbl setText:mode.desc];
    NSLog(@"%s,%d",__func__,self.index);
}

-(void) actioAdvance
{
    ResourceMode *mode = [self.arryM objectAtIndex:_index ++];
    [self.imageView setImage:[UIImage imageNamed:mode.imagename]];
    [self.descLbl setText:mode.desc];
     NSLog(@"%s,%d",__func__,self.index);
}
//code optimize
-(void) actionClick:(UIButton*) sender
{
     NSLog(@"%s,%d",__func__,self.index);
    
    self.index += sender.tag;
    [self showPhoto];
  
}

-(void) showPhoto
{
    NSString *title = [NSString stringWithFormat:@"%d/5",self.index + 1];
    [self.titleLbl setText:title];
    ResourceMode *mode = [self.arryM objectAtIndex:_index];
    [self.imageView setImage:[UIImage imageNamed:mode.imagename]];
    [self.descLbl setText:mode.desc];
    [self.rightBtn setEnabled:(self.index != 4)];
    [self.leftBtn setEnabled:self.index != 0];
}

@end
