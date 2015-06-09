//
//  ViewController.m
//  AisleAide
//
//  Created by Joel Myers on 3/4/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import "ViewController.h"
#import "Store.h"
#import "AisleList.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Store *store = [[Store alloc] init];

    store.name = @"Kroger";
    [store createAisleList:@"StoreModel"];
    store.numOfAisles = [NSNumber numberWithInteger:store.aisleList.aisleArray.count];
    
    NSLog(@"Store AisleList: %@", store.aisleList);
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
