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
#import "HashtagTableViewController.h"
#import "URLTableViewController.h"
#import "PhotoURLTableViewController.h"
#import "TweetsTodayTableViewController.h"
#import "PercentageTableViewController.h"

@interface CollectionViewController () <UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) EmojiTableViewController *const emojiTableViewController;
@property (nonatomic, strong) HashtagTableViewController *const hashtagTableViewController;
@property (nonatomic, strong) URLTableViewController *const urlTableViewController;
@property (nonatomic, strong) PhotoURLTableViewController *const photoURLTableViewController;
@property (nonatomic, strong) TweetsTodayTableViewController *const tweetsTodayTableViewController;
@property (nonatomic, strong) PercentageTableViewController *const percentageTableViewController;

@end

@implementation CollectionViewController

static NSString *const identifier = @"CollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureCollectionView];
    PopUpViewController *popUpViewController = [[PopUpViewController alloc] init];
    [popUpViewController showInView:self animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    self.title = @"Stat(Twitt)stics";
}

- (void)viewWillDisappear:(BOOL)animated {
    self.title = @"";
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

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    switch ([indexPath row]) {
        case 0:
            self.emojiTableViewController = [EmojiTableViewController new];
            self.emojiTableViewController.context = self.context;
            [[self navigationController] pushViewController:self.emojiTableViewController animated:YES];
            [collectionView deselectItemAtIndexPath:indexPath animated:YES];
            break;
        case 1:
            self.hashtagTableViewController = [HashtagTableViewController new];
            self.hashtagTableViewController.context = self.context;
            [[self navigationController] pushViewController:self.hashtagTableViewController animated:YES];
            [collectionView deselectItemAtIndexPath:indexPath animated:YES];
            break;
        case 2:
            self.urlTableViewController = [URLTableViewController new];
            self.urlTableViewController.context = self.context;
            [[self navigationController] pushViewController:self.urlTableViewController animated:YES];
            [collectionView deselectItemAtIndexPath:indexPath animated:YES];
            break;
        case 3:
            self.photoURLTableViewController = [PhotoURLTableViewController new];
            self.photoURLTableViewController.context = self.context;
            [[self navigationController] pushViewController:self.photoURLTableViewController animated:YES];
            [collectionView deselectItemAtIndexPath:indexPath animated:YES];
            break;
        case 4:
            self.tweetsTodayTableViewController = [TweetsTodayTableViewController new];
            self.tweetsTodayTableViewController.context = self.context;
            [[self navigationController] pushViewController:self.tweetsTodayTableViewController animated:YES];
            [collectionView deselectItemAtIndexPath:indexPath animated:YES];
            break;
        case 5:
            self.percentageTableViewController = [PercentageTableViewController new];
            self.percentageTableViewController.context = self.context;
            [[self navigationController] pushViewController:self.percentageTableViewController animated:YES];
            [collectionView deselectItemAtIndexPath:indexPath animated:YES];
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
