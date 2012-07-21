//
//  RCViewCell.h
//  RCLabel
//
//  Created by Hang Chen on 3/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCLabel.h"

@interface RCViewCell : UITableViewCell {
	RCLabel *rtLabel;
}
@property (nonatomic, retain) RCLabel *rtLabel;
@end
