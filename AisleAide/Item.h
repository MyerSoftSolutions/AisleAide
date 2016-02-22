//
//  Item.h
//  AisleAide
//
//  Created by Joel Myers on 3/4/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Aisle.h"
#import "ProductGroup.h"

@interface Item : NSObject

-(id)initWithName:(NSString *)name prodGroup:(ProductGroup*)prodGroup aisle:(Aisle*)aisle;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) ProductGroup *productGroup;
@property (strong, nonatomic) Aisle *aisle;
@property (strong, nonatomic) NSNumber *aisleNum;

@end
