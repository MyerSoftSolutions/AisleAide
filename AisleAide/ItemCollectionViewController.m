//
//  ItemCollectionViewController.m
//  AisleAide
//
//  Created by MobileApps on 8/2/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import "ItemCollectionViewController.h"
#import "ItemCollectionViewCell.h"
#import "Item.h"
#import "ItemListViewController.h"
#import "AddMoreItemsViewController.h"
#import "ProdGrpCollectionViewController.h"


@interface ItemCollectionViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, AddMoreItemsDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end

Item *selectedItem;
BOOL itemAlreadyExists;
@implementation ItemCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    itemAlreadyExists = NO;
//    self.itemArray = [[NSMutableArray alloc] init];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [self.itemArray count];
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ItemCollectionViewCell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[ItemCollectionViewCell alloc] init];
    }
    
    Item *item = (Item*)[self.itemArray objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = [item name];
    
    return cell;
    
}

-(void)collectionView:(nonnull UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath{

    selectedItem = (Item*) [self.itemArray objectAtIndex:indexPath.row];
    
    if ( [self isItemInArray:self.lyle.currentItemList.itemArray item:selectedItem]) {
        itemAlreadyExists = YES;
        [self shouldPerformSegueWithIdentifier:@"AddMoreItemsSegue" sender:self];
    } else{
        [self.lyle addSelectedItem:selectedItem];
        AddMoreItemsViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"AddMoreItemsViewController"];
        vc.addItemsDelegate = self;
        vc.lyle = self.lyle;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

-(BOOL)isItemInArray:(NSMutableArray*)itemArray item:(Item*)suggestedItem{
    BOOL isInArray = NO;
    
    for (Item *item in itemArray) {
        if (item == suggestedItem) {
            isInArray = YES;
        }
    }
    return isInArray;
}
#pragma mark - AddMoreItemsDelegate Method

-(void)selectionMade:(int)choice{
    
    switch (choice) {
            //Have lyle add the selectedItem to the currentItemList
        case 0:
            [self performSegueWithIdentifier:@"ShowListSegue" sender:self];
            break;
        case 1:
            [self performSegueWithIdentifier:@"MoreItemsSegue" sender:self];
            break;
        default:
            break;
    }
}

#pragma mark - Navigation

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{

    if ([identifier isEqualToString:@"AddMoreItemsSegue"] && itemAlreadyExists) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Duplicate Item" message:@"This item is already in  your ItemList" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        alert.alertViewStyle = UIAlertViewStyleDefault;
        
        [alert show];
    
        return NO;
    }else{
        return YES;
    }
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"AddMoreItemsSegue"]) {
    
        AddMoreItemsViewController *addVC = (AddMoreItemsViewController*) segue.destinationViewController;
        
        addVC.addItemsDelegate = self;
        addVC.lyle = self.lyle;
        
    }else if([segue.identifier isEqualToString:@"ShowListSegue"]){
    
        ItemListViewController *listVC = (ItemListViewController*)segue.destinationViewController;
        listVC.lyle = self.lyle;
        
    }else if([segue.identifier isEqualToString:@"MoreItemsSegue"]){
    
        ProdGrpCollectionViewController *prdGrpVC = (ProdGrpCollectionViewController*)segue.destinationViewController;
        prdGrpVC.lyle = self.lyle;
    }
        
}


@end
