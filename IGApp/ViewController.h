//
//  ViewController.h
//  IGApp
//
//  Created by Paul Webb on 08/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IGMainModel.h"
#import "IGSetUpAccountView.h"

@interface ViewController : UIViewController <IGSetUpAccountViewDataSource>
{
IGMainModel             *mainModel;
IGSetUpAccountView      *accountView;
UIButton                *scrollTopButton;
}

-(CGRect)   accountRect;


@end

