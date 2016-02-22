//
//  Lyle.h
//  AisleAide
//
//  Created by MobileApps on 9/26/15.
//  Copyright © 2015 MyerSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
#import "ItemList.h"
#import "Patron.h"
#import "Store.h"

@class ItemList;
@interface Lyle : NSObject

@property (nonatomic, strong) ItemList *currentItemList;
@property (nonatomic, strong) Patron *currentPatron;
@property (nonatomic, strong) Store *currentStore;

+(id)defaultHelper;

-(void)addSelectedItem:(Item*) selectedItem;
-(void)removeLastItem;

@end
