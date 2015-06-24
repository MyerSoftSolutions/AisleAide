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

-(Item*)outputItem:(int)aisleNum{
    Aisle *aisle = [self.aisleArray objectAtIndex:aisleNum - 1];
    ProductGroup *pGroup = [aisle.productGroups objectAtIndex:0];
    Item *item = [pGroup.items objectAtIndex:0];
    
    return item;
}

-(NSMutableArray*)alsoOnThisAisle:(Aisle*)aisle item:(Item*)item{
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:3];
    int k = 0;
    
    for (int i = 0; i < aisle.productGroups.count && k < 3; i++) {
        ProductGroup *pGroup = aisle.productGroups[i];
        
        int randomNum = arc4random_uniform((uint32_t)pGroup.items.count);
        Item *suggestedItem = pGroup.items[randomNum];
        
        if (suggestedItem == item) {
            continue;
        }else{
            [items addObject:suggestedItem];
            k++;
        }
    }
    
    return items;
}

-(NSMutableArray*)oneAisleOver:(Aisle*)aisle{
    NSMutableArray *items= [[NSMutableArray alloc] initWithCapacity:3];
    NSMutableArray *singleSuggesteditems= [[NSMutableArray alloc] initWithCapacity:3];
    NSMutableArray *doubleSuggestedItems= [[NSMutableArray alloc] initWithCapacity:4];

    
    int homeAisle = [aisle.aisleNumber intValue];
    int leftAisle = homeAisle - 1;
    int rightAisle = homeAisle + 1;
    
    int count = 1;
    
    if ((homeAisle - 1) == 0) {
        Aisle *aisleRight = [self.aisleArray objectAtIndex:rightAisle];
        items = [aisleRight getAllItems];
        
        while (count < 4) {
            
            int k = arc4random_uniform((uint32_t)[items count]);
            NSLog(@"Random%d IS...%d", count, k);

            [singleSuggesteditems addObject:items[k]];
            ++count;
        }
        return singleSuggesteditems;
        
    }else if(homeAisle == self.aisleArray.count){
        
        Aisle *aisleLeft = [self.aisleArray objectAtIndex:leftAisle];
        items = [aisleLeft getAllItems];
        
        while (count < 4) {
            
            int k = arc4random_uniform((uint32_t)[items count]);
            NSLog(@"Random%d IS...%d", count, k);
            
            [singleSuggesteditems addObject:items[k]];
            ++count;
        }
        return singleSuggesteditems;
    
    }else{
        Aisle *aisleLeft = [self.aisleArray objectAtIndex:leftAisle];
        items = [aisleLeft getAllItems];
        
        while (count < 3) {
            
            int k = arc4random_uniform((uint32_t)[items count]);
            NSLog(@"Random%d IS...%d", count, k);
            
            [doubleSuggestedItems addObject:items[k]];
            ++count;
        }
        
        count = 1;
        Aisle *aisleRight = [self.aisleArray objectAtIndex:rightAisle];
        items = [aisleRight getAllItems];
        
        while (count < 3) {
            
            int k = arc4random_uniform((uint32_t)[items count]);
            NSLog(@"Random%d IS...%d", count, k);
            
            [doubleSuggestedItems addObject:items[k]];
            ++count;
        }
        return doubleSuggestedItems;

    }
}

@end
