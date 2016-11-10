//
//  PlayVC.m
//  FreakingMath!
//
//  Created by Đăng Hòa on 10/3/14.
//  Copyright (c) 2014 GreenGlobal. All rights reserved.
//

#import "PlayVC.h"

#define TIME 2

@interface PlayVC ()<UIAlertViewDelegate>{
    
    NSTimer *_timer;
    
    BOOL isTrue;
    
    NSInteger _numberA;
    NSInteger _numberB;
    NSInteger _total;
    NSInteger _plus;
    NSInteger _tmp;
    
    NSInteger _yourScore;
    
}

@end

@implementation PlayVC

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

    [self configView];

}

#pragma config
-(void)configView{
    
    _yourScore = 0;
    
    _lblYourScore.text = [NSString stringWithFormat:@"%ld",(long)_yourScore];
    _lblDieScore.text = @"0";
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"BestScore"]) {
        _lblBestScore.text = [NSString stringWithFormat:@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"BestScore"] ];
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"BestScore"];
        _lblBestScore.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"BestScore"];
    }
    
    _lblQuestion.text = @"Welcome";
    _lblResult.text =@"You";
    
    _viewNotification.alpha = 0.3;
    
    _viewSmile.layer.cornerRadius = 4;
    _viewSmile.layer.masksToBounds = YES;
    
    _viewDie.layer.cornerRadius = 4;
    _viewDie.layer.masksToBounds = YES;
}


#pragma public method
-(void)setUpGame{
    [_timer invalidate];
    
    _numberA = arc4random()%30;
    _numberB = arc4random()%30;
    _plus = arc4random()%3;
    _tmp = arc4random()%1;
    
    
    //
    if (_tmp == 0) {
        _total = _numberA + _numberB + _plus;
    }else{
        _total = _numberA + _numberB - _plus;
    }
    
    _lblQuestion.text = [NSString stringWithFormat:@"%ld + %ld",(long)_numberA,(long)_numberB];
    _lblResult.text = [NSString stringWithFormat:@"= %ld",(long)_total];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:TIME
                                                    target:self
                                                  selector:@selector(showDieView)
                                                  userInfo:nil
                                                   repeats:NO];
    
}

-(void)setUpAnimationWithTime{
    _viewDuration.frame = CGRectMake(0, 473, 320, 6);
    [UIView animateWithDuration:TIME animations:^{
        _viewDuration.frame = CGRectMake(0, 473, 0, 6);
    }];
}

-(BOOL)checkResult{
    if ((_numberA + _numberB) == _total) {
        return YES;
    }else{
        return NO;
    }
    return YES;
}

-(void)showDieView{

    _viewDuration.frame = CGRectMake(0, 473, 320, 6);
    _viewNotification.alpha = 0.3;
    [UIView animateWithDuration:1.0 animations:^{
        _viewDie.frame = CGRectMake(35, 140, 250, 180);
    }];
}


-(void)saveBestScore{
    if (_yourScore > [[[NSUserDefaults standardUserDefaults] objectForKey:@"BestScore"] integerValue]) {
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%ld",(long)_yourScore] forKey:@"BestScore"];
    }else{
        //
    }
    
    _lblBestScore.text = [NSString stringWithFormat:@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"BestScore"] ];
}



#pragma action
- (IBAction)touchOkGo:(id)sender {
    
    _viewNotification.alpha = 0;
    _viewSmile.alpha = 0;
    
    //
    [self setUpGame];
    [self setUpAnimationWithTime];
    
}

- (IBAction)touchFalse:(id)sender {
    if ([self checkResult]) {
        [_timer invalidate];
        [self saveBestScore];
        [self showDieView];
    }else{
        
        _yourScore++;
        _lblYourScore.text = [NSString stringWithFormat:@"%ld",(long)_yourScore];
        _lblDieScore.text = [NSString stringWithFormat:@"%ld",(long)_yourScore];
        [self saveBestScore];
        
        [self setUpGame];
        [self setUpAnimationWithTime];
 
    }
    
}

- (IBAction)touchTrue:(id)sender {
    if (![self checkResult]) {
        [_timer invalidate];
        [self saveBestScore];
        [self showDieView];
    }else{
        
        _yourScore++;
        _lblYourScore.text = [NSString stringWithFormat:@"%ld",(long)_yourScore];
        _lblDieScore.text = [NSString stringWithFormat:@"%ld",(long)_yourScore];
        [self saveBestScore];
        
        [self setUpGame];
        [self setUpAnimationWithTime];
    }
}

- (IBAction)touchReplay:(id)sender {
    //
    _yourScore = 0;
    _lblDieScore.text = @"0";
    _lblYourScore.text = [NSString stringWithFormat:@"%ld",(long)_yourScore];
 
    
    //
    _viewNotification.alpha = 0;
    _viewDie.frame = CGRectMake(35, 590, 250, 180);

    //
    [self setUpGame];
    [self setUpAnimationWithTime];
    
}

- (IBAction)touchExitVC:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
