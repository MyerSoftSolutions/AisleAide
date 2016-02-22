//
//  AisleAideSetupViewController.m
//  AisleAide
//
//  Created by MobileApps on 8/3/15.
//  Copyright © 2015 MyerSoft. All rights reserved.
//

#import "AisleAideSetupViewController.h"

@interface AisleAideSetupViewController ()

@end

@implementation AisleAideSetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}

-(void)createCustomBackButton:(NSString*)btnTitle{
    self.backBtn = [[UIBarButtonItem alloc] initWithTitle:btnTitle style:UIBarButtonItemStylePlain target:self action:@selector(navigationBackButtonClicked:)];
    self.navigationItem.leftBarButtonItem = self.backBtn;
}

-(void)navigationBackButtonClicked:(UIBarButtonItem *)sender{

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

@end
