
#import <Foundation/Foundation.h>

@interface Daksha : NSObject{

    int c;
}

-(void) cooking;

@end

@implementation Daksha

-(void) cooking{
    
    c=111;
}

@end

@interface Deep : Daksha

-(void) printThing;

@end

@implementation Deep

-(void) printThing{
    
    NSLog(@"The value of c is:%i",c);
}

@end



int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Deep *d=[[Deep alloc]init];
        
        [d cooking];
        [d printThing];
        
    }
    return 0;
}

