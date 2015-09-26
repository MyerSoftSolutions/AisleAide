//
//  Lyle.h
//  AisleAide
//
//  Created by MobileApps on 9/26/15.
//  Copyright © 2015 MyerSoft. All rights reserved.
//

#import <Foundation/Foundation.h>


@class ItemList, Patron, Store;

@interface Lyle : NSObject

@property (nonatomic, strong) ItemList *currentItemList;
@property (nonatomic, strong) Patron *currentPatron;
@property (nonatomic, strong) Store *currentStore;

+(id)defaultHelper;

@end
