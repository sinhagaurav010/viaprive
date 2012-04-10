//
//  DetailViewController.h
//  viaprive
//
//  Created by preet dhillon on 31/03/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"
#import "Constant.h"
#import "ModalController.h"
@interface DetailViewController : UIViewController
{
    IBOutlet UILabel *lableBrandName;
    IBOutlet UILabel *lableProductName;
    IBOutlet UILabel *lableLastUpdatedDateTime;
    
    IBOutlet EGOImageView *imageProduct;
    IBOutlet UILabel *lableRetailPrice;
    IBOutlet UIWebView *webViewDetail;
    IBOutlet UIWebView *webViewOverView;
    IBOutlet UIWebView *webviewProductHtml;

}
-(void)setDetail:(UIWebView *)webView withHtml:(NSString *)stringHtml;

@property(retain)NSMutableDictionary *dictDetail;
@end
