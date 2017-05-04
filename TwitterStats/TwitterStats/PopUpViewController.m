//
//  PopUpViewController.m
//  TwitterStats
//
//  Created by Cameron Weston on 5/4/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "PopUpViewController.h"
#import "FLKAutoLayout.h"

@interface PopUpViewController ()

@property (weak, nonatomic) IBOutlet UIView *popUpView;

@end

@implementation PopUpViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.6];
    self.popUpView.layer.cornerRadius = 5;
    self.popUpView.layer.shadowOpacity = 0.8;
    self.popUpView.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    [super viewDidLoad];
}

- (void)showPopUpAnimate {
    self.view.transform = CGAffineTransformMakeScale(1.3, 1.3);
    self.view.alpha = 0;
    [UIView animateWithDuration:.25 animations:^{
        self.view.alpha = 1;
        self.view.transform = CGAffineTransformMakeScale(1, 1);
    }];
}

- (void)removePopUpAnimate {
    [UIView animateWithDuration:.25 animations:^{
        self.view.transform = CGAffineTransformMakeScale(1.3, 1.3);
        self.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self.view removeFromSuperview];
        }
    }];
}

- (IBAction)closePopup:(id)sender {
    [self removePopUpAnimate];
}

- (void)showInView:(UIViewController *)aViewController animated:(BOOL)animated
{
    [aViewController addChildViewController:self];

    self.view.frame = aViewController.view.frame;
    [aViewController.view addSubview:self.view];
    [self.view alignToView:aViewController.view];

    if (animated) {
        [self showPopUpAnimate];
    }
    
}
@end
