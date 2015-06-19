//
//  MRCFollowButton.m
//  MVVMReactiveCocoa
//
//  Created by leichunfeng on 15/6/17.
//  Copyright (c) 2015年 leichunfeng. All rights reserved.
//

#import "MRCFollowButton.h"

#define MRC_FOLLOW_COLOR HexRGB(colorI3)
#define MRC_UNFOLLOW_COLOR [UIColor whiteColor]

static UIImage *followImage = nil;
static UIImage *unfollowImage = nil;

@implementation MRCFollowButton

+ (UIImage *)followImage {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        followImage = [UIImage octicon_imageWithIcon:@"Person"
                                     backgroundColor:[UIColor clearColor]
                                           iconColor:MRC_FOLLOW_COLOR
                                           iconScale:1
                                             andSize:CGSizeMake(15, 15)];
    });
    return followImage;
}

+ (UIImage *)unfollowImage {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        unfollowImage = [UIImage octicon_imageWithIcon:@"Person"
                                       backgroundColor:[UIColor clearColor]
                                             iconColor:MRC_UNFOLLOW_COLOR
                                             iconScale:1
                                               andSize:CGSizeMake(15, 15)];
    });
    return unfollowImage;
}

- (id)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    self.layer.borderWidth = 1;
    self.layer.borderColor = MRC_FOLLOW_COLOR.CGColor;
    self.layer.cornerRadius = 5;
    
    self.titleLabel.font = [UIFont systemFontOfSize:15];
//    self.contentEdgeInsets = UIEdgeInsetsMake(6, 3, 6, 5);
//    self.contentEdgeInsets = UIEdgeInsetsMake(4, 1, 4, 3);
//    self.contentEdgeInsets = UIEdgeInsetsMake(6, 0, 6, 2);
    self.contentEdgeInsets = UIEdgeInsetsMake(6, 1, 6, 3);
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    if (selected) {
        [self setImage:[self.class unfollowImage] forState:UIControlStateNormal];
        [self setTitle:@"Unfollow" forState:UIControlStateNormal];
        [self setTitleColor:MRC_UNFOLLOW_COLOR forState:UIControlStateNormal];
        self.backgroundColor = MRC_FOLLOW_COLOR;
        [self sizeToFit];
    } else {
        [self setImage:[self.class followImage] forState:UIControlStateNormal];
        [self setTitle:@"Follow" forState:UIControlStateNormal];
        [self setTitleColor:MRC_FOLLOW_COLOR forState:UIControlStateNormal];
        self.backgroundColor = MRC_UNFOLLOW_COLOR;
        [self sizeToFit];
    }
}

@end