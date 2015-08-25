//
//  AddMoreItemsViewController.h
//  AisleAide
//
//  Created by MobileApps on 8/24/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import "AisleAideSetupViewController.h"

@protocol AddMoreItemsDelegate <NSObject>

-(void)selectionMade:(int)choice;

@end

@interface AddMoreItemsViewController : AisleAideSetupViewController

@property (weak, nonatomic) id <AddMoreItemsDelegate> delegate;

- (IBAction)noPressed:(id)sender;
- (IBAction)yesPressed:(id)sender;

@end
