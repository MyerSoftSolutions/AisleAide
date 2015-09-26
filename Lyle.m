//
//  Lyle.m
//  AisleAide
//
//  Created by MobileApps on 9/26/15.
//  Copyright © 2015 MyerSoft. All rights reserved.
//

#import "Lyle.h"

@implementation Lyle

- (id)init{
    self = [super init];
    if (self == nil) {
        self = [[Lyle alloc] init];
    }
    return self;
}

+(id)defaultHelper{
    
    static Lyle *defautHelper = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
         defautHelper = [[self alloc] init];
    });
    return defautHelper;

}

@end
