//
//  PlayVC.h
//  FreakingMath!
//
//  Created by Đăng Hòa on 10/3/14.
//  Copyright (c) 2014 GreenGlobal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayVC : UIViewController

//
@property (weak, nonatomic) IBOutlet UIView *viewMain;

//
@property (weak, nonatomic) IBOutlet UILabel *lblBestScore;
@property (weak, nonatomic) IBOutlet UILabel *lblYourScore;

//
@property (weak, nonatomic) IBOutlet UILabel *lblQuestion;
@property (weak, nonatomic) IBOutlet UILabel *lblResult;

//
@property (weak, nonatomic) IBOutlet UIView *viewNotification;
@property (weak, nonatomic) IBOutlet UIView *viewSmile;

//
@property (weak, nonatomic) IBOutlet UIView *viewDuration;

//
@property (weak, nonatomic) IBOutlet UIView *viewDie;
@property (weak, nonatomic) IBOutlet UILabel *lblDieScore;

//action
- (IBAction)touchOkGo:(id)sender;


- (IBAction)touchFalse:(id)sender;
- (IBAction)touchTrue:(id)sender;

- (IBAction)touchReplay:(id)sender;
- (IBAction)touchExitVC:(id)sender;


@end
