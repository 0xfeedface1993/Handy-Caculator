//
//  Arithmetic.m
//  HandyCaculator
//
//  Created by virus1993 on 15/2/15.
//  Copyright (c) 2015年 apress. All rights reserved.
//

#import "Arithmetic.h"

@implementation Arithmetic

-(long long)add:(long long)a with:(long long)b{
    long long c=a+b;
    return c;
}

-(long long)sub:(long long)a with:(long long)b{
    long long c=a-b;
    return c;
}

-(long long)mul:(long long)a with:(long long)b{
    long long c=a*b;
    return c;
}

-(long long)div:(long long)a with:(long long)b{
    if (!b) {
        return 0;
    }
    long long c=a/b;
    return c;
}

/*static int check_add_overload(long long a,long long b){
    __asm__ __volatile__ (
            ""
            );
    return 0;
 
     "mov eax,a"
    " add eax,b"
    "jo overflowed"
    "xor eax,eax"
    "jmp no_overflowed"
    "overflowed:"
    "mov eax,1"
    "no_overflowed:"

}*/

@end
