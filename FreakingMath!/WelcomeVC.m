//
//  WelcomeVC.m
//  FreakingMath!
//
//  Created by Đăng Hòa on 10/3/14.
//  Copyright (c) 2014 GreenGlobal. All rights reserved.
//

#import "WelcomeVC.h"
#import "PlayVC.h"

#define isiPhone5  ([[UIScreen mainScreen] bounds].size.height == 568)?TRUE:FALSE

@interface WelcomeVC ()

@end

@implementation WelcomeVC

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
    // Do any additional setup after loading the view from its nib.
    
    [self.navigationController setNavigationBarHidden:YES];
    
    if (!isiPhone5) {
        _viewPR.frame = CGRectMake(_viewPR.frame.origin.x, _viewPR.frame.origin.y-40, _viewPR.frame.size.width, _viewPR.frame.size.height);
        _viewContact.frame = CGRectMake(_viewContact.frame.origin.x, _viewContact.frame.origin.y-88, _viewContact.frame.size.width, _viewContact.frame.size.height);
    }else{
        //
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchGoPlay:(id)sender {
    PlayVC *vc = [[PlayVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)touchContact:(id)sender {
    NSLog(@"Contact");
}
@end
