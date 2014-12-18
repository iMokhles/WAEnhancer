//
//  ImageFilterProcessViewController.m
//  MeiJiaLove
//
//  Created by Wu.weibin on 13-7-9.
//  Copyright (c) 2013年 Wu.weibin. All rights reserved.
//

#import "ImageFilterProcessViewController.h"
#import "ImageUtil.h"
#import "ColorMatrix.h"
#import "IphoneScreen.h"
@interface ImageFilterProcessViewController ()

@end

@implementation ImageFilterProcessViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *backbtn = @"/Library/Application Support/WAEnhancer/btn_back.png";
    NSString *okbtn = @"/Library/Application Support/WAEnhancer/btn_ok.png";
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageWithContentsOfFile:backbtn] forState:UIControlStateNormal];
    [leftBtn setFrame:CGRectMake(10, 20, 34, 34)];
    [leftBtn addTarget:self action:@selector(backView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBtn];
    
    UIButton *rightBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setImage:[UIImage imageWithContentsOfFile:okbtn] forState:UIControlStateNormal];
    [rightBtn setFrame:CGRectMake(270, 20, 34, 34)];
    [rightBtn addTarget:self action:@selector(fitlerDone:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightBtn];
    
    [self.view setBackgroundColor:[UIColor colorWithWhite:0.388 alpha:1.000]];
    self.rootImageView = [[UIImageView alloc ] initWithFrame:CGRectMake(40, 70, 230, 300)];
    self.rootImageView.image = self.currentImage;
    [self.view addSubview:self.rootImageView];
    
    NSArray *arr = [NSArray arrayWithObjects:@"Normal",@"LOMO",@"Black&White",@"Retro",@"Gothic",@"SharpColor",@"Elegant",@"Burgundy",@"Lime",@"Romantic",@"Halo",@"Blues",@"fantasy",@"Night", nil];
    self.self.scrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, ScreenHeight - 80, 320, 80)];
    self.scrollerView.backgroundColor = [UIColor clearColor];
    self.scrollerView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    self.scrollerView.showsHorizontalScrollIndicator = NO;
    self.scrollerView.showsVerticalScrollIndicator = NO;//关闭纵向滚动条
    self.scrollerView.bounces = YES;
  
    float x ;
    for(int i=0;i<14;i++)
    {
        x = 10 + 51*i;
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(setImageStyle:)];
        recognizer.numberOfTouchesRequired = 1;
        recognizer.numberOfTapsRequired = 1;
        recognizer.delegate = self;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, 53, 40, 23)];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setText:[arr objectAtIndex:i]];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setFont:[UIFont systemFontOfSize:13.0f]];
        [label setTextColor:[UIColor whiteColor]];
        [label setUserInteractionEnabled:YES];
        [label setTag:i];
        [label addGestureRecognizer:recognizer];
        
        [self.scrollerView addSubview:label];
        
        UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(x, 10, 40, 43)];
        [bgImageView setTag:i];
        [bgImageView addGestureRecognizer:recognizer];
        [bgImageView setUserInteractionEnabled:YES];
        UIImage *bgImage = [self changeImage:i imageView:nil];
        bgImageView.image = bgImage;
        [self.scrollerView addSubview:bgImageView];
        
    }
    self.scrollerView.contentSize = CGSizeMake(x + 55, 80);
    [self.view addSubview:self.scrollerView];
    
	// Do any additional setup after loading the view.
}

- (void)setImageStyle:(UITapGestureRecognizer *)sender
{
    UIImage *image =   [self changeImage:sender.view.tag imageView:nil];
    [self.rootImageView setImage:image];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIImage *)changeImage:(int)index imageView:(UIImageView *)imageView
{
    UIImage *image;
    switch (index) {
        case 0:
        {
            return self.currentImage;
        }
            break;
        case 1:
        {
            image = [ImageUtil imageWithImage:self.currentImage withColorMatrix:colormatrix_lomo];
        }
            break;
        case 2:
        {
           image = [ImageUtil imageWithImage:self.currentImage withColorMatrix:colormatrix_heibai];
        }
            break;
        case 3:
        {
            image = [ImageUtil imageWithImage:self.currentImage withColorMatrix:colormatrix_huajiu];
        }
            break;
        case 4:
        {
            image = [ImageUtil imageWithImage:self.currentImage withColorMatrix:colormatrix_gete];
        }
            break;
        case 5:
        {
            image = [ImageUtil imageWithImage:self.currentImage withColorMatrix:colormatrix_ruise];
        }
            break;
        case 6:
        {
            image = [ImageUtil imageWithImage:self.currentImage withColorMatrix:colormatrix_danya];
        }
            break;
        case 7:
        {
            image = [ImageUtil imageWithImage:self.currentImage withColorMatrix:colormatrix_jiuhong];
        }
            break;
        case 8:
        {
            image = [ImageUtil imageWithImage:self.currentImage withColorMatrix:colormatrix_qingning];
        }
            break;
        case 9:
        {
            image = [ImageUtil imageWithImage:self.currentImage withColorMatrix:colormatrix_langman];
        }
            break;
        case 10:
        {
            image = [ImageUtil imageWithImage:self.currentImage withColorMatrix:colormatrix_guangyun];
        }
            break;
        case 11:
        {
            image = [ImageUtil imageWithImage:self.currentImage withColorMatrix:colormatrix_landiao];
            
        }
            break;
        case 12:
        {
            image = [ImageUtil imageWithImage:self.currentImage withColorMatrix:colormatrix_menghuan];
        
        }
            break;
        case 13:
        {
            image = [ImageUtil imageWithImage:self.currentImage withColorMatrix:colormatrix_yese];
            
        }
    }
    return image;
}

- (void)backView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        [self.delegate imageFitlerProcessClose];
        //UIImageWriteToSavedPhotosAlbum(self.rootImageView.image, nil, nil, nil);
    }];
}
- (void)fitlerDone:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        [self.delegate imageFitlerProcessDone:self.self.rootImageView.image];
        //UIImageWriteToSavedPhotosAlbum(self.rootImageView.image, nil, nil, nil);
    }];
}
@end
