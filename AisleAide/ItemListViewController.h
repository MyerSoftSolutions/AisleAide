//
//  AisleListViewController.h
//  AisleAide
//
//  Created by MyerSoft Solutions on 5/10/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AisleList.h"

@interface ItemListViewController : UIViewController

@property (nonatomic, strong) AisleList *aisleList;

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UILabel *itemCountLabel;
@property (nonatomic, strong) NSMutableArray *itemArray;

@end
