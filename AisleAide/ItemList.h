//
//  ItemList.h
//  AisleAide
//
//  Created by MobileApps on 9/26/15.
//  Copyright © 2015 MyerSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Patron.h"

@class Patron;
@interface ItemList : NSObject

@property (nonatomic, strong) NSMutableArray *itemArray;
@property (nonatomic, weak) Patron *patron;

@end
