//
//  AisleListViewController.m
//  AisleAide
//
//  Created by MyerSoft Solutions on 5/10/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import "ItemListViewController.h"
#import "ItemTableViewCell.h"
#import "Item.h"
#import "Store.h"

@interface ItemListViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ItemListViewController
BOOL rowPressed;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.itemArray = [[NSMutableArray alloc] init];
    
    Store *store = [Store sharedStore];
    
    store.name = @"Kroger";
    [store createAisleList:@"StoreModel"];
    
    [self.itemArray addObject:[store.aisleList outputItem:5]];
    [self.itemArray addObject:[store.aisleList outputItem:6]];
    [self.itemArray addObject:[store.aisleList outputItem:1]];
    [self.itemArray addObject:[store.aisleList outputItem:3]];
    [self.itemArray addObject:[store.aisleList outputItem:2]];
    
    
    NSSortDescriptor *sortAisle = [[NSSortDescriptor alloc] initWithKey:@"aisleNum" ascending:YES];
    [self.itemArray sortUsingDescriptors:[NSArray arrayWithObject:sortAisle]];
    
    NSLog(@"Item Array contents: %@", self.itemArray);
    self.itemCountLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)self.itemArray.count];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)sortItemArray:(NSMutableArray*)list{
    }

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    if (rowPressed) {
//        return 1;
//    }else{
        return self.itemArray.count;
//    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"ItemCell";
    
    ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    Item *item = [self.itemArray objectAtIndex:indexPath.row];
    
    cell.itemLabel.text = item.name;
    cell.aisleLabel.text = [item.aisle.aisleNumber stringValue];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
