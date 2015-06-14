//
//  Aisle.h
//  AisleAide
//
//  Created by MyerSoft Solutions on 3/20/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Aisle : NSObject

-(id)initWithNumber:(int)number;


@property (strong, nonatomic) NSNumber *aisleNumber;
@property (strong, nonatomic) NSMutableArray *productGroups;

-(NSMutableArray*)getAllItems;

@end
