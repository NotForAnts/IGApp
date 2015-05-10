//
//  IGTurboTraderAccount.h
//  IGApp
//
//  Created by Paul Webb on 08/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IGTraderBasicInfo.h"
#import "IGTraderPastInfo.h"
#import "IGTraderFinanceInfo.h"


#import "IGTerrittory.h"


@interface IGTurboTraderAccount : NSObject
{
IGTerrittory            *territtoryInfo;
NSMutableArray          *dynamicDataTypes;

}

@property   (readonly)      IGTerrittory            *territtoryInfo;

-(void)                 setTerrittoryInfo:(IGTerrittory*)info;
-(void)                 createDynamicDateTypes;
-(IGTraderBasicInfo*)   basicUserInfo;
-(IGTraderPastInfo*)    pastUserInfo;
-(IGTraderFinanceInfo*) financeUserInfo;
-(id)                   userDataTypeOfClass:(NSString*)type;

-(void)     sendCreateNewAccountData:(NSString*)baseURl completionHandler:(void (^)(BOOL result,NSError *error))completionHandler;

@end
