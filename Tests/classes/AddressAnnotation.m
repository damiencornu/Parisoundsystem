//
//  AddressAnnotation.m
//  Locality
//
//  Created by Guillaume PLIQUE on 07/12/12.
//  Copyright (c) 2012 Damien CORNU. All rights reserved.
//

#import "AddressAnnotation.h"

@implementation AddressAnnotation
@synthesize coordinate;

- (NSString *)subtitle{
	return self.mySubtitle;
}

- (NSString *)title{
	return self.myTitle;
}

-(id)init:(CLLocationCoordinate2D) c{
    if ( self = [super init] )
    {
        coordinate = c;
    }
    return self;
}

@end
