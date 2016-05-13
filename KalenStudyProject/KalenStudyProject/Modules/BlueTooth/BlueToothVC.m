//
//  BlueToothVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/5/13.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "BlueToothVC.h"
#import <CoreBluetooth/CoreBluetooth.h>

@interface BlueToothVC () <CBCentralManagerDelegate>

@property (nonatomic, strong) CBCentralManager *centralManager;

@end

@implementation BlueToothVC

- (void)viewDidLoad {
    [super viewDidLoad];
}



- (IBAction)run:(UIButton *)sender {
    
    _centralManager = [[CBCentralManager alloc]initWithDelegate:self queue:nil];
    
}


#pragma mark --CBCentralManagerDelegate
- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    
    if (central.state != CBCentralManagerStatePoweredOn) {
        NSLog(@"蓝牙未启动");
        return;
    }
    [_centralManager scanForPeripheralsWithServices:nil options:nil];
}


- (void)centralManager:(CBCentralManager *)central
 didDiscoverPeripheral:(CBPeripheral *)peripheral
     advertisementData:(NSDictionary<NSString *,id> *)advertisementData
                  RSSI:(NSNumber *)RSSI
{
    
    
    NSLog(@">>>>>>>发现设备：%@",peripheral.name);
    
}

@end
