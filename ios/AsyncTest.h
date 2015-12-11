#import <Foundation/Foundation.h>

@interface AsyncTest:NSObject

-(instancetype)initWithTimeoutSeconds:(int)timeoutSeconds;

-(BOOL)runTest:(dispatch_block_t)test;
-(void)pass;

@end
