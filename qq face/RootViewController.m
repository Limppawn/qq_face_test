//
//  RootViewController.m
//  qq face
//
//  Created by 梁志成 on 16/7/15.
//  Copyright © 2016年 梁志成. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creatScrollView];
    
    
}

-(void)creatScrollView{
    
    UIScrollView *scrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 90)];
    //滚动区域
    scrollView.contentSize =CGSizeMake(self.view.frame.size.width * 4, 90);
    
    //分页滚动
    scrollView.pagingEnabled =YES;
    //人机交互
    scrollView.userInteractionEnabled =YES;
    
    
    [self.view addSubview:scrollView];
    
    //间隔距离
    NSInteger distace =(self.view.frame.size.width - 300)/2;
    //qq face
    for (NSInteger page =0; page <4; page++) {
        
        for (NSInteger row =0; row<3; row++) {
            
            for (NSInteger line=0; line<10; line++) {
                
                UIImageView *faceView =[[UIImageView alloc]initWithFrame:CGRectMake(distace + line*30+page*self.view.frame.size.width, 30*row, 30, 30)];
                faceView.image =[UIImage imageNamed:[NSString stringWithFormat:@"%03ld",line+10*row+page*30+1]];
                //手势
                UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
                [faceView addGestureRecognizer:tap];
                faceView.userInteractionEnabled =YES;
                
                [scrollView addSubview:faceView];
                
            }
        }
    }
    
    //展示表情的大图
    UIImageView *bigView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 200, 200, 200)];
    bigView.tag =1000;
    [self.view addSubview:bigView];
    
    
    
}

-(void)tapAction:(UIGestureRecognizer *)ges{
    
    UIImageView *imgview =(UIImageView *)[self.view viewWithTag:1000];
    
    //显示点击的表情
    imgview.image =[(UIImageView *)ges.view image];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
