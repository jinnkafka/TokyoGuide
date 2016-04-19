//
//  PlaceModel.m
//  TokyoGuide
//
//  Created by Chen Jin on 4/20/15.
//  Copyright (c) 2015 Chen Jin. All rights reserved.
//

#import "PlaceModel.h"

//class extension
@interface PlaceModel ()

//private property
@property (strong, nonatomic) NSMutableArray *places;

@end

@implementation PlaceModel


- (instancetype) init {
    self = [super init];
    if(self) {
        
        NSString *filepath = [[NSBundle mainBundle] pathForResource:@"PlaceList" ofType:@"plist"];
        
        _places = [NSMutableArray arrayWithContentsOfFile:filepath];
        
        NSLog (@"count = %lud", (unsigned long)[_places count]);
    }
    return self;
}

- (NSUInteger) numberOfPlaces {
    return [self.places count];
}

- (NSDictionary *) placeAtIndex:(NSUInteger) index {
    return [self.places objectAtIndex: index];
}

@end
