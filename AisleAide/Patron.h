//
//  Patron.h
//  AisleAide
//
//  Created by MyerSoft Solutions on 3/20/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Patron : NSObject

-(id)initWithName:(NSString *)name
           userID:(int)userID;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *userID;
@property (strong, nonatomic) NSMutableArray *itemList;
@property (strong, nonatomic) NSMutableArray *lists;


@end
