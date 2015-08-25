//
//  AddMoreItemsViewController.m
//  AisleAide
//
//  Created by MobileApps on 8/24/15.
//  Copyright (c) 2015 MyerSoft. All rights reserved.
//

#import "AddMoreItemsViewController.h"

@interface AddMoreItemsViewController ()

@end

@implementation AddMoreItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)noPressed:(id)sender {
    
//    [self.delegate selectionMade:0];
//    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self dismissViewControllerAnimated:YES completion:^void (void){
    [self.delegate selectionMade:0];
    }];

}

- (IBAction)yesPressed:(id)sender {
//    [self.delegate selectionMade:1];
    
    [self dismissViewControllerAnimated:YES completion:^void (void){
        [self.delegate selectionMade:1];
    }];

}
@end
