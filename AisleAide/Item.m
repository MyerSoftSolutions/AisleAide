//
//  Item.m
//  AisleAide
//
//  Created by Joel Myers on 3/4/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import "Item.h"


@implementation Item

-(id)initWithName:(NSString *)name prodGroup:(ProductGroup*)prodGroup aisle:(Aisle*)aisle{
    self = [super init];
    
    if(self)
    {
        _name = name;
        _productGroup = prodGroup;
        _aisle = aisle;
    }
    
    return self;
}



@end
