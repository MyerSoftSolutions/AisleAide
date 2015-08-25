//
//  ProdGrpCollectionViewController.m
//  AisleAide
//
//  Created by MyerSoft Solutions on 5/28/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import "ProdGrpCollectionViewController.h"
#import "ProdGrpCollectionViewCell.h"
#import "Store.h"
#import "ProductGroup.h"
#import "AisleList.h"
#import "ItemCollectionViewController.h"
#import "ItemCollectionViewCell.h"

@interface ProdGrpCollectionViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
//@property (strong, nonatomic) NSMutableArray *prodGrps;
@property (strong, nonatomic) AisleList *aisleList;

@end

@implementation ProdGrpCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.prodGrps = [[NSMutableArray alloc] init];
    
    Store *store = [Store sharedStore];
    
    store.name = @"Kroger";
    [store createAisleList:@"StoreModel"];
    
    self.aisleList = store.aisleList;
   
    self.prodGrps = [store.aisleList getAllProdGrps];
    
    [self.collectionView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.prodGrps.count;

}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    ProdGrpCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProdGrpCollectionViewCell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[ProdGrpCollectionViewCell alloc] init];
    }
    
    ProductGroup *prodGp = (ProductGroup*)[self.prodGrps objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = prodGp.name;
    
    return cell;
    
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];

    ItemCollectionViewCell *cell = (ItemCollectionViewCell*)sender;
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    
    ProductGroup *pGrp = [self.prodGrps objectAtIndex:indexPath.row];

    if ([segue.identifier isEqualToString:@"SelectItemSegue"]) {
        ItemCollectionViewController *vc = segue.destinationViewController;
        vc.itemArray = [NSMutableArray new];
        vc.itemArray = [pGrp.items copy];
        
    }

}


@end
