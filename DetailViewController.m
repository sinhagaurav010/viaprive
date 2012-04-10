//
//  DetailViewController.m
//  viaprive
//
//  Created by preet dhillon on 31/03/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController
@synthesize dictDetail;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.navigationItem.title = @"Detail";

    webViewDetail.backgroundColor = [UIColor  clearColor];
    webViewDetail.opaque =  NO;
//    NSLog(@"---->>>>>>>%@",self.dictDetail);
    
    lableLastUpdatedDateTime.text = [self.dictDetail objectForKey:ksLastUpdatedDateTime];
    lableLastUpdatedDateTime.textColor = [UIColor  orangeColor  ];

    
    lableBrandName.text = [self.dictDetail objectForKey:ksProductName];
    lableBrandName.textColor = [UIColor  orangeColor  ];
    
    
    lableRetailPrice.text = [NSString stringWithFormat:@"$%@",[self.dictDetail objectForKey:ksRetailPrice]];
    lableRetailPrice.textColor = [UIColor  orangeColor  ];
    
    imageProduct.imageURL = [NSURL URLWithString:[self.dictDetail objectForKey:ksImagePathMedium]];
    
    
    [self setDetail:webViewDetail withHtml:[NSString stringWithFormat:@"<html><head><style type='text/css'>body { color:#FFFFFF; background-color: #000000; }</style></head><body>%@</body></html>",[self.dictDetail objectForKey:ksShortDescription]]];
    [self setDetail:webviewProductHtml withHtml:[self.dictDetail objectForKey:@"ProductSpecificationsHTML"]];
    [self setDetail:webViewOverView withHtml:[self.dictDetail objectForKey:ksProductOverviewHTML]];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)setDetail:(UIWebView *)webView withHtml:(NSString *)stringHtml
{
    [webView loadHTMLString:stringHtml baseURL:nil];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
