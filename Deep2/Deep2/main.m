#import <Foundation/Foundation.h>

@interface Person : NSObject
{

    int age;
    int weight;
    float height;
}

-(void) print;
-(void) setAge: (int) a;
-(void) setWeight: (int) w;
-(void) setHeight: (float) h;
-(int) age;
-(int) weight;
-(void) loop;
@end

@implementation Person

-(void) print{

    NSLog(@"I am %i years old and weight %i pounds,height %f",age,weight,height);
}

-(void) setAge: (int) a{

    age=a;
}

-(void) setWeight: (int) w{
    
    weight=w;
}

-(void) setHeight:(float) h{
    
    height=h;
    
}

-(int) age{

    return age;
}

-(int)weight{
    
    return weight;
}

-(float) height{
    
    return height;
}

-(void) loop{

    int x,n;
    NSLog(@"Enter a no to print:");
    scanf("%i",&n);
    for(x=1;x<=n;x++)
        NSLog(@"%i",x);
}
@end

int main(int argc,char *argv[])
{
    @autoreleasepool {
        
        Person *deep=[[Person alloc]init];
        
        //deep=[Person alloc];
        //deep=[deep init];
        
        [deep setAge:19];
        [deep setWeight:80];
        [deep setHeight:5.10];
       // [deep print];
        
        NSLog(@"Deep weighs %i,height %f,age %i",[deep weight],[deep height],[deep age]);
        [deep loop];
        }
    return 0;
}