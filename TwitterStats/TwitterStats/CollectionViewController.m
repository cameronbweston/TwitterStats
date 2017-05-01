//
//  CollectionViewController.m
//  TwitterStats
//
//  Created by Cameron Weston on 4/5/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"

@interface CollectionViewController () <UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation CollectionViewController

static NSString *const identifier = @"CollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureCollectionView];
}

- (void)configureCollectionView {
    UINib *collectionViewCellNib = [UINib nibWithNibName:@"CollectionViewCell" bundle:nil];
    [self.collectionView registerNib:collectionViewCellNib forCellWithReuseIdentifier:identifier];
    self.collectionView.backgroundColor = [UIColor colorWithRed:0.753 green:0.871 blue:0.929 alpha:1.0];
    self.view.backgroundColor = [UIColor colorWithRed:0.753 green:0.871 blue:0.929 alpha:1.0];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    switch ([indexPath row]) {
        case 0:
            cell.cellImageView.image = [UIImage imageNamed:@"emojiSymbol"];
            cell.cellTextLabel.text = @"Top Emojis";
            break;
        case 1:
            cell.cellImageView.image = [UIImage imageNamed:@"hashtagSymbol"];
            cell.cellTextLabel.text = @"Top Hashtags";
            break;
        case 2:
            cell.cellImageView.image = [UIImage imageNamed:@"URLSymbol"];
            cell.cellTextLabel.text = @"Top URLs";
            break;
        case 3:
            cell.cellImageView.image = [UIImage imageNamed:@"photoURLSymbol"];
            cell.cellTextLabel.text = @"Top Photo URLs";
            break;
        case 4:
            cell.cellImageView.image = [UIImage imageNamed:@"timeSymbol"];
            cell.cellTextLabel.text = @"Tweets Today";
        default:
            break;
    }
    cell.backgroundColor = [UIColor colorWithRed:0.0 green:0.675 blue:0.929 alpha:1];
    cell.cellTextLabel.textColor = [UIColor whiteColor];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 20;
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    float marginWidth = (self.view.frame.size.width) - (self.collectionView.frame.size.width);
    float offset = marginWidth/4;
    const CGFloat width = self.collectionView.frame.size.width / 2 - offset;
    const CGFloat height = width;
    return CGSizeMake(width, height);
}

//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
//    return 5f;
//}

@end
