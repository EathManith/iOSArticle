//
//  ScreenTableViewControllerDetail.h
//  UIScreen
//
//  Created by KSHRD on 7/9/16.
//  Copyright © 2016 Teckchun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScreenTableViewControllerDetail : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *tblDetailImage;
@property (weak, nonatomic) NSString *tblImage;
@property (weak, nonatomic) IBOutlet UILabel *tblLabel;
@property (weak, nonatomic) NSString * tblName;
@property (weak, nonatomic) IBOutlet UITextView *tblDetail;
@property (weak, nonatomic) NSString *tblDetailStr;


@end
