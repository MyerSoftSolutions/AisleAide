//
//  Store.m
//  AisleAide
//
//  Created by MyerSoft Solutions on 3/25/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import "Store.h"
#import "Aisle.h"
#import "ProductGroup.h"
#import "Item.h"
#import "AisleList.h"

@implementation Store

@synthesize aisleList;

+ (id)sharedStore {
    static Store *sharedStore = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedStore = [[self alloc] init];
    });
    return sharedStore;
}

- (id)init{
    if (self = [super init]) {
        self.aisleList = [[AisleList alloc] init];
    }
    return self;
}


-(void)createAisleList:(NSString*)storeName{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:storeName ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    NSArray *aisles = [dict objectForKey:@"Aisles"];
    
    int i = 1;
    for (NSDictionary *dict in aisles) {
        Aisle *aisle = [[Aisle alloc] initWithNumber:i];
        
        NSArray *prdGrp = [dict objectForKey:@"ProductGroups"];
        for (NSDictionary *diction in prdGrp) {
            ProductGroup *pG = [[ProductGroup alloc] initWithName:[diction objectForKey:@"name"] aisle:aisle];
            
            NSArray *pgItems = [diction objectForKey:@"Items"];
            for (NSDictionary *dict in pgItems) {
                Item *item = [[Item alloc] initWithName:[dict objectForKey:@"name"] prodGroup:pG aisle:aisle];
                item.aisleNum = [NSNumber numberWithInt:i];
                
                [pG.items addObject:item];
            }
            
            [aisle.productGroups addObject:pG];
        }
        [self.aisleList.aisleArray addObject:aisle];
        i++;
    }
    self.numOfAisles = [NSNumber numberWithInteger:self.aisleList.aisleArray.count];
}

@end
