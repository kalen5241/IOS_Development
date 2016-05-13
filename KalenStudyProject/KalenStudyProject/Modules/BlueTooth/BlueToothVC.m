//
//  BlueToothVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/5/13.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "BlueToothVC.h"
#import <CoreBluetooth/CoreBluetooth.h>

@interface BlueToothVC () <CBCentralManagerDelegate,CBPeripheralDelegate>

@property (nonatomic, strong) CBCentralManager *centralManager;
@property (nonatomic, strong) CBPeripheral *peripheral;
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


- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData
                  RSSI:(NSNumber *)RSSI
{
    
    if ([peripheral.name isEqualToString:@"OBDII"]) {
        NSLog(@">>>>>>>发现设备：%@",peripheral.name);
        _peripheral = peripheral;
        _peripheral.delegate = self;
        [central connectPeripheral:peripheral options:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:CBConnectPeripheralOptionNotifyOnDisconnectionKey]];    }
}

- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    
    NSLog(@">>>>>>>连接到设备：%@",peripheral.name);
    [central stopScan];
    [_peripheral discoverServices:nil];
    
}

#pragma mark --CBPeripheralDelegate

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(nullable NSError *)error {
    
    NSLog(@">>>>>>>发现设备：%@中的服务",peripheral.name);
    for (CBService *service in peripheral.services) {
        
        NSLog(@">>>>>>>服务名：%@",service);
        NSLog(@">>>>>>>UUID为：%@",service.UUID);
        [peripheral discoverCharacteristics:nil forService:service];
    }
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(nonnull CBService *)service error:(nullable NSError *)error {
    
    NSLog(@">>>>>>>发现服务：%@中的特征",service);
    
    for (CBCharacteristic *characteristic in service.characteristics) {
       
        NSLog(@">>>>>>>发现特征：%lu中的属性",(unsigned long)characteristic.properties);
        NSLog(@">>>>>>>发现特征值：%lu",(unsigned long)characteristic.value);
       
        //给蓝牙发数据
        [peripheral writeValue:[@"ATZ" dataUsingEncoding:NSUTF8StringEncoding] forCharacteristic:characteristic type:CBCharacteristicWriteWithResponse];
    }
    
}


//给蓝牙发数据,这时还会触发一个代理事件
- (void)peripheral:(CBPeripheral *)peripheral didWriteValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    
}


//处理蓝牙发过来的数据
- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    
}

@end
