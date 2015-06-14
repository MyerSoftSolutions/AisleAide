//
//  ProductGroup.h
//  AisleAide
//
//  Created by MyerSoft Solutions on 3/25/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Aisle;

@interface ProductGroup : NSObject

-(id)initWithName:(NSString *)name
            aisle:(Aisle *)aisle;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) Aisle *aisle;
@property (nonatomic, strong) NSMutableArray *items;

@end
