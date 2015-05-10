//
//  ViewController.m
//  IGApp
//
//  Created by Paul Webb on 08/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle
{
if((self=[super initWithNibName:nibName bundle:nibBundle]))
	{
    NSLog(@"initWithNibName");
    }
return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
if (self = [super initWithCoder:aDecoder])
    {
    mainModel=[[IGMainModel alloc]init];
    [mainModel createTerritories];
    [mainModel initialiseAccount];
    }

return self;
}



-(void) dealloc
{
[mainModel  dealloc];
[super dealloc];
}

- (void)didReceiveMemoryWarning
{
[super didReceiveMemoryWarning];
}

- (void)viewDidLoad
{
[super viewDidLoad];


scrollTopButton=[UIButton buttonWithType:UIButtonTypeCustom];
scrollTopButton.frame=[self buttonRect];
scrollTopButton.backgroundColor=[UIColor clearColor];
[scrollTopButton addTarget:self action:@selector(scrollTopAction:) forControlEvents:UIControlEventTouchUpInside];
[self.view addSubview:scrollTopButton];


accountView=[[IGSetUpAccountView alloc]initWithFrame:[self accountRect]];
accountView.dataSource=self;
accountView.delegate=self;
[accountView makeViews];
accountView.backgroundColor=[UIColor clearColor];
[self.view addSubview:accountView];
[accountView release];

[accountView updateViewsUsing:mainModel.userAccount];
[accountView checkAllFilledAndOkay];
}

-(CGRect)   buttonRect
{
float   wide=self.view.frame.size.width;

return CGRectMake(0,0,wide,20);
}

-(CGRect)   accountRect
{
float   wide=self.view.frame.size.width;
float   high=self.view.frame.size.height;

return CGRectMake(0,70,wide,high-70);
}

#pragma mark -  ACTIONS

-(void)     scrollTopAction:(id)sender
{
NSLog(@"scrollTopAction");
[accountView scrollToTop];
}





#pragma mark -  IGSetUpAccountViewDelegate
#pragma mark -  Set user account model info from the gui data


-(void)         doSignUp:(IGSetUpAccountView *)view 
{
NSString    *name=[view.nameField textValue];
NSString    *dateBirth=[view.dateBirthView dateValue];
NSString    *finaceInfo=[view.financeInfoView textValue];
NSString    *pastInfo=[view.pastInfoView textValue];

IGTurboTraderAccount    *userAccount=mainModel.userAccount;
IGTraderBasicInfo       *basicModel=[userAccount basicUserInfo];
IGTraderPastInfo        *pastModel=[userAccount pastUserInfo];
IGTraderFinanceInfo     *financeModel=[userAccount financeUserInfo];



[basicModel.userName       setString:name];
[basicModel.userDateBirth  setString:dateBirth];

[pastModel.pastInfo         setString:pastInfo];
[financeModel.financeInfo   setString:finaceInfo];

// here will use this URL for a test so get some data back
// would normally use a https: for a secure transmission

[userAccount sendCreateNewAccountData:@"http://date.jsontest.com" completionHandler:^(BOOL result,NSError *error) {
    
    NSLog(@"RESULT %@",error);
    
    
    // handle result
    // if okay would go to next screen
    
    if(error==nil)  [self showMessageAlert:@"OKAY AND SET UP"];
    else            [self showMessageAlert:@"SOMETHING WENT WRONG"];
    
    
       
    }];


}



-(void)     showMessageAlert:(NSString*)message
{
dispatch_async(dispatch_get_main_queue(), ^{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"RESULT" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
        });


}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
alertView=nil;
}




#pragma mark -  IGSetUpAccountView DATASOURCE

-(NSInteger)   numberOfCountries:(IGSetUpAccountView *)view
{
return [mainModel.territtoryManager numberTerrittories];
}

-(NSString*)   countryNameForRow:(IGSetUpAccountView *)view row:(NSInteger)row
{
return [mainModel.territtoryManager territoryNameAtIndex:row];
}

-(void)     didSelectCountryAtRow:(IGSetUpAccountView *)view row:(NSInteger)row
{
IGTerrittory    *territory=[mainModel.territtoryManager territoryAtIndex:row];
[mainModel.userAccount setTerrittoryInfo:territory];
[accountView updateViewsUsing:mainModel.userAccount];
}




@end
