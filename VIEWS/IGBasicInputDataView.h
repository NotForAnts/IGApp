//
//  IGBasicInputDataView.h
//  IGApp
//
//  Created by Paul Webb on 10/05/15.
//  Copyright (c) 2015 Paul Webb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IGBasicInputDataView : UIView
{
UILabel                         *descriptionLabel;
}



-(void)        setDescription:(NSString*)name;
-(void)        makeTopDescription;
-(CGRect)      descriptionRect;
-(BOOL)        dataInputIsValid;
-(UIToolbar*)  createInputAccessoryView;
-(void)        nextInputAction:(id)sender;
-(void)        closeInputAction:(id)sender;


@end
