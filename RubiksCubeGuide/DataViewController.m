//
//  DataViewController.m
//  RubiksCubeGuide
//
//  Created by Edwin Groothuis on 1/11/17.
//  Copyright © 2017 Edwin Groothuis. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()

@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSString *s;

    s = [self.dataObject objectForKey:@"page"];
    if ([s isKindOfClass:[NSNull class]] == YES)
        s = @"";
    self.dataLabel.text = s;
    self.cubeImageView.image = [self.dataObject objectForKey:@"image"];
    s = [self.dataObject objectForKey:@"formula"];
    if ([s isKindOfClass:[NSNull class]] == YES)
        s = @"";
    self.formulaLabel.text = s;
    s = [self.dataObject objectForKey:@"explanation"];
    if ([s isKindOfClass:[NSNull class]] == YES)
        s = @"";
    self.explanationLabel.text = s;
}


@end
