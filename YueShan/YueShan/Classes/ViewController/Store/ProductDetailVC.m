//
//  ProductDetailVC.m
//  YueShan
//
//  Created by Fedora on 2017/1/12.
//  Copyright © 2017年 opq. All rights reserved.
//

#import "ProductDetailVC.h"

@interface ProductDetailVC () {
    
    __weak IBOutlet UIScrollView *scrollView;
}

@end

@implementation ProductDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"燕窝";
    
    CGFloat width = MAIN_SCREEN_WIDTH;
    CGFloat height = 5000;
    scrollView.contentSize = CGSizeMake(width, height);
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    imgView.image = [UIImage imageNamed:@"productDetail"];
    [scrollView addSubview:imgView];
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
