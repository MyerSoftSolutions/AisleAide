//
//  Patron.m
//  AisleAide
//
//  Created by MyerSoft Solutions on 3/20/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import "Patron.h"

@implementation Patron

-(id)initWithName:(NSString *)name
           userID:(int)userID{

    self = [super init];
    if (self) {
        _name = name;
        _userID = [NSNumber numberWithInt:userID];
    }
    
    return self;
}

-(void)setItemList:(NSMutableArray *)itemList{

    self.itemList = itemList;
    
    if (!self.lists) {
        self.itemList = [[NSMutableArray alloc] initWithObjects:itemList, nil];
    }else{
        [self.itemList addObject:itemList];
    }

}

-(void)removeItemList:(NSMutableArray *)itemList{

    for (NSMutableArray *list in self.lists) {
        if (itemList == list) {
            [self.lists removeObject:list];
        }
    }
}

@end
