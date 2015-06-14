//
//  ItemTableViewCell.h
//  AisleAide
//
//  Created by MyerSoft Solutions on 5/10/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *itemLabel;
@property (strong, nonatomic) IBOutlet UILabel *aisleLabel;

@end
