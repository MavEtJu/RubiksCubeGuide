//
//  ModelController.m
//  RubiksCubeGuide
//
//  Created by Edwin Groothuis on 1/11/17.
//  Copyright © 2017 Edwin Groothuis. All rights reserved.
//

#import "ModelController.h"
#import "DataViewController.h"

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */


@interface ModelController ()

@property (strong, nonatomic) NSArray<NSDictionary *> *pageData;
@end

@implementation ModelController

- (UIImage *)image:(NSString *)file
{
    return [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], file]];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        // Create the data model.
        NSMutableArray *pageData = [NSMutableArray arrayWithCapacity:16];
        NSDictionary *page;

        page = @{
                 @"page": @"Overview",
                 @"image": [self image:@"Cube5.png"],
                 @"formula": [NSNull null],
                 @"explanation": @"In the formulas, the side to turn matches the first letter of the side. So T means 'turn the top layer clockwise' and T' means 'turn the top layer counter-clockwise'. If a turn needs to be repeated, a number will indiate it as such.",
                 };
        [pageData addObject:page];

        page = @{
                 @"page": @"Bottom layer - done",
                 @"image": [self image:@"CubeBottomDone.png"],
                 @"formula": [NSNull null],
                 @"explanation": @"First the bottom layer needs to be put in position, that is not covered in this guide. Next steps is to fill the sides of the middle layer. Move them from the top layer to the middle layer with the next two formulas.",
                 };
        [pageData addObject:page];

        page = @{
                 @"page": @"Middle layer - one of two",
                 @"image": [self image:@"Cube6.png"],
                 @"formula": @"RTR'T'F'T'F",
                 @"explanation": @"Use this and the next one to get the middle layer done.",
                 };
        [pageData addObject:page];

        page = @{
                 @"page": @"Middle layer - two of two",
                 @"image": [self image:@"Cube7.png"],
                 @"formula": @"F'T'FTRTR'",
                 @"explanation": @"Use this and the next one to get the middle layer done.",
                 };
        [pageData addObject:page];

        page = @{
                 @"page": @"Middle layer - done",
                 @"image": [self image:@"CubeMiddleDone.png"],
                 @"formula": [NSNull null],
                 @"explanation": @"The middle layer is done, now the middle tiles of the top layer are to be put in place.",
                 };
        [pageData addObject:page];

        page = @{
                 @"page": @"Top layer inside - one of six",
                 @"image": [self image:@"Cube8.png"],
                 @"formula": @"RTBT'B'R'T'",
                 @"explanation": @"Use this to get the insides to the right location.",
                 };
        [pageData addObject:page];

        page = @{
                 @"page": @"Top layer inside - two of six",
                 @"image": [self image:@"Cube9.png"],
                 @"formula": @"(RTBT'B'R'T')2",
                 @"explanation": @"Use this to turn the insides to the right position."
                 };
        [pageData addObject:page];

        page = @{
                 @"page": @"Top layer inside - three of six",
                 @"image": [self image:@"Cube10.png"],
                 @"formula": @"FTRT'R'F'",
                 @"explanation": @"Optional: Swap three middle pieces."
                 };
        [pageData addObject:page];

        page = @{
                 @"page": @"Top layer inside - four of six",
                 @"image": [self image:@"Cube11.png"],
                 @"formula": @"LTFT'F'L'FTRT'R'F'",
                 @"explanation": @"Optional: Swap two pieces."
                 };
        [pageData addObject:page];

        page = @{
                 @"page": @"Top layer inside - five of six",
                 @"image": [self image:@"Cube12.png"],
                 @"formula": @"LTFT'F'L'FTRT'R'F'BTLT'L'B'",
                 @"explanation": @"Optional: Move the insides to the right location."
                 };
        [pageData addObject:page];

        page = @{
                 @"page": @"Top layer inside - six of six",
                 @"image": [self image:@"Cube13.png"],
                 @"formula": @"(T2R2)3T(R2T2)3T'",
                 @"explanation": @"Optional: Move the insides to the right location.",
                 };
        [pageData addObject:page];

        page = @{
                 @"page": @"Top layer - middle tiles done",
                 @"image": [self image:@"CubeTopMiddleDone.png"],
                 @"formula": [NSNull null],
                 @"explanation": @"All is done except the corners.",
                 };
        [pageData addObject:page];

        page = @{
                 @"page": @"Top layer corners - one of three",
                 @"image": [self image:@"Cube15.png"],
                 @"formula": @"TRT'R'L'RTR'T'L",
                 @"explanation": @"Use these to move the corners around to the right location.",
                 };
        [pageData addObject:page];

        page = @{
                 @"page": @"Top layer corners - two of three",
                 @"image": [self image:@"Cube14.png"],
                 @"formula": @"F(TRT'R')3F'",
                 @"explanation": @"Optional: Move the corners to the right location.",
                 };
        [pageData addObject:page];

        page = @{
                 @"page": @"Top layer corners - three of three",
                 @"image": [self image:@"Cube16.png"],
                 @"formula": @"(FUF'U')2T(UFU'F')2T'",
                 @"explanation": @"And finally turn the corners into the right position.",
                 };
        [pageData addObject:page];

        page = @{
                 @"page": @"Top layer - all done",
                 @"image": [self image:@"CubeTopDone.png"],
                 @"formula": [NSNull null],
                 @"explanation": @"Tada! The cube is solved. Until you mess it up again... 🤔",
                 };
        [pageData addObject:page];

        page = @{
                 @"page": @"Background information",
                 @"image": [self image:@"ernorubik.jpg"],
                 @"formula": [NSNull null],
                 @"explanation": @"The steps in this guide for solving the Rubiks cube were first published in the magazine KIJK (Juli 1981) in an article written by Robert Rijs under the title of \"Wie temt de martelkubus\". Years later when my kids got their hands on a cube I went looking for a way to solve it but couldn't find the right steps. I got a scanned copy of the article and transformed it into this guide. While I don't recall all the steps mentioned in this article, I can easily solve it with the ones which are not marked as 'Optional'.\n\nMany thanks to Ernő Rubik for giving us this toy!"
                 };
        [pageData addObject:page];

        self.pageData = pageData;
    }
    return self;
}

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard {
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }

    // Create a new view controller and pass suitable data.
    DataViewController *dataViewController = [storyboard instantiateViewControllerWithIdentifier:@"DataViewController"];
    dataViewController.dataObject = self.pageData[index];
    return dataViewController;
}


- (NSUInteger)indexOfViewController:(DataViewController *)viewController {
    // Return the index of the given data view controller.
    // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [self.pageData indexOfObject:viewController.dataObject];
}


#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

@end
