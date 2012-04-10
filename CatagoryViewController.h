//
//  CatagoryViewController.h
//  viaprive
//
//  Created by preet dhillon on 31/03/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalController.h"
#import "MBProgressHUD.h"
#import "XMLReader.h"
#import "DetailViewController.h"

#import "CatagoryView.h"
@interface CatagoryViewController : UIViewController<ModalDelegate>
{
    ModalController *modal;
    IBOutlet UIScrollView *scrollView;
    

}
@property(retain)NSString *stringTitle;

@property(retain)NSMutableArray *arrayProduct;
@end
