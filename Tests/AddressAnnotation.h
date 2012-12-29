//
//  AddressAnnotation.h
//  Locality
//
//  Created by Guillaume PLIQUE on 07/12/12.
//  Copyright (c) 2012 Damien CORNU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface AddressAnnotation : NSObject<MKAnnotation> {
	CLLocationCoordinate2D coordinate;
}

@property (strong, nonatomic) NSString *myTitle;
- (id) init:(CLLocationCoordinate2D) c;

@end