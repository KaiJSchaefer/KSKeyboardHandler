//
//  UIView+KSKeyboardHandler.m
//  Pods
//
//  Created by Kai Schäfer on 18.02.16.
//
//

#import "UIView+KSKeyboardHandler.h"

#import <objc/runtime.h>

@interface UIView ()

@property()NSNumber* animationIsRunning;
@property()NSNumber* originY;

@end

@implementation UIView (KSKeyboardHandler)


- (NSNumber*)originY {
    return objc_getAssociatedObject(self, @selector(originY));
}



- (void)setOriginY:(NSNumber*)originY {
    objc_setAssociatedObject(self, @selector(originY), originY, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



- (NSNumber*)animationIsRunning {
    return objc_getAssociatedObject(self, @selector(animationIsRunning));
}



- (void)setAnimationIsRunning:(NSNumber*)animationIsRunning {
    objc_setAssociatedObject(self, @selector(animationIsRunning), animationIsRunning, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



- (void)addKeyboardListner {
    
    self.originY = [NSNumber numberWithFloat:CGRectGetMaxY(self.frame)];
  
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(animateView:)
                                                 name:UIKeyboardWillChangeFrameNotification
                                               object:nil];
}



- (void)animateView:(NSNotification*)notification {
    
    
    if (![self.animationIsRunning boolValue]) {
        
        self.animationIsRunning = @YES;
        
        UIViewAnimationCurve curve = [[notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
        double duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        
        [UIView animateWithDuration:duration
                              delay:0
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             [UIView setAnimationCurve:curve];
                             
                             CGFloat movY = [self moveYValue:notification];
                             
                             self.center = CGPointMake(self.center.x, self.center.y + movY);
                             [self layoutIfNeeded];
                         }
                         completion:^(BOOL finished) {
                             
                             self.animationIsRunning = @NO;
                             
                         }];
    }
}



- (CGFloat)moveYValue:(NSNotification*)notification {
    
    NSDictionary* userInfo = [notification userInfo];
    CGRect beginRect       = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey]CGRectValue];
    CGRect endRect         = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    NSValue *kbFrame       = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardFrame   = [kbFrame CGRectValue];
    CGFloat currentMaxY    = CGRectGetMaxY(self.frame);
    CGFloat freeSpace      = [UIScreen mainScreen].bounds.size.height -  currentMaxY;
    
    CGFloat keyboardMoveY = fabs(endRect.origin.y - beginRect.origin.y);
    
    
    if ([self keyboardAppearsStartPoint:beginRect.origin endPoint:endRect.origin]) {
        
        
        CGFloat needSpace = freeSpace - keyboardFrame.size.height;
        
        if (needSpace< 0) {
            return needSpace;
        }
        
        if (needSpace < freeSpace) {
            return 0;
        }
        
        if ((beginRect.origin.y - endRect.origin.y) == keyboardFrame.size.height) {
            
            return needSpace;
            
        } else {
            
            CGFloat movY = currentMaxY - self.originY.floatValue - (needSpace - keyboardFrame.size.height);
            
            return movY;
        }
        
        
    } else {
        
        CGFloat movY;
        
        if (self.originY.floatValue > currentMaxY) {
            
            movY = (self.originY.floatValue - currentMaxY) ;
            
            if (movY > keyboardMoveY) {
                
                return keyboardMoveY;
            }
            return movY;
        }
        
        
        return 0;
        
    }
    
}


- (BOOL)keyboardAppearsStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    
    return startPoint.y > endPoint.y;
}

@end
