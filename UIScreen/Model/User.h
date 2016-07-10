//
//  User.h
//  UIScreen
//
//  Created by KSHRD on 6/19/16.
//  Copyright © 2016 Teckchun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject{
    int uid;
    NSString *name;
    NSString *email;
    NSString *urlProfile;
    
}

@property int uid;
@property NSString *name;
@property NSString *email;
@property NSString *urlProfile;

@end
