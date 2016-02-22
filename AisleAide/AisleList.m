//
//  AisleList.m
//  AisleAide
//
//  Created by MyerSoft Solutions on 3/25/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import "AisleList.h"
#import "Aisle.h"
#import "ProductGroup.h"
#import "Item.h"

@implementation AisleList

-(instancetype)init{
    self = [super init];
    if (self) {
        _aisleArray = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSMutableArray*)getAllProdGrps{
    
    NSMutableArray *arr = [NSMutableArray new];
    
    for (Aisle *aisle in self.aisleArray) {
        for (ProductGroup *prdGrp in aisle.productGroups) {
            [arr addObject:prdGrp];
        }
    }
    
    //Sort arr alphabetically
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    [arr sortUsingDescriptors:[NSArray arrayWithObject:descriptor]];
    
    return arr;
    
}

//-(Item*)outputItem:(int)aisleNum{
//    Aisle *aisle = [self.aisleArray objectAtIndex:aisleNum - 1];
//    ProductGroup *pGroup = [aisle.productGroups objectAtIndex:0];
//    Item *item = [pGroup.items objectAtIndex:0];
//    
//    return item;
//}

-(BOOL)isItemInArray:(NSMutableArray*)itemArray item:(Item*)suggestedItem{
    BOOL isInArray = NO;
    
    for (Item *item in itemArray) {
        if (item == suggestedItem) {
            isInArray = YES;
        }
    }
    return isInArray;
}

-(NSMutableArray*)alsoOnThisAisle:(Aisle*)aisle item:(Item*)item userItemArray:(NSMutableArray*)itemArray{
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:3];
    
    for (int k = 0; k < 3; k++) {
        int randomNum = arc4random_uniform((uint32_t)aisle.productGroups.count);
        ProductGroup *pGroup = aisle.productGroups[randomNum];
        
        int randomNum2 = arc4random_uniform((uint32_t)pGroup.items.count);
        Item *suggestedItem = pGroup.items[randomNum2];
        
        if (suggestedItem == item || [self isItemInArray:items item:suggestedItem] || [self isItemInArray:itemArray item:suggestedItem]) {
            k--;
            continue;
        }else{
            [items addObject:suggestedItem];
        }
    }
    
    return items;
}

-(NSMutableArray*)oneAisleOver:(Aisle*)aisle userItemArray:(NSMutableArray*)itemArray{
    NSMutableArray *items= [[NSMutableArray alloc] init];
    NSMutableArray *singleSuggestedItems= [[NSMutableArray alloc] init];
    NSMutableArray *doubleSuggestedItems= [[NSMutableArray alloc] init];
    
    int homeAisle = [aisle.aisleNumber intValue] - 1;
    int leftAisle = homeAisle - 1;
    int rightAisle = homeAisle + 1;
    
    int count = 1;
    
    if ((homeAisle) == 0) {
        Aisle *aisleRight = [self.aisleArray objectAtIndex:rightAisle];
        items = [aisleRight getAllItems];
        
        while (count < 4) {
            
            int k = arc4random_uniform((uint32_t)[items count]);
            Item *suggestedItem = items[k];

            if ( [self isItemInArray:itemArray item:suggestedItem]) {
                continue;
            } else {
                [singleSuggestedItems addObject:suggestedItem];
                ++count;
            }
        }
        return singleSuggestedItems;
        
    }else if( (homeAisle + 1) == self.aisleArray.count){
        
        Aisle *aisleLeft = [self.aisleArray objectAtIndex:leftAisle];
        items = [aisleLeft getAllItems];
        
        while (count < 4) {
            
            int k = arc4random_uniform((uint32_t)[items count]);
            Item *suggestedItem = items[k];
            
            if ( [self isItemInArray:itemArray item:suggestedItem]) {
                continue;
            } else {
                [singleSuggestedItems addObject:suggestedItem];
                ++count;
            }
        }
        return singleSuggestedItems;
    
    }else{
        Aisle *aisleLeft = [self.aisleArray objectAtIndex:leftAisle];
        items = [aisleLeft getAllItems];
        
        while (count < 3) {
            
            int k = arc4random_uniform((uint32_t)[items count]);
            Item *suggestedItem = items[k];
            
            if ( [self isItemInArray:itemArray item:suggestedItem] ) {
                continue;
            } else {
                [doubleSuggestedItems addObject:suggestedItem];
                ++count;
            }
        }
        
        Aisle *aisleRight = [self.aisleArray objectAtIndex:rightAisle];
        items = [aisleRight getAllItems];

        int k = arc4random_uniform((uint32_t)[items count]);
        
        [doubleSuggestedItems addObject:items[k]];
        ++count;
     
        return doubleSuggestedItems;
    }
}

@end
