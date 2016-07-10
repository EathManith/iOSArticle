//
//  ScreenTableViewControllerDetail.m
//  UIScreen
//
//  Created by KSHRD on 7/9/16.
//  Copyright © 2016 Teckchun. All rights reserved.
//

#import "ScreenTableViewControllerDetail.h"
#import "ScreenTableView.h"

@implementation ScreenTableViewControllerDetail

@synthesize tblDetailImage;
@synthesize tblImage;
@synthesize tblLabel;
@synthesize tblName;
@synthesize tblDetail;
@synthesize tblDetailStr;

-(void)viewDidLoad{
    [super viewDidLoad];
    // Set the Label text with the selected recipe
    tblLabel.text = tblName;
    NSLog(@"aaaaa%@",tblImage);
    NSLog(@"bbb%@",[UIImage imageNamed:tblImage]);
    
    tblDetailImage.image =[UIImage imageNamed:tblImage];
    tblDetail.text = tblDetailStr;
    
    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc]init];
    UIBarButtonItem *mybtn =[[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(home:)];
//    newBackButton.tintColor = [UIColor blueColor];
//    newBackButton.action = @selector(home:);
//    newBackButton.title = @"Back";
//    newBackButton.target = self;
    
    // then we add the button to the navigation bar
    self.navigationItem.leftBarButtonItem=mybtn;
 //   NSLog(@"btn title%@",newBackButton.title);
}

-(void)home:(UIBarButtonItem *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
