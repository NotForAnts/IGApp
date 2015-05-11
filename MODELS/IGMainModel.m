//
//  IGMainModel.m
//  IGApp
//
//  Created by Paul Webb on 08/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import "IGMainModel.h"

@implementation IGMainModel

@synthesize territtoryManager;
@synthesize userAccount;

// CONSTRUCTOR / DECONSTRUCT
-(id)   init
{
if(self=[super init])
    {
    userAccount=[[IGTurboTraderAccount alloc]init];
    territtoryManager=[[IGTerrittoriesManager alloc]init];
    }
return self;
}


-(void) dealloc
{
[territtoryManager dealloc];
[super dealloc];
}

-(void) initialiseAccount
{
[userAccount setTerrittoryInfo:[territtoryManager defaultTerritory]];
}



-(void) createTerritories
{
IGTerrittory        *territory;

territory=[[IGTerrittory alloc]init];
[territory setLocationName:@"GB"];
[territory addRequiredDataType:@"IGTraderBasicInfo"];
[territtoryManager addNewTerritory:territory];
[territory release];

territory=[[IGTerrittory alloc]init];
[territory setLocationName:@"USA"];
[territory addRequiredDataType:@"IGTraderBasicInfo"];
[territory addRequiredDataType:@"IGTraderPastInfo"];
[territtoryManager addNewTerritory:territory];
[territory release];


territory=[[IGTerrittory alloc]init];
[territory setLocationName:@"Germany"];
[territory addRequiredDataType:@"IGTraderBasicInfo"];
[territory addRequiredDataType:@"IGTraderFinanceInfo"];
[territtoryManager addNewTerritory:territory];
[territory release];


// TEST
//territory=[[IGTerrittory alloc]init];
//[territory setLocationName:@"Spain"];
//[territory addRequiredDataType:@"IGTraderBasicInfo"];
//[territory addRequiredDataType:@"IGTraderPastInfo"];
//[territory addRequiredDataType:@"IGTraderFinanceInfo"];
//[territtoryManager addNewTerritory:territory];
//[territory release];


// TEST
//territory=[[IGTerrittory alloc]init];
//[territory setLocationName:@"Another Country"];
//[territory addRequiredDataType:@"IGTraderBasicInfo"];
//[territory addRequiredDataType:@"IGTraderPastInfo"];
//[territory addRequiredDataType:@"IGTraderFinanceInfo"];
//[territory addRequiredDataType:@"IGTraderNEWDATAMODEL"];  // <--  IGTraderNEWDATAMODEL if needed then would need a IGView for its data input added to the
// IGSetUpAccountView
//[territtoryManager addNewTerritory:territory];
//[territory release];

// this could be redesigned so if needed a new data model
// say IGTraderNEWDATAMODEL
// - the interface for entering it's info could be defined from componants
//
// IGTraderNEWDATAMODELViewInput addField:@"IGFieldInputView" dataType:@"Integer" KVCModel:@"Age valid:NSMakeRange(21,65)]" - using KVC to link the
// gui view and model data
//

}




@end
