//
//  ItemCollectionViewController.h
//  AisleAide
//
//  Created by MobileApps on 8/2/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddMoreItemsViewController.h"

@interface ItemCollectionViewController : UIViewController <AddMoreItemsDelegate>

@property (strong, nonatomic) NSMutableArray *itemArray;

@end
