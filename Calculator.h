//
//  Calculator.h
//  Calculator
//
//  Created by students on 11/09/15.
//  Copyright (c) 2015 students. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property(nonatomic) float operand1;
@property(nonatomic) float operand2;
@property(strong,nonatomic) NSString * op;

-(NSString *) equals;

@end

