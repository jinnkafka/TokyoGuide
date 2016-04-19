//
//  CollectionViewController.m
//  TokyoGuide
//
//  Created by Chen Jin on 4/20/15.
//  Copyright (c) 2015 Chen Jin. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "DetailViewController.h"
#import "PlaceModel.h"

@interface CollectionViewController ()

@property (strong, nonatomic) PlaceModel *model;

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Place";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _model = [ [PlaceModel alloc] init];
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
   
    
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>

- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id)sender {
    if ([segue.identifier isEqualToString:@"detail"]) {
        NSArray * selectedItems = [self.collectionView indexPathsForSelectedItems];
        NSIndexPath * selectedItem = selectedItems[0];
        NSInteger selectedIndex = selectedItem.row;
        NSDictionary *place = [self.model placeAtIndex:selectedIndex];
    
        DetailViewController *dvc = [segue destinationViewController];
        dvc.place = place;
    }
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.model numberOfPlaces];
}

//setting up individual cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Place" forIndexPath:indexPath];
    
    NSDictionary *place = [self.model placeAtIndex:indexPath.row];
    [cell setCell:place];
    return cell;
}


//rotation vetical horizontal
- (void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)
    [self.collectionView collectionViewLayout];
    
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
        toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    } else {
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
