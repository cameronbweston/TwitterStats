//
//  CollectionViewCell.h
//  TwitterStats
//
//  Created by Cameron Weston on 4/28/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *cellTextLabel;

@end
