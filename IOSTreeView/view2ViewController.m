//
//  view2ViewController.m
//  IOSTreeView
//
//  Created by Monang Champaneri on 24/06/17.
//  Copyright © 2017 Monang Champaneri. All rights reserved.
//

#import "view2ViewController.h"

@interface view2ViewController ()
    @property (nonatomic, strong) NSNumber * CategoryId;
    @property (nonatomic, strong) NSString * Title;
    @property (nonatomic, strong) NSString * Description;
    @property (nonatomic, strong) NSNumber * ParentCategoryId;
    @property (nonatomic, strong) NSMutableArray* subCategories;
@end

@implementation view2ViewController{
NSMutableDictionary *TreeView;  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *dataArray = [NSMutableArray new];
        //Demo Data Creation to represent the flat data
    [dataArray addObject:@{@"emp_id":@100}];
    [dataArray addObject:@{@"emp_id":@1000,@"mgr_id":@100}];
    [dataArray addObject:@{@"emp_id":@2000,@"mgr_id":@100}];
    [dataArray addObject:@{@"emp_id":@4000,@"mgr_id":@1000}];
    [dataArray addObject:@{@"emp_id":@4001,@"mgr_id":@1000}];
    [dataArray addObject:@{@"emp_id":@5000,@"mgr_id":@4000}];
    [dataArray addObject:@{@"emp_id":@5001,@"mgr_id":@4000}];
    [dataArray addObject:@{@"emp_id":@6002,@"mgr_id":@5000}];
    CGFloat width=self.view.frame.size.width;
    CGFloat xposition=width/2-15;
    CGFloat yposition=20;
    
    for (int i=0; i<dataArray.count; i++) {
        NSLog(@"Mgr_id in I Loop:%@",[[dataArray objectAtIndex:i] objectForKey:@"emp_id"]);
        NSUInteger dataCount=0;
        if ([[dataArray objectAtIndex:i] objectForKey:@"mgr_id"]) {
            for (int k=0; k<dataArray.count; k++) {
                NSLog(@"Emp_id in K Loop:%@",[[dataArray objectAtIndex:k] objectForKey:@"emp_id"]);
                
                if ([[dataArray objectAtIndex:i] objectForKey:@"emp_id"] == [[dataArray objectAtIndex:k]objectForKey:@"mgr_id"])
                {
                
                UILabel *label=[[UILabel alloc]init];
                [label setFrame:CGRectMake(xposition, yposition, 40, 30) ];
                [label setText:[NSString stringWithFormat:@"%@", [[dataArray objectAtIndex:i]objectForKey:@"emp_id"]]];
                [label setBackgroundColor:[UIColor lightGrayColor]];
                [label setTag:i];
                [label setAdjustsFontSizeToFitWidth:YES];
                [label setTextAlignment:NSTextAlignmentCenter];
                [self.view addSubview:label];
                dataCount=dataCount+1;
                    //                    xposition=xposition-40;
                if (!i) {
                    xposition=xposition-60;
                }
                else{
                    xposition=xposition+140;
                }
                
                }
                else{
                        //
                }
                
            }
            NSLog(@"Total:----%lu",(unsigned long)dataCount);
                //For loop end...
        }
        else{
            UILabel *label=[[UILabel alloc]init];
            [label setFrame:CGRectMake(xposition, yposition, 40, 30) ];
            [label setText:[NSString stringWithFormat:@"%@", [[dataArray objectAtIndex:i]objectForKey:@"emp_id"]]];
            [label setBackgroundColor:[UIColor lightGrayColor]];
            [label setTag:i];
            [label setAdjustsFontSizeToFitWidth:YES];
            [label setTextAlignment:NSTextAlignmentCenter];
            [self.view addSubview:label];
            
            xposition=xposition-75;
        }
        yposition=yposition+40;
    }
    
    
    /*UILabel *label=[[UILabel alloc]init];
     [label setFrame:CGRectMake(xposition, yposition, width-40, 30) ];
     [label setText:[NSString stringWithFormat:@"%@", [[dataArray objectAtIndex:i]objectForKey:@"emp_id"]]];
     [label setBackgroundColor:[UIColor lightGrayColor]];
     [label setTag:i];
     [label setTextAlignment:NSTextAlignmentCenter];
     [self.view addSubview:label];
     yposition=yposition+40;*/
        // TreeView   =[[NSMutableDictionary alloc]init];
        //    NSMutableArray *Name=[[NSMutableArray alloc]init];
        //    [self create_a_Dictionary];
        //    UILabel *Head=[[UILabel alloc]initWithFrame:CGRectMake(20, 30, self.view.frame.size.width-40, 20)];
        //    [Head setBackgroundColor:[UIColor orangeColor]];
        //    Head.layer.cornerRadius=10;
        //    Head.layer.masksToBounds=YES;
        //    [Head setText:@"ABCD"];
        //
        //    [self.view addSubview:Head];
        //    NSArray *AllKey=[[NSArray alloc]initWithArray:TreeView.allKeys copyItems:YES];
        //    CGFloat yposition = Head.frame.origin.y+20;
        //    for (int j=0; j<[[TreeView objectForKey:[AllKey objectAtIndex:0]]count]; j++) {
        //            NSString *str=[NSString stringWithFormat:@"%@",[[TreeView objectForKey:[AllKey objectAtIndex:0]]objectAtIndex:j]];
        //        [Name removeAllObjects];
        //        yposition=yposition+40;
        //        for (int i=0; i<[[TreeView objectForKey:[AllKey objectAtIndex:0]]count]; i++) {
        //            if ([[[TreeView objectForKey:[AllKey objectAtIndex:1]]objectAtIndex:i] isEqualToString:str]) {
        //                [Name addObject:[[TreeView objectForKey:[AllKey objectAtIndex:2]]objectAtIndex:i]];
        //
        //
        //            }
        //        }
        //        NSLog(@"NAME:---%@",Name);
        //        NSString *counterofNode=[NSString stringWithFormat:@"%lu",(unsigned long)Name.count];
        //        CGFloat xposition=20.0;
        //        CGFloat lablewidths=50;
        //        for (int k=0; k<counterofNode.intValue; k++) {
        //            UILabel *NodeLable=[[UILabel alloc]init];
        //            [NodeLable setFrame:CGRectMake(xposition, yposition, lablewidths, 20)];
        //            xposition=xposition+lablewidths+20;
        //            [NodeLable setText:[Name objectAtIndex:k]];
        //            [NodeLable setBackgroundColor:[UIColor orangeColor]];
        //            [self.view addSubview:NodeLable];
        //        }
    
        //    }
}

    
        //-(void)create_a_Dictionary{
        //    NSMutableArray *Name=[[NSMutableArray alloc]initWithObjects:@"ABCD",@"ABC",@"DEF",@"GHI",@"AB",@"DE",@"AB",@"AC", nil];
        //    NSMutableArray *ArrayID=[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8", nil];
        //    NSMutableArray *Key=[[NSMutableArray alloc]initWithObjects:@"0",@"1",@"1",@"1",@"2",@"3",@"4",@"4", nil];
        //    [TreeView setObject:ArrayID forKey:@"id"];
        //    [TreeView setObject:Key forKey:@"key"];
        //    [TreeView setObject:Name forKey:@"name"];
        //    NSLog(@"Tree Direction:%@",TreeView);
        //}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
        //At this stage the flat Dict Looks like the following
    /*
     flatDict {
     id100 =     {
     "emp_id" = 100;
     };
     id1000 =     {
     "emp_id" = 1000;
     "mgr_id" = 100;
     };
     id2000 =     {
     "emp_id" = 2000;
     "mgr_id" = 100;
     };
     id4000 =     {
     "emp_id" = 4000;
     "mgr_id" = 1000;
     };
     id4001 =     {
     "emp_id" = 4001;
     "mgr_id" = 1000;
     };
     id5000 =     {
     "emp_id" = 5000;
     "mgr_id" = 4000;
     };
     id5001 =     {
     "emp_id" = 5001;
     "mgr_id" = 4000;
     };
     id6002 =     {
     "emp_id" = 6002;
     "mgr_id" = 5000;
     };
     }
     */
    
        //In the next step,we will add a new mutableArray as the value for a new key called as children
}/*
  -(void)transformData
  {
  NSMutableArray *dataArray = [NSMutableArray new];
  //Demo Data Creation to represent the flat data
  [dataArray addObject:@{@"emp_id":@1000,@"mgr_id":@100}];
  [dataArray addObject:@{@"emp_id":@2000,@"mgr_id":@100}];
  [dataArray addObject:@{@"emp_id":@4000,@"mgr_id":@1000}];
  [dataArray addObject:@{@"emp_id":@4001,@"mgr_id":@1000}];
  [dataArray addObject:@{@"emp_id":@5000,@"mgr_id":@4000}];
  [dataArray addObject:@{@"emp_id":@5001,@"mgr_id":@4000}];
  [dataArray addObject:@{@"emp_id":@6002,@"mgr_id":@5000}];
  [dataArray addObject:@{@"emp_id":@100}];
  
  NSMutableDictionary *flatDict = [NSMutableDictionary new];
  for (int i=0; i<dataArray.count; i++)
  {
  [flatDict setObject:[NSMutableDictionary dictionaryWithDictionary:dataArray[i]] forKey:[NSString stringWithFormat:@"id%d",[[[dataArray objectAtIndex:i] objectForKey:@"emp_id"]intValue]]];
  }
  
  for (NSString *key in [flatDict allKeys])
  {
  id obj = [flatDict objectForKey:key];
  [obj setObject:[NSMutableArray new] forKey:@"children"];
  //NSLog(@"%@",obj);
  }
  CGFloat xposition=0;
  CGFloat yposition=0;
  //In the below loop all possible combinations are created including the root.
  for (NSString *key in [flatDict allKeys])
  {
  UILabel *lable=[[UILabel alloc]init];
  id obj = [flatDict objectForKey:key];
  NSString *mgrId = [NSString stringWithFormat:@"id%d",[[obj objectForKey:@"mgr_id"] intValue]];
  xposition=xposition+50;
  
  if ([flatDict objectForKey:mgrId])
  {yposition=yposition+30;
  [lable setFrame:CGRectMake(xposition, yposition, 50, 30)];
  [lable setAdjustsFontSizeToFitWidth:YES];
  [lable setText:@"hello..."];
  
  [[[flatDict objectForKey:mgrId] objectForKey:@"children"] addObject:obj];
  
  }else{
  xposition=xposition-30;
  [lable setFrame:CGRectMake(xposition, yposition, 50, 30)];
  [lable setAdjustsFontSizeToFitWidth:YES];
  [lable setText:@"heloo"];
  }
  [self.view addSubview:lable];
  
  //        NSLog(@"Create:ROOT:%@",[flatDict objectForKey:key]);
  if ([[[flatDict objectForKey:key]objectForKey:@"children"] count]>=1) {
  //            NSLog(@"YES");
  }
  
  }
  
  //Creating a new root element from the flatDict. The below gets hold of only the root element where the manager id is null
  NSMutableArray *root = [NSMutableArray new];
  for (NSString *key in [flatDict allKeys])
  {
  
  id obj = [flatDict objectForKey:key];
  NSString *mgrId = [NSString stringWithFormat:@"id%d",[[obj objectForKey:@"mgr_id"] intValue]];
  //        NSLog(@"MRG ID:-%@",mgrId);
  if (![flatDict objectForKey:mgrId])
  {
  
  [root addObject:obj];
  
  }
  //        NSLog(@"ROOTFORLOOP:%@",[flatDict objectForKey:key]);
  }
  [self ArrayExtractInChild:root];
  
  }
  -(void)ArrayExtractInChild:(NSMutableArray *)Array{
  for (int i=0; i<[[Array objectAtIndex:0]count ]; i++) {
  
  for (NSString *element in [[Array objectAtIndex:0]objectForKey:@"children"]) {
  NSLog(@"%@", element);
  }
  }
  }
  
  */

@end
