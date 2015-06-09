//
//  AisleList.h
//  AisleAide
//
//  Created by MobileApps on 3/25/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Aisle.h"
#import "Item.h"

@interface AisleList : NSObject

@property (strong, nonatomic) NSMutableArray *aisleArray;

-(NSMutableArray*)alsoOnThisAisle:(Aisle*)aisle item:(Item*)item;

-(NSMutableArray*)oneAisleOver:(Aisle*)aisle;

-(Item*)outputItem:(int)aisleNum;
@end
