//
//  ProdGrpCollectionViewController.m
//  AisleAide
//
//  Created by MobileApps on 5/28/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import "ProdGrpCollectionViewController.h"
#import "ProdGrpCollectionViewCell.h"
#import "Store.h"

@interface ProdGrpCollectionViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *prodGrps;

@end

@implementation ProdGrpCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.prodGrps = [[NSMutableArray alloc] init];
    
    Store *store = [Store sharedStore];
    
    store.name = @"Kroger";
    [store createAisleList:@"StoreModel"];
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
    
    return cell;
    
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
