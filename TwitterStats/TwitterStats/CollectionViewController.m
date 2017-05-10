//
//  CollectionViewController.m
//  TwitterStats
//
//  Created by Cameron Weston on 4/5/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "PopUpViewController.h"
#import "EmojiTableViewController.h"

@interface CollectionViewController () <UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation CollectionViewController

static NSString *const identifier = @"CollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureCollectionView];
    self.title = @"Stat(Twitt)stics";
    PopUpViewController *popUpViewController = [[PopUpViewController alloc] init];
    [popUpViewController showInView:self animated:YES];
}


- (void)configureCollectionView {
    UINib *collectionViewCellNib = [UINib nibWithNibName:@"CollectionViewCell" bundle:nil];
    [self.collectionView registerNib:collectionViewCellNib forCellWithReuseIdentifier:identifier];
    self.collectionView.backgroundColor = [UIColor colorWithRed:0.753 green:0.871 blue:0.929 alpha:1.0];
    self.view.backgroundColor = [UIColor colorWithRed:0.753 green:0.871 blue:0.929 alpha:1.0];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
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
            break;
        case 5:
            cell.cellImageView.image = [UIImage imageNamed:@"percentSymbol"];
            cell.cellTextLabel.text = @"Top Percent";
            break;
        default:
            break;
    }
    cell.backgroundColor = [UIColor colorWithRed:0.0 green:0.675 blue:0.929 alpha:1];
    cell.cellTextLabel.textColor = [UIColor whiteColor];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 20;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell  *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [UIView animateWithDuration:0.3
                          delay:0
                        options:(UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         [cell setBackgroundColor:[UIColor whiteColor]];
                     }
                     completion:^(BOOL finished){
                         [cell setBackgroundColor:[UIColor lightGrayColor]];
                     }
     ];
    EmojiTableViewController *const emojiTableViewController = [EmojiTableViewController new];

    switch ([indexPath row]) {
        case 0:
            //emoji view controller
            [[self navigationController] pushViewController:emojiTableViewController animated:YES];
            [collectionView deselectItemAtIndexPath:indexPath animated:YES];
            break;
        case 1:
            //hashtag view controller
            break;
        case 2:
            //url view controller
            break;
        case 3:
            //photo url view controller
            break;
        case 4:
            //tweets today view controller
            break;
        case 5:
            //percent view controller
            break;
        default:
            break;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    float marginWidth = (self.view.frame.size.width) - (self.collectionView.frame.size.width);
    float offset = marginWidth/4;
    const CGFloat width = self.collectionView.frame.size.width / 2 - offset;
    const CGFloat height = width;
    return CGSizeMake(width, height);
}

@end
