//
//  IGTurboTraderAccount.m
//  IGApp
//
//  Created by Paul Webb on 08/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import "IGTurboTraderAccount.h"

@implementation IGTurboTraderAccount

@synthesize territtoryInfo;

// CONSTRUCTOR / DECONSTRUCT
-(id)   init
{
if(self=[super init])
    {
    territtoryInfo=nil;
    dynamicDataTypes=[[NSMutableArray alloc]init];
    }
return self;
}



-(void)     dealloc
{
if(territtoryInfo!=nil)
[territtoryInfo release];

[dynamicDataTypes   release];

[super dealloc];
}



-(void)     setTerrittoryInfo:(IGTerrittory*)info
{
if(territtoryInfo==info)
return;

if(territtoryInfo!=nil)
    {
    [territtoryInfo release];
    territtoryInfo=nil;
    }
    
territtoryInfo=info;
[territtoryInfo retain];

NSLog(@"setTerrittoryInfo %@",territtoryInfo);
[self createDynamicDateTypes];
}



-(void)     createDynamicDateTypes
{
[dynamicDataTypes removeAllObjects];

NSMutableArray  *requiredTypes=[territtoryInfo requireFieldDataTypes];

for(NSString *type in requiredTypes)
    {
    id dataType=[[NSClassFromString(type) alloc]init];
    [dynamicDataTypes addObject:dataType];
    [dataType release];
    }


NSLog(@"createDynamicDateTypes %@",dynamicDataTypes);

}


#pragma mark - accessors for the data types if exist - which depends on the territory


-(IGTraderBasicInfo*)   basicUserInfo
{
return [self userDataTypeOfClass:@"IGTraderBasicInfo"];
}


-(IGTraderPastInfo*)   pastUserInfo
{
return [self userDataTypeOfClass:@"IGTraderPastInfo"];
}


-(IGTraderFinanceInfo*)   financeUserInfo
{
return [self userDataTypeOfClass:@"IGTraderFinanceInfo"];
}




-(id)   userDataTypeOfClass:(NSString*)type
{
for(id dataType in dynamicDataTypes)
if([dataType isKindOfClass:[NSClassFromString(type) class]])
    {
    return dataType;
    }

return nil;

}



#pragma mark - SEND NEW ACCOUNT API

-(void)     sendCreateNewAccountData:(NSString*)baseURl completionHandler:(void (^)(BOOL result,NSError *error))completionHandler;
{
NSString                    *country=[territtoryInfo locationName];
IGTraderBasicInfo           *basicModel=[self basicUserInfo];
IGTraderPastInfo            *pastModel=[self pastUserInfo];
IGTraderFinanceInfo         *financeModel=[self financeUserInfo];
NSMutableDictionary         *postDict=[[NSMutableDictionary alloc]init];


// populate the fields for the POST
// if the account doesn't have one of models (eg financeModel) because not needed for the territory it will be nil so wont be added

if(country!=nil)                        [postDict setObject:country forKey:@"Territory"];
if(basicModel.userName!=nil)            [postDict setObject:basicModel.userName forKey:@"username"];
if(basicModel.userDateBirth!=nil)       [postDict setObject:basicModel.userDateBirth forKey:@"dateofbirth"];
if(pastModel.pastInfo!=nil)             [postDict setObject:pastModel.pastInfo forKey:@"pastinfo"];
if(financeModel.financeInfo!=nil)       [postDict setObject:financeModel.financeInfo forKey:@"financeInfo"];


NSLog(@"postDict %@",postDict);


    
NSData                  *postData = [NSJSONSerialization dataWithJSONObject:postDict options:NSJSONWritingPrettyPrinted error:nil];
NSURL                   *url = [NSURL URLWithString:baseURl];
NSMutableURLRequest     *request = [NSMutableURLRequest requestWithURL:url];

[postDict release];

[request setHTTPMethod:@"POST"];
[request setValue:[NSString stringWithFormat:@"%d", postData.length] forHTTPHeaderField:@"Content-Length"];
[request setValue:@"application/x-www-form-urlencoded charset=utf-8" forHTTPHeaderField:@"Content-Type"];
[request setHTTPBody:postData];


dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{


    NSURLResponse   *response;
    NSError         *error = nil;
    NSData          *responseData = [NSURLConnection sendSynchronousRequest:request
                                           returningResponse:&response
                                                       error:&error];
   
    BOOL           okay=YES;
    NSError        *myError=nil;
    NSArray        *result= [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:&myError];
    
    NSLog(@"result %@",result);

    completionHandler(okay,myError);
    
    
    });
}





@end
