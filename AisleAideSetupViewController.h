//
//  AisleAideSetupViewController.h
//  AisleAide
//
//  Created by MobileApps on 8/3/15.
//  Copyright © 2015 MyerSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Lyle.h"

@interface AisleAideSetupViewController : UIViewController

@property (nonatomic, strong) Lyle *lyle;
@property (strong, nonatomic) UIBarButtonItem *backBtn;

-(void)navigationBackButtonClicked:(UIBarButtonItem *)sender;
-(void)createCustomBackButton:(NSString*)btnTitle;
@end
