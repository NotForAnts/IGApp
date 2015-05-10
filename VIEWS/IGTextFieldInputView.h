//
//  IGTextFieldInputView.h
//  IGApp
//
//  Created by Paul Webb on 10/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "IGBasicInputDataView.h"

@class IGTextFieldInputView;


@protocol IGTextFieldInputViewDelegate

    -(void)         didBeginEditing:(IGTextFieldInputView*)view;
    -(void)         didEndEditing:(IGTextFieldInputView*)view;


@end


@interface IGTextFieldInputView : IGBasicInputDataView <UITextViewDelegate>
{

UITextView                      *infoLabel;
id                              delegate;
}

@property   (assign,readwrite)      id      delegate;


-(NSString*)        textValue;

@end
