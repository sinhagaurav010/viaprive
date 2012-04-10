//
//  CatagoryViewController.m
//  viaprive
//
//  Created by preet dhillon on 31/03/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

/*
 roductCatalog =     {
 Product =         (
 {
 BrandName = "Via Priv\U00e9";
 CurrentInventoryLevel = "-2";
 ImagePathMedium = "http://cdn-ecomm.dreamingcode.com/public/159/images/med_Lily_Bra_Grey_Back-159-6371-1.jpg";
 ImagePathSmall = "http://cdn-ecomm.dreamingcode.com/public/159/images/sm_Lily_Bra_Grey_Back-159-6371-1.jpg";
 LastUpdatedDateTime = "Feb  6 2012 04:39:53:000PM";
 ProductID = 77;
 ProductName = "Lily Bra";
 ProductOverviewHTML = "<span style=\"font-size: 11px;\">Fabric&amp; Care</span><ul><li><span style=\"font-size: 11px;\">Body: 90% Nylon, 10% Spandex</span></li><li><span style=\"font-size: 11px;\">Contrast: 90% Polyester, 10% Spandex</span></li><li><span style=\"font-size: 11px;\">100% Promodal</span></li><li><span style=\"font-size: 11px;\">Machine wash cold</span></li><li><span style=\"font-size: 11px;\">Tumble dry low</span></li><li><span style=\"font-size: 11px;\">Do not bleach</span></li></ul><br /><span style=\"font-size: 11px;\">Specifications</span><ul><li><span style=\"font-size: 11px;\">A classic shape with ample support</span></li><li><span style=\"font-size: 11px;\">ProModal lining controls moisture and provides softness, the perfect blend of performance and comfort</span></li><li><span style=\"font-size: 11px;\">Mesh panel on back for breathability</span></li><li><span style=\"font-size: 11px;\">Eco-stretch printed interior</span></li></ul><br />";
 ProductSpecificationsHTML = "<img alt=\"\"src=\"http://cdn-ecomm.dreamingcode.com/public/159/images/Final_Size_Chart-159-7225-1.jpg\"style=\"width: 410px; height: 315px;\"/><br />";
 ProductStatusName = "On Back Order";
 RetailPrice = 38;
 ShortDescription = "Hop, skip, or jump to your next workout in our most supportive, moisture wicking sports bra! ProModal&reg; fabric lines the Lily Bra - providing softness and managing moisture - the perfect combination of performance and comfort. A mesh panel on the back allows for maximum breathability and eliminates those soggy cool-downs. Wear the Lily Bra under any Via Priv&eacute; top for a clean, sporty look.<br><br><b>*PLEASE NOTE: This bra runs small, if you think you are a size Small, please order a size Medium.*</b>";
 },
 */
#import "CatagoryViewController.h"

@implementation CatagoryViewController
@synthesize arrayProduct,stringTitle;

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
    NSLog(@"%s",__PRETTY_FUNCTION__);
    
    
    self.navigationItem.title = self.stringTitle;
    
    self.view.backgroundColor=  [UIColor  blackColor];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hud.labelText = @"Loading...";
    
    self.navigationController.navigationBar.barStyle    = UIBarStyleBlackTranslucent;

    modal = [[ModalController alloc] init];
    modal.delegate = self;
    [modal sendTheRequestWithPostString:nil withURLString:URLXML];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)getdata
{
    [MBProgressHUD  hideHUDForView:self.navigationController.view animated:YES  ];
    
    
    if([[[XMLReader  dictionaryForXMLData:modal.dataXml error:nil] objectForKey:ksPRODUCTCAT] objectForKey:ksProduct])
    {
        if([[[[XMLReader  dictionaryForXMLData:modal.dataXml error:nil] objectForKey:ksPRODUCTCAT] objectForKey:ksProduct] isKindOfClass:[NSDictionary  class]])
        {
            arrayProduct = [[NSMutableArray  alloc] init];
            [arrayProduct addObject:[[[XMLReader  dictionaryForXMLData:modal.dataXml error:nil] objectForKey:ksPRODUCTCAT] objectForKey:ksProduct]];
        }
        else
            arrayProduct = [[NSMutableArray  alloc] initWithArray:[[[XMLReader  dictionaryForXMLData:modal.dataXml error:nil] objectForKey:ksPRODUCTCAT] objectForKey:ksProduct]];  
    }
    
    NSLog(@"%@",arrayProduct);
    
    if([arrayProduct count])
    {
        int incX = 20;
        int incY = 20;
        [scrollView setContentSize:CGSizeMake(768, (20+300)*([arrayProduct  count]/3)+50)];
        
        for(int i=0;i<[self.arrayProduct  count];i++)
        {
            if(i%3==0 && i!= 0)
            {
                incX = 20;
                incY +=320;
            }
            CatagoryView *catagoryview = [[CatagoryView alloc] init];
            
            //    self.viewEA.delegateExp = self;
            
                       
            
            NSArray* bundle = [[NSBundle mainBundle] loadNibNamed:@"CatagoryView"
                                                   owner:catagoryview 
                                                 options:nil];
            
            
            for (id object in bundle) {
                if ([object isKindOfClass:[catagoryview class]])
                    catagoryview = (CatagoryView *)object;
            } 
            
//            catagoryview.layer.cornerRadius = 0.0;
//            catagoryview.layer.borderColor = [[UIColor blackColor] CGColor];
//            catagoryview.layer.borderWidth = 3.0;

            
            UITapGestureRecognizer* longPressGesture = [[UITapGestureRecognizer alloc]
                                                        initWithTarget:self
                                                        action:@selector(handleTapGesture:)];
            catagoryview.tag = i;
            
            //longPressGesture.minimumPressDuration = 2.0;
            [catagoryview addGestureRecognizer:longPressGesture];

            catagoryview.frame = CGRectMake(incX, incY, 229, 300);
            [catagoryview setName:[[self.arrayProduct  objectAtIndex:i] objectForKey:ksProductName]];
            if([[self.arrayProduct  objectAtIndex:i] objectForKey:ksRetailPrice])
                [catagoryview   setPrice:[NSString stringWithFormat:@"$%@",[[self.arrayProduct  objectAtIndex:i] objectForKey:ksRetailPrice]]];
            else
                [catagoryview   setPrice:[NSString stringWithFormat:@"$0"]];
            
            [catagoryview  setProductImage:[NSURL  URLWithString:[[self.arrayProduct  objectAtIndex:i] objectForKey:ksImagePathMedium]]];

            [scrollView addSubview:catagoryview];
            
            incX += 249;
            
        }
    }
}

-(void)handleTapGesture:(UITapGestureRecognizer*)sender 
{
    DetailViewController *DetailController = [[DetailViewController alloc] init];
    DetailController.dictDetail = [[NSMutableDictionary  alloc] initWithDictionary:[arrayProduct objectAtIndex:sender.view.tag]];
    [self.navigationController pushViewController:DetailController animated:YES];
    
}

-(void)getError
{
    [ModalController  FuncAlertMsg:@"Error in network" inController:self];
    [MBProgressHUD  hideHUDForView:self.navigationController.view animated:YES  ];
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
