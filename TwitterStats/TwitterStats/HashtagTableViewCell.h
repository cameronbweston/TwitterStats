//
//  HashtagTableViewCell.h
//  TwitterStats
//
//  Created by Cameron Weston on 7/5/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HashtagTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *hashtagTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *rowNumberTextLabel;

@end
