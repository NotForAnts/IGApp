//
//  IGSetUpAccountView.h
//  IGApp
//
//  Created by Paul Webb on 08/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "IGTerritorySelectView.h"
#import "IGTurboTraderAccount.h"
#import "IGDateInputView.h"
#import "IGPastInfoView.h"
#import "IGFieldInputView.h"

#import "IGFinacialInfoView.h"
#import "IGTerrittory.h"

@class IGSetUpAccountView;

@protocol IGSetUpAccountViewDataSource

    -(NSInteger)    numberOfCountries:(IGSetUpAccountView *)view;
    -(NSString*)    countryNameForRow:(IGSetUpAccountView *)view row:(NSInteger)row;
    -(void)         didSelectCountryAtRow:(IGSetUpAccountView *)view row:(NSInteger)row;

@end

@protocol IGSetUpAccountViewDelegate
    -(void)         doSignUp:(IGSetUpAccountView *)view;

@end


@interface IGSetUpAccountView : UIView <UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate,IGTextFieldInputViewDelegate,IGFieldInputViewDelegate,IGDateInputViewDelegate>
{
UIScrollView                *myScrollView;
UIButton                    *signUpButton;
IGFieldInputView            *nameField;
IGTerritorySelectView       *countrySelectorView;
IGDateInputView             *dateBirthView;
IGPastInfoView              *pastInfoView;
IGFinacialInfoView          *financeInfoView;
CGPoint                     currentScrollOfset;

id                          dataSource;
id                          delegate;
}

@property   (assign,readwrite)      id                  dataSource;
@property   (assign,readwrite)      id                  delegate;
@property   (readonly)              IGFieldInputView    *nameField;
@property   (readonly)              IGDateInputView     *dateBirthView;
@property   (readonly)              IGPastInfoView      *pastInfoView;
@property   (readonly)              IGFinacialInfoView  *financeInfoView;


-(void)     scrollToTop;
-(void)     updateViewsUsing:(IGTurboTraderAccount*)account;
-(void)     makeViews;
-(void)     makeTopDescription;
-(void)     makeSignUpButton;
-(void)     makeNameField;
-(void)     makeDOBField;
-(void)     checkAllFilledAndOkay;

-(CGRect)      pastInfoRect;
-(CGRect)      financeInfoRect;





@end
