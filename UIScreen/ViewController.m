//
//  ViewController.m
//  UIScreen
//
//  Created by Teckchun on 6/18/16.
//  Copyright © 2016 Teckchun. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import "ProfileViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>



@interface ViewController ()<FBSDKLoginButtonDelegate>

@end
NSDictionary *fb_data;
@implementation ViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];
    
//    FBSDKLoginButton *FBloginButton = [[FBSDKLoginButton alloc] init];
//    FBloginButton.center = self.view.center;
//    FBloginButton.readPermissions =
//    @[@"public_profile", @"email"];
//    [self.view addSubview:FBloginButton];
//    FBloginButton.delegate = self;
    
//    Custom Facebook Login Button
    UIButton *loginButton = [[UIButton alloc] init];
    loginButton.backgroundColor=[UIColor grayColor];
    loginButton.layer.cornerRadius = self.btnLogin.frame.size.height/2;

    [loginButton setTitle:@"Custom FBLogin" forState:UIControlStateNormal];
      loginButton.frame=CGRectMake(0,0,180,40);
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
  
    // Handle clicks on the button
    [loginButton
     addTarget:self
     action:@selector(loginButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    _btnLogin.layer.cornerRadius = self.btnLogin.frame.size.height/2;
    [self.btnLogin setTitle:@"Login" forState:UIControlStateNormal];
    
    [_btnForgetPwd setTitle: @"Forgot your password?" forState:UIControlStateNormal];
    [_btnForgetPwd setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
   // _tfEmail.delegate = self;
    _tfEmail.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    //[self.tfEmail becomeFirstResponder];
    
 //   _tfPassword.delegate = self;
    _tfPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
//    [self.tfPassword becomeFirstResponder];
}

//    Facebook Login Button
-(void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error{
    NSLog(@"complete login");
    if (error != nil) {
        NSLog(@"%@", error);
    }else{
        NSLog(@"get profile");
        [self getfbprofile];
        [self performSegueWithIdentifier:@"ShowProfileSegue" sender:fb_data];
        
    }
    
    
    
}


-(void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
    
}

// Facebook Button Click
-(void)loginButtonClicked
{
    // create manager object
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    
    [login
     logInWithReadPermissions: @[@"email",@"user_birthday"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"ERORR ------%@",error);
         } else if (result.isCancelled) {
             NSLog(@"------------------Cancelled");
         } else {
             NSLog(@"------------------Logged in");
             [self getfbprofile];
             [self performSegueWithIdentifier:@"ShowProfileSegue" sender:fb_data];
             //  [login logOut];

         }
     }];
}

-(void)getfbprofile{
    //  NSLog(@"get fb profile");
    NSMutableDictionary *parameters =  [NSMutableDictionary dictionary];
    [parameters setValue:@"email,name,gender,picture.type(large){url},birthday" forKey:@"fields"];
    
    
    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters]
     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
         // if not error
         if (!error) {
            NSLog(@"fetched user fb:%@", result);
             
            [self performSegueWithIdentifier:@"ShowProfileSegue" sender:result];

         }else{
             NSLog(@"Error %@", error);
         }
         
     }];
    
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"ViewWillAppear");
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"ViewDidAppear");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)LoginAction:(id)sender {
    
    if ([_tfEmail.text  isEqualToString: @"admin"] && [_tfPassword.text isEqualToString:@"123"]) {
        User * u = [User new];
        u.uid = 5;
        u.name = @"Jonh";
        u.email = @"eathmanith@gmail.com";
//        u.about = @"This is my profile information!\nHello to my profile.";
//        u.post = 60;
//        u.fri = 120;
//        u.like = 300;
        u.urlProfile = @"https://bower.io/img/bower-logo.png";
        
        [self performSegueWithIdentifier:@"ShowProfileSegue" sender:u];
    }else if([_tfEmail.text  isEqualToString: @"book"] && [_tfPassword.text isEqualToString:@"123"]){
        // By Segue
        //        [self performSegueWithIdentifier:@"ShowRecipeSegue" sender:nil];
        
        
        //        // By Programmatically
        UINavigationController *listRootNavigationViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ListRootNavigation"];
        [self presentViewController:listRootNavigationViewController animated:YES completion:nil];
    }else if([_tfEmail.text  isEqualToString: @"abc"] && [_tfPassword.text isEqualToString:@"123"]){
        //[self showTextAlertView:nil];
    }else{
        // [self prepareAlertController];
        
    }
}

//- (void)showTextAlertView:(UIButton *)sender
//    {
//        NSString *alertTitle = NSLocalizedString(@"TextAlertTitle", @"Text Input Alert");
//        NSString *alertMessage = NSLocalizedString(@"TextAlertMessage", @"Plain and secure text input");
//        
//        UIAlertController *alertController1 = [UIAlertController alertControllerWithTitle:alertTitle
//                                                                                  message:alertMessage
//                                                                           preferredStyle:UIAlertControllerStyleAlert];
//        
//        [alertController1 addTextFieldWithConfigurationHandler:^(UITextField *textField)
//         {
//             textField.placeholder = NSLocalizedString(@"LoginPlaceholder", @"Login");
//             [textField addTarget:self
//                           action:@selector(alertTextFieldDidChange:)
//                 forControlEvents:UIControlEventEditingChanged];
//         }];
//        
//        [alertController1 addTextFieldWithConfigurationHandler:^(UITextField *textField)
//         {
//             textField.placeholder = NSLocalizedString(@"PasswordPlaceholder", @"Password");
//             textField.secureTextEntry = YES;
//         }];
//        
//        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
//                                                               style:UIAlertActionStyleCancel
//                                                             handler:^(UIAlertAction *action)
//                                       {
//                                           NSLog(@"Cancel action");
//                                       }];
//        
//        UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK action")
//                                                           style:UIAlertActionStyleDefault
//                                                         handler:^(UIAlertAction *action)
//                                   {
//                                       UITextField *login = alertController.textFields.firstObject;
//                                       UITextField *password = alertController.textFields.lastObject;
//                                       
//                                       NSLog(@"OK action");
//                                       NSLog(@"Login value: %@",login.text);
//                                       NSLog(@"Password value: %@",password.text);
//                                   }];
//        
//        okAction.enabled = NO;
//        [alertController1 addAction:cancelAction];
//        [alertController1 addAction:okAction];
//        
//        [self presentViewController:alertController1 animated:YES completion:nil];
//    }
//    
//#pragma mark -
//#pragma mark === UITextField - UIControlEventEditingChanged ===
//#pragma mark -
//    
//    - (void)alertTextFieldDidChange:(UITextField *)sender
//    {
//        UIAlertController *alertController1 = (UIAlertController *)self.presentedViewController;
//        if (alertController1)
//        {
//            //UITextField *login = alertController.textFields.firstObject;
//            UITextField *login = [alertController1.textFields objectAtIndex:0];
//            UIAlertAction *okAction = alertController1.actions.lastObject;
//            okAction.enabled = login.text.length > 2;
//        }
//    }
//    
//    -(void)prepareAlertController{
//        UIAlertAction *cancelAction = [UIAlertAction
//                                       actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
//                                       style:UIAlertActionStyleCancel
//                                       handler:^(UIAlertAction *action)
//                                       {
//                                           NSLog(@"Cancel action");
//                                       }];
//        UIAlertAction *okAction = [UIAlertAction
//                                   actionWithTitle:NSLocalizedString(@"OK", @"OK action")
//                                   style:UIAlertActionStyleDefault
//                                   handler:^(UIAlertAction *action)
//                                   {
//                                       NSLog(@"OK action");
//                                   }];
//        [alertController addAction:cancelAction];
//        [alertController addAction:okAction];
//        [self presentViewController:alertController animated:YES completion:nil];
//}
//    

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ProfileViewController *vc = [segue destinationViewController];
 
    User * u = [User new];
    u.uid = 5;
    u.name = [sender valueForKey:@"name"];
    u.email = [sender valueForKey:@"email"];
    u.urlProfile = [[[sender valueForKey:@"picture"] valueForKey:@"data"] valueForKey:@"url"];
//    NSLog(@"%@", u.urlProfile);
    vc.user = u;
}

@end
