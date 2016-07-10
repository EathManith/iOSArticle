//
//  ProfileViewController.m
//  UIScreen
//
//  Created by Teckchun on 6/18/16.
//  Copyright © 2016 Teckchun. All rights reserved.
//

#import "ProfileViewController.h"


@implementation ProfileViewController

@synthesize user;

-(void)viewDidLoad{
    [self prepareImageView];
    NSLog(@"----%@", user.name);
    self.labelEmail.text = user.email;
    self.labelName.text = user.name;
    self.imgViewProfile.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:user.urlProfile]]];
    
}
    
-(void)prepareImageView{
//    _imgViewProfile.layer.borderWidth = 5.0f;
//    _imgViewProfile.layer.borderColor = [[UIColor brownColor] CGColor];

    _imgViewProfile.layer.cornerRadius = self.imgViewProfile.frame.size.height/2;
    [_btnAddFriend setTitle:@"+ Add Friend" forState:UIControlStateNormal];
    _btnAddFriend.layer.cornerRadius = self.btnAddFriend.frame.size.height/2;
}
- (IBAction)backAction:(id)sender {

    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
