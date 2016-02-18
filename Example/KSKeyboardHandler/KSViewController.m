//
//  KSViewController.m
//  KSKeyboardHandler
//
//  Created by Kai Schaefer on 02/18/2016.
//  Copyright (c) 2016 Kai Schaefer. All rights reserved.
//

#import "KSViewController.h"
#import "UIView+KSKeyboardHandler.h"

@interface KSViewController () <UITextFieldDelegate>

@end

@implementation KSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *square         = UIView.new;
    square.frame           = (CGRect){0,0,self.view.frame.size.width / 2, self.view.frame.size.width / 2};
    square.backgroundColor = UIColor.redColor;
    square.center          = self.view.center;
    [square addKeyboardListner];
    
    UITextField *textField    = UITextField.new;
    textField.backgroundColor = UIColor.blackColor;
    textField.frame           = (CGRect){0,0,self.view.frame.size.width / 2, square.frame.size.height/5};
    textField.delegate        = self;
    [square addSubview:textField];
   
    [self.view addSubview:square];

}



- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    [textField resignFirstResponder];

    return YES;
}

@end
