//
//  ViewController.m
//  IOSTreeView
//
//  Created by Monang Champaneri on 20/06/17.
//  Copyright © 2017 Monang Champaneri. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSMutableDictionary *TreeView;
    UILabel *label;
    NSInteger LabelTag;
    NSInteger XnewLine;
    NSInteger XlinePosition;
    NSInteger YlinePosition;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self transformData];
    XnewLine=160;
    
    NSMutableArray *dataArray = [NSMutableArray new];
        //Demo Data Creation to represent the flat data
    [dataArray addObject:@{@"emp_id":@100}];
    [dataArray addObject:@{@"emp_id":@1000,@"mgr_id":@100}];
    [dataArray addObject:@{@"emp_id":@2000,@"mgr_id":@100}];
//    [dataArray addObject:@{@"emp_id":@3000,@"mgr_id":@2000}];
    [dataArray addObject:@{@"emp_id":@4000,@"mgr_id":@1000}];
    [dataArray addObject:@{@"emp_id":@4001,@"mgr_id":@1000}];
    [dataArray addObject:@{@"emp_id":@5000,@"mgr_id":@4000}];
    [dataArray addObject:@{@"emp_id":@5001,@"mgr_id":@4000}];
    [dataArray addObject:@{@"emp_id":@6002,@"mgr_id":@5000}];
    CGFloat width=self.view.frame.size.width;
    CGFloat xposition=width/2-15;
    CGFloat yposition=20;
    YlinePosition=yposition+30;
//    XlinePosition=30;
    
    
    for(int k =0;k<dataArray.count;k++){
        NSString *column=[[dataArray objectAtIndex:k] objectForKey:@"emp_id"];
        NSLog(@"----------------------------------");
        NSLog(@"Column:%@",column);
        NSLog(@"----------------------------------");
        NSInteger counter=0;
        
        if ([[dataArray objectAtIndex:k] objectForKey:@"mgr_id"]) {
        }
        else{
            label=[[UILabel alloc]init];
            [label setFrame:CGRectMake(xposition, yposition, 40, 30) ];
            [label setText:[NSString stringWithFormat:@"%@", [[dataArray objectAtIndex:k]objectForKey:@"emp_id"]]];
            [label setBackgroundColor:[UIColor lightGrayColor]];
            [label setAdjustsFontSizeToFitWidth:YES];
            [label setTextAlignment:NSTextAlignmentCenter];
            [self.view addSubview:label];
            YlinePosition=yposition+30;
            yposition=yposition+80;
            XlinePosition=xposition+20;
        }
        
        NSMutableArray *Subcolumn=[[NSMutableArray alloc] init];
            for(int i =0;i<dataArray.count;i++)
            {
                
                if([[dataArray objectAtIndex:i] objectForKey:@"mgr_id"]){
                if([column isEqual:[[dataArray objectAtIndex:i]objectForKey:@"mgr_id"]]){
                    counter=counter+1;
                    xposition=xposition-50;
                    UIBezierPath *path = [UIBezierPath bezierPath];
                    [path moveToPoint:CGPointMake(xposition+20, yposition)];
                    [path addLineToPoint:CGPointMake(XlinePosition, YlinePosition)];
                    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
                    shapeLayer.path = [path CGPath];
                    shapeLayer.strokeColor = [[UIColor blueColor] CGColor];
                    shapeLayer.lineWidth = 3.0;
                    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
                    [self.view.layer addSublayer:shapeLayer];
                    label=[[UILabel alloc]init];
                    [label setFrame:CGRectMake(xposition, yposition, 40, 30) ];
                    [label setText:[NSString stringWithFormat:@"%@", [[dataArray objectAtIndex:i]objectForKey:@"emp_id"]]];
                    [Subcolumn addObject:[NSString stringWithFormat:@"%@", [[dataArray objectAtIndex:i]objectForKey:@"emp_id"]]];
                    [label setTag:label.text.integerValue];
                    [label setBackgroundColor:[UIColor lightGrayColor]];
                    [label setAdjustsFontSizeToFitWidth:YES];
                    [label setTextAlignment:NSTextAlignmentCenter];
                    [self.view addSubview:label];
                    LabelTag=label.tag;
                    xposition=xposition+XnewLine;
                    NSLog(@"Sub Column:-%@",[[dataArray objectAtIndex:i] objectForKey:@"emp_id"]);
                    if (Subcolumn.count==1 || Subcolumn.count==0) {
                        NSLog(@"Nothing...");
                        NSLog(@"%@",Subcolumn);
                    }
                    else{
                        //for (int j=0; j<dataArray.count; i++) {
                            NSLog(@"Second Node is availbale...");
                            NSLog(@"%@",Subcolumn);
                        //}
                    }
//
                    }
                }
            }
        if(counter==0){
        }
        else{
            if(!LabelTag){
                YlinePosition=yposition+30;
                XlinePosition=xposition+20;
                yposition=yposition+80;
            }
            else{
                YlinePosition=yposition+30;
                xposition=xposition-XnewLine-110;
                XlinePosition=xposition+20;
                yposition=yposition+80;
//                XnewLine=XnewLine+60;
            }
        }
//
//
//        xposition=xposition-120;
    }
}

    
    
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
    
@end
