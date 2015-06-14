//
//  Store.h
//  AisleAide
//
//  Created by MyerSoft Solutions on 3/25/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AisleList;

@interface Store : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSNumber *numOfAisles;

@property (strong, nonatomic) AisleList *aisleList;

+(id)sharedStore;

-(void)createAisleList:(NSString*)storeName;

@end
