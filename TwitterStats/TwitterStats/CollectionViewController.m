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
        case 2:
            cell.cellImageView.image = [UIImage imageNamed:@"urlSymbol"];
            cell.cellTextLabel.text = @"Top URLs";
        case 3:
            cell.cellImageView.image = [UIImage imageNamed:@"photoUrlSymbol"];
            cell.cellTextLabel.text = @"Top Photo URLs";
        case 4:
            cell.cellImageView.image = [UIImage imageNamed:@"timeSymbol"];
            cell.cellTextLabel.text = @"Tweets Today";
        default:
            break;
    }
    cell.backgroundColor = [UIColor lightGrayColor];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 20;
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    const CGFloat width = self.view.frame.size.width / 2 - 5;
    const CGFloat height = width;
    return CGSizeMake(width, height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
