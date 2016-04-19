//
//  CollectionViewCell.m
//  TokyoGuide
//
//  Created by Chen Jin on 4/20/15.
//  Copyright (c) 2015 Chen Jin. All rights reserved.
//

#import "CollectionViewCell.h"


#import "PlaceModel.h"

@interface CollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *placeImage;
@property (weak, nonatomic) IBOutlet UILabel *placeName;


@end

@implementation CollectionViewCell


- (void) setCell:(NSDictionary *)place {
    self.placeImage.image = [UIImage imageNamed: place[@"image"]];
    self.placeName.text = place[@"name"];
}


@end
