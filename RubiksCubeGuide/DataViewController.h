//
//  DataViewController.h
//  RubiksCubeGuide
//
//  Created by Edwin Groothuis on 1/11/17.
//  Copyright © 2017 Edwin Groothuis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) IBOutlet UILabel *explanationLabel;
@property (strong, nonatomic) IBOutlet UILabel *formulaLabel;
@property (strong, nonatomic) IBOutlet UIImageView *cubeImageView;
@property (strong, nonatomic) NSDictionary *dataObject;

@end

