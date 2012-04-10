//
//  HomeViewController.h
//  viaprive
//
//  Created by preet dhillon on 30/03/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalController.h"
#import "Constant.h"
#import "CatagoryViewController.h"

@interface HomeViewController : UIViewController
{
    IBOutlet UITableView *tableViewHome;
    NSMutableArray *arrayHome;
}
@end
