//
//  Tuna.m
//  GlobalExternalVariables
//
//  Created by Deep Sidhpura on 12/12/13.
//  Copyright (c) 2013 Deep Sidhpura. All rights reserved.
//

#import "Tuna.h"

@implementation Tuna

-(void) changeVar{
    
    extern int gDrunk;
    
    gDrunk=19;
}

@end
