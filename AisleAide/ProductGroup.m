//
//  ProductGroup.m
//  AisleAide
//
//  Created by MobileApps on 3/25/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import "ProductGroup.h"

@implementation ProductGroup

-(id)initWithName:(NSString *)name
            aisle:(Aisle *)aisle{

    self = [super init];
    if (self) {
        _name = name;
        _aisle = aisle;
        _items = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
