//
//  ChartViewController.m
//  Revmed
//
//  Created by Nader on 5/24/13.
//  Copyright (c) 2013 SIM. All rights reserved.
//

#import "ChartViewController.h"

@implementation ChartViewController

@synthesize chartView, flag, scores, currentPseudo;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.chartView = [[UIView alloc] initWithFrame:self.view.frame];
    [self.view insertSubview:self.chartView atIndex:0];
    [self setTitle: currentPseudo];
    [self createAreaChart];
}

- (void)createAreaChart
{
    WSAreaChartView *areaChart  = [[WSAreaChartView alloc] initWithFrame:CGRectMake(0.0, 10.0, 800.0, 400.0)];
    NSMutableArray *arr = [self createDemoDatas];
    NSDictionary *colorDict = [self createColorDict];
    areaChart.rowWidth = 20.0;
    areaChart.title = @"Variations des scores";
    areaChart.showZeroValueOnYAxis = YES;
    [areaChart drawChart:arr withColor:colorDict];
    areaChart.backgroundColor = [UIColor blackColor];
    [self.chartView addSubview:areaChart];
}

- (void)createLineChart
{
    WSLineChartView *lineChart = [[WSLineChartView alloc] initWithFrame:CGRectMake(10.0, 50.0, 800.0, 400.0)];
    NSMutableArray *arr = [self createDemoDatas];
    NSDictionary *colorDict = [self createColorDict];
    
    lineChart.xAxisName = @"Year";
    lineChart.rowWidth = 20.0;
    lineChart.title = @"Pyanfield's Line Chart";
    lineChart.showZeroValueOnYAxis = YES;
    //lineChart.titleFrame = CGRectMake(0.0, 0.0, 400, 50);
    //lineChart.legendFrame = CGRectMake(0.0, 0.0, 400, 400);
    [lineChart drawChart:arr withColor:colorDict];
    lineChart.backgroundColor = [UIColor blackColor];
    [self.chartView addSubview:lineChart];
}
- (NSMutableArray*)createDemoDatas
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    int i = 1;
    for(Score *s in scores)
    {
        NSLog(@"pseudo %@, score %.2f", s.pseudo, s.score);
        if([[[self currentPseudo] lowercaseString] isEqualToString: [[s pseudo] lowercaseString ]])
        {
            WSChartObject *lfcObj = [[WSChartObject alloc] init];
            lfcObj.name = [s pseudo];
            lfcObj.xValue = [NSString stringWithFormat:@"%d",i];
            lfcObj.yValue = [NSNumber numberWithFloat: s.score];
            NSDictionary *data = [[NSDictionary alloc] initWithObjectsAndKeys:lfcObj,[s pseudo], nil];
            [arr addObject:data];
            i++;
        }
    }
    /*
    for (int i=0; i< scores.count; i++)
    {
        WSChartObject *lfcObj = [[WSChartObject alloc] init];
        lfcObj.name = [score pseudo];
        lfcObj.xValue = [NSString stringWithFormat:@"%d",i];
        lfcObj.yValue = [NSNumber numberWithFloat: score.score];
        NSDictionary *data = [[NSDictionary alloc] initWithObjectsAndKeys:lfcObj,score.pseudo, nil];
        [arr addObject:data];
    }
     */
    return arr;
}

- (NSDictionary*)createColorDict
{
    NSDictionary *colorDict = [[NSDictionary alloc] initWithObjectsAndKeys:[UIColor redColor], currentPseudo,nil];
    return colorDict;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (void)viewDidUnload {
    [self setChartView:nil];
    [super viewDidUnload];
}

@end
