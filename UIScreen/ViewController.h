//
//  ViewController.h
//  UIScreen
//
//  Created by Teckchun on 6/18/16.
//  Copyright © 2016 Teckchun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;
@property (weak, nonatomic) IBOutlet UITextField *tfEmail;

@property (weak, nonatomic) IBOutlet UIButton *btnLogin;

@property (weak, nonatomic) IBOutlet UIButton *btnForgetPwd;
@end

