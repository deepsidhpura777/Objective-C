//
//  main.m
//  StringObjects
//
//  Created by Deep Sidhpura on 12/12/13.
//  Copyright (c) 2013 Deep Sidhpura. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
     
        NSString *deep,*newString;
        
        NSMutableString *mute;
        
        deep=@"Deep is the Best";
        newString=@"Yaa he really is!!";
        mute=[NSMutableString stringWithString:deep]; //Object storing normal string as mutable string
        
        [mute insertString:newString atIndex:4];
        NSLog(@"%@",mute);
        [mute appendString:deep];
        [mute deleteCharactersInRange:NSMakeRange(4,18)];
        [mute deleteCharactersInRange:NSMakeRange([deep length]-1,[deep length])];
        
        
       
        
        NSLog(@"The length of the first string is:%lu",(unsigned long)[deep length]);
        NSLog(@"The length of the second string is:%lu",(unsigned long)[newString length]);
        
        newString=[NSString stringWithString:deep]; //overides newString with the new value of deep.
        NSLog(@"%@",newString);
        
        
        
        
        
        //newString=[deep substringToIndex:3];
        //newString=[deep substringFromIndex:5];
        
        newString=[deep substringWithRange:NSMakeRange(12,4)];
        
        NSRange range=[deep rangeOfString:@"Best"];
        
        NSLog(@"The location is %lu and range is %lu ",(unsigned long)range.location,(unsigned long)range.length);
        
        NSLog(@"The string is:%@",newString);
        
        NSLog(@"The mutable string is:%@",mute);
        
        
        
    }
    return 0;
}
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
 
