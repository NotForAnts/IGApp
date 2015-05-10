//
//  IGFieldInputView.h
//  IGApp
//
//  Created by Paul Webb on 10/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "IGBasicInputDataView.h"

@class IGFieldInputView;

@protocol IGFieldInputViewDelegate

    -(void)         didBeginEditingWithField:(IGFieldInputView*)view;
    -(void)         didEndEditingWithField:(IGFieldInputView*)view;


@end


@interface IGFieldInputView : IGBasicInputDataView <UITextFieldDelegate>
{
UITextField                     *infoLabel;
id                              delegate;
}

@property   (assign,readwrite)      id                  delegate;

-(NSString*)        textValue;

@end
