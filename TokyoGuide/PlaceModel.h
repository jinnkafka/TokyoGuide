//
//  PlaceModel.h
//  TokyoGuide
//
//  Created by Chen Jin on 4/20/15.
//  Copyright (c) 2015 Chen Jin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlaceModel : NSObject


- (NSUInteger) numberOfPlaces;

- (NSDictionary *) placeAtIndex: (NSUInteger) index;



@end
