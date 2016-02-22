//
//  AisleListViewController.m
//  AisleAide
//
//  Created by MyerSoft Solutions on 5/10/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import "ItemListViewController.h"
#import "ItemTableViewCell.h"
#import "AlsoOnItemTableViewCell.h"
#import "AisleOverItemTableViewCell.h"
#import "Item.h"
#import "Store.h"
#import "ProdGrpCollectionViewController.h"

@interface ItemListViewController ()<UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) NSMutableArray *currentItemListCopy;
@end

BOOL rowPressed;
NSMutableArray *alsoOnThisArray, *oneAisleOverArray, *indexPaths;
NSInteger selectedRow;
int i;
@implementation ItemListViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.itemArray = [[NSMutableArray alloc] init];
    alsoOnThisArray = [[NSMutableArray alloc] init];
    oneAisleOverArray = [[NSMutableArray alloc] init];
    self.currentItemListCopy = [[NSMutableArray alloc] init];
    
    self.itemArray = [self.lyle.currentItemList getItemList];
    self.title = @"My ItemList";
    
    [self createCustomBackButton:@"+Add Item" ];
    
    NSSortDescriptor *sortAisle = [[NSSortDescriptor alloc] initWithKey:@"aisleNum" ascending:YES];
    [self.itemArray sortUsingDescriptors:[NSArray arrayWithObject:sortAisle]];
    
    NSLog(@"Item Array contents: %@", self.itemArray);
    self.itemCountLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)self.itemArray.count];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

-(void)navigationBackButtonClicked:(UIBarButtonItem *)sender {
    ProdGrpCollectionViewController *prodVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProdGrpCollectionViewController"];
    prodVC.lyle = self.lyle;
    
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count - 1] animated:NO];
    [self.navigationController pushViewController:prodVC animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)sortItemArray:(NSMutableArray*)list{
    }

#pragma mark - TableView Delegate Methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (rowPressed) {
        return self.currentItemListCopy.count;
    }else{
        return self.itemArray.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"ItemCell";
    static NSString *AlsoOnCellIdentifier = @"AlsoOnCell";
    static NSString *AisleOverCellIdentifier = @"AisleOverCell";
    
    ItemTableViewCell *cell;
    
    if (rowPressed) {
        
        if (indexPath.row >= (selectedRow +1) && indexPath.row <= (selectedRow + 6)) {
            if ( indexPath.row == (selectedRow + 1)) {
                cell = (AlsoOnItemTableViewCell *) [tableView dequeueReusableCellWithIdentifier:AlsoOnCellIdentifier];
                Item *item = [self.currentItemListCopy objectAtIndex:indexPath.row];
                
                cell.itemLabel.text = item.name;
                cell.aisleLabel.text = [item.aisle.aisleNumber stringValue];
            } else if ( indexPath.row == (selectedRow + 2)) {
                cell = (AlsoOnItemTableViewCell *) [tableView dequeueReusableCellWithIdentifier:AlsoOnCellIdentifier];
                Item *item = [self.currentItemListCopy objectAtIndex:indexPath.row];
                
                cell.itemLabel.text = item.name;
                cell.aisleLabel.text = [item.aisle.aisleNumber stringValue];
            } else if ( indexPath.row == (selectedRow + 3)) {
                cell = (AlsoOnItemTableViewCell *) [tableView dequeueReusableCellWithIdentifier:AlsoOnCellIdentifier];
                Item *item = [self.currentItemListCopy objectAtIndex:indexPath.row];
                
                cell.itemLabel.text = item.name;
                cell.aisleLabel.text = [item.aisle.aisleNumber stringValue];
            } else if ( indexPath.row == (selectedRow + 4)) {
                cell = (AisleOverItemTableViewCell *) [tableView dequeueReusableCellWithIdentifier:AisleOverCellIdentifier];
                Item *item = [self.currentItemListCopy objectAtIndex:indexPath.row];
                
                cell.itemLabel.text = item.name;
                cell.aisleLabel.text = [item.aisle.aisleNumber stringValue];
            } else if ( indexPath.row == (selectedRow + 5)) {
                cell = (AisleOverItemTableViewCell *) [tableView dequeueReusableCellWithIdentifier:AisleOverCellIdentifier];
                Item *item = [self.currentItemListCopy objectAtIndex:indexPath.row];
                
                cell.itemLabel.text = item.name;
                cell.aisleLabel.text = [item.aisle.aisleNumber stringValue];
            } else if ( indexPath.row == (selectedRow + 6)) {
                cell = (AisleOverItemTableViewCell *) [tableView dequeueReusableCellWithIdentifier:AisleOverCellIdentifier];
                Item *item = [self.currentItemListCopy objectAtIndex:indexPath.row];
                
                cell.itemLabel.text = item.name;
                cell.aisleLabel.text = [item.aisle.aisleNumber stringValue];
            }
            
            return cell;
        } else{
        
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            Item *item = [self.currentItemListCopy objectAtIndex:indexPath.row];
            
            cell.itemLabel.text = item.name;
            cell.aisleLabel.text = [item.aisle.aisleNumber stringValue];
            
            return cell;
        }
    }else{
    
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        Item *item = [self.itemArray objectAtIndex:indexPath.row];
        
        cell.itemLabel.text = item.name;
        cell.aisleLabel.text = [item.aisle.aisleNumber stringValue];
        
        return cell;
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (!rowPressed) {
        
        Item *item = [self.itemArray objectAtIndex:indexPath.row];
        
        alsoOnThisArray = [self.lyle.currentStore.aisleList alsoOnThisAisle:item.aisle item:item userItemArray:self.itemArray];
        
        for (Item *item in alsoOnThisArray) {
            NSLog(@"ALSO %@", item.name);
        }
        oneAisleOverArray = [self.lyle.currentStore.aisleList oneAisleOver:item.aisle userItemArray:self.itemArray];
        
        for (Item *item in oneAisleOverArray) {
            NSLog(@"ONE OVER %@", item.name);
        }
        
        rowPressed = YES;
        selectedRow = [indexPath row];
        NSInteger section = [indexPath section];
        indexPaths = [[NSMutableArray alloc] init];
        
        for (int i = 1;  i < 7; i++) {
            NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:selectedRow+i inSection:section];
            [indexPaths addObject:newIndexPath];
        }
        
        //Copy the Item list at the time of the row press
        self.currentItemListCopy = (NSMutableArray*)[self.itemArray mutableCopy];
        
        //Insert into the copycurrenctItemList the 6 Suggested Items --> From row + i (i = 1) ; i < 7
        for (int i = 1, k = 1; i < 7; i++) {
            if (i < 4) {
                [self.currentItemListCopy insertObject:[alsoOnThisArray objectAtIndex: i - 1] atIndex:selectedRow + i];
            }else{
                [self.currentItemListCopy insertObject:[oneAisleOverArray objectAtIndex: k - 1] atIndex:selectedRow + i];
                k++;
            }
        }
        
        [tableView beginUpdates];
        [tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
        [tableView endUpdates];
        
        [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    } else if (rowPressed) {
        //If the same row that presented the suggestions is pressed, Remove the suggested Items from the currentItemListCopy array
        if (indexPath.row == selectedRow) {
           
            Item *item = [Item new];
            [self.currentItemListCopy removeObject:item inRange:NSMakeRange(selectedRow + 1, 6)];
            Item *selectedItem = (Item *)[self.currentItemListCopy objectAtIndex:selectedRow];
            NSLog(@"-->%@", selectedItem.name);
            
            rowPressed = NO;
            [tableView reloadData];
        }
    }
}

@end
