//
//  ItemList.m
//  AisleAide
//
//  Created by MobileApps on 9/26/15.
//  Copyright © 2015 MyerSoft. All rights reserved.
//

#import "ItemList.h"

@implementation ItemList

-(instancetype)init{

    self = [super init];
    if (self) {
        self.itemArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(void)addNewItem:(Item*)item{
    [self.itemArray addObject:item];
}

-(NSMutableArray*)getItemList{
    return self.itemArray;
}

@end
