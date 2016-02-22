//
//  AisleList.h
//  AisleAide
//
//  Created by MyerSoft Solutions on 3/25/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Aisle.h"
#import "Item.h"
#import "ItemList.h"

@interface AisleList : NSObject

@property (strong, nonatomic) NSMutableArray *aisleArray;

-(NSMutableArray*)alsoOnThisAisle:(Aisle*)aisle item:(Item*)item userItemArray:(NSMutableArray*)itemArray;

-(NSMutableArray*)oneAisleOver:(Aisle*)aisle userItemArray:(NSMutableArray*)itemArray;

-(NSMutableArray*)getAllProdGrps;
//-(Item*)outputItem:(int)aisleNum;
@end
