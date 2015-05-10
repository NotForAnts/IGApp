//
//  IGDateInputView.h
//  IGApp
//
//  Created by Paul Webb on 08/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "IGBasicInputDataView.h"


@class IGDateInputView;

@protocol IGDateInputViewDelegate

    -(void)         didBeginEditingWithDateInput:(IGDateInputView*)view;
    -(void)         didEndEditingWithDateInput:(IGDateInputView*)view;

@end


@interface IGDateInputView : IGBasicInputDataView <UITextFieldDelegate>
{
UITextField                 *dayField;
UITextField                 *monthField;
UITextField                 *yearField;
UITextField                 *currentField;
id                          delegate;
}

@property   (assign,readwrite)      id                  delegate;


-(void)         resignActive;
-(void)         makeDOBField;
-(CGRect)       dobDayRect;
-(CGRect)       dobMonthRect;
-(CGRect)       dobYearRect;
-(float)        spacing;
-(float)        fieldWide;

-(NSString*)    dateValue;
-(void)         nextInputAction:(id)sender;
-(void)         checkYearField;
-(void)         doValidHighlight;
-(BOOL)         allEmptyField;
-(BOOL)         isValidateDOB;
-(BOOL)         isValidateDOB:(NSString *)dateOfBirth;


@end
