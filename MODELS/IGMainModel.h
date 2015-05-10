//
//  IGMainModel.h
//  IGApp
//
//  Created by Paul Webb on 08/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IGTerrittoriesManager.h"
#import "IGTurboTraderAccount.h"

@interface IGMainModel : NSObject
{
IGTerrittoriesManager       *territtoryManager;
IGTurboTraderAccount        *userAccount;
}

@property   (readonly)      IGTerrittoriesManager       *territtoryManager;
@property   (readonly)      IGTurboTraderAccount        *userAccount;

@end
