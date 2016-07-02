//
//  Calculator.m
//  Calculator
//
//  Created by students on 11/09/15.
//  Copyright (c) 2015 students. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

-(NSString *)equals{
    
    if ([self.op isEqualToString:@"+"]) {
        
        return [NSString stringWithFormat:@"%.2f",self.operand1 + self.operand2];
    }
    if ([self.op isEqualToString:@"-"]){
        return [NSString stringWithFormat:@"%.2f",self.operand1 - self.operand2];
    }
    if ([self.op isEqualToString:@"*"]){
        return [NSString stringWithFormat:@"%.2f",self.operand1 * self.operand2];
    }
    if ([self.op isEqualToString:@"/"]){
        if (self.operand2) {
            return [NSString stringWithFormat:@"%.2f",self.operand1 / self.operand2];
        }
        else
            return @"Overflow";
        
    }
    
    return @"Empty";
    
}

@end
