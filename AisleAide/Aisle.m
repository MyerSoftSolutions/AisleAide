//
//  Aisle.m
//  AisleAide
//
//  Created by MobileApps on 3/20/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import "Aisle.h"
#import "ProductGroup.h"
#import "Item.h"

@implementation Aisle

-(id)initWithNumber:(int)number{

    self = [super init];
    if(self)
    {
        _aisleNumber = [NSNumber numberWithInt:number];
        _productGroups = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(NSMutableArray*)getAllItems{
    NSMutableArray *prodArray = [[NSMutableArray alloc] init];
    
    for (ProductGroup *prodGrp in self.productGroups) {
        for (Item *item in prodGrp.items) {
            [prodArray addObject:item];
        }
    }
    
    return prodArray;
}

@end
