//
//  WelcomeVC.h
//  FreakingMath!
//
//  Created by Đăng Hòa on 10/3/14.
//  Copyright (c) 2014 GreenGlobal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WelcomeVC : UIViewController

@property (weak, nonatomic) IBOutlet UIView *viewPR;

@property (weak, nonatomic) IBOutlet UIView *viewContact;

//action
- (IBAction)touchGoPlay:(id)sender;
- (IBAction)touchContact:(id)sender;

@end
