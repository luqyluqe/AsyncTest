#import <XCTest/XCTest.h>
#import "AsyncTest.h"

@implementation AsyncTest
{
    int _timeoutSeconds;
    BOOL _passed;
}

-(instancetype)initWithTimeoutSeconds:(int)timeoutSeconds
{
    if (self=[super init]) {
        _timeoutSeconds=timeoutSeconds;
        _passed=NO;
    }
    return self;
}

-(BOOL)runTest:(dispatch_block_t)test
{
    test();
    NSDate* timeoutDate=[NSDate dateWithTimeIntervalSinceNow:_timeoutSeconds];
    do{
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:timeoutDate];
        if ([timeoutDate timeIntervalSinceNow]<0.0) {
            break;
        }
    }while (!_passed);
    return _passed;
}

-(void)pass
{
    _passed=YES;
}

@end
