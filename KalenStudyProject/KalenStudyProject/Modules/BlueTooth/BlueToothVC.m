//
//  BlueToothVC.m
//  KalenStudyProject
//
//  Created by kalen on 16/5/13.
//  Copyright © 2016年 kalen. All rights reserved.
//

#import "BlueToothVC.h"
#import <CoreBluetooth/CoreBluetooth.h>

#define SERVER_UUID [CBUUID UUIDWithString:@"FFF0"]
#define READ_UUID [CBUUID UUIDWithString:@"FFF1"]
#define WRITE_UUID [CBUUID UUIDWithString:@"FFF2"]

static int sendflag = 0;

@interface BlueToothVC () <CBCentralManagerDelegate,CBPeripheralDelegate>

@property (nonatomic, strong) CBCentralManager *centralManager;
@property (nonatomic, strong) CBPeripheral *peripheral;
@property (nonatomic, strong) CBService *service;
@property (nonatomic, strong) CBCharacteristic *writeCharacteristic;
@property (nonatomic, strong) NSMutableString *tempString;
@property (nonatomic, assign) BOOL start;

@end

@implementation BlueToothVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.start = NO;
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
    [_peripheral discoverServices:@[SERVER_UUID]];
    
}

#pragma mark --CBPeripheralDelegate

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(nullable NSError *)error {
    
    NSLog(@">>>>>>>发现设备：%@中的服务",peripheral.name);
    for (CBService *service in peripheral.services) {
        
//        NSLog(@">>>>>>>服务名：%@",service);
//        NSLog(@">>>>>>>UUID为：%@",service.UUID);
        
        if ([service.UUID isEqual:SERVER_UUID]) {
            self.service = service;
            [self.peripheral discoverCharacteristics:nil forService:service];
        }
    }
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(nonnull CBService *)service error:(nullable NSError *)error {
    
//    NSLog(@">>>>>>>发现服务：%@中的特征",service);
    
    for (CBCharacteristic *characteristic in service.characteristics) {
       
        NSLog(@"特征有：%@",characteristic.UUID);
        
//        NSLog(@">>>>>>>发现特征：%lu中的属性",(unsigned long)characteristic.properties);
//        NSLog(@">>>>>>>发现特征值：%lu",(unsigned long)characteristic.value);
       
        if ([characteristic.UUID isEqual:READ_UUID]) {
            [self.peripheral setNotifyValue:YES forCharacteristic:characteristic];
        }
        
        if ([characteristic.UUID isEqual:WRITE_UUID]) {
            
        self.writeCharacteristic = characteristic;
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(writeValue:) userInfo:nil repeats:YES];
        
            [[NSRunLoop currentRunLoop] run];
        });
       }
    }
}

- (void)writeValue:(NSTimer*)timer {
    
    NSArray *arr = @[@"ATSP0\r\n",@"ATE0\r\n",@"0100\r\n"];
    
    if (self.start == YES) {
        if (sendflag >= 0 && sendflag <= 2) {
            [self.peripheral writeValue:[arr[sendflag] dataUsingEncoding:NSUTF8StringEncoding] forCharacteristic:self.writeCharacteristic type:CBCharacteristicWriteWithResponse];
            [NSThread sleepForTimeInterval:30];
            sendflag ++;
        }
    }
    else {
        [self.peripheral writeValue:[@"ATZ\r\n" dataUsingEncoding:NSUTF8StringEncoding] forCharacteristic:self.writeCharacteristic type:CBCharacteristicWriteWithResponse];
        [NSThread sleepForTimeInterval:3];
    }
}


//给蓝牙发数据,这时还会触发一个代理事件
- (void)peripheral:(CBPeripheral *)peripheral didWriteValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    if (error) {
        NSLog(@">>>>写入失败");
    }else {
        
        NSLog(@">>>>写入成功");
    }
}


//处理蓝牙发过来的数据
- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    
    NSLog(@">>>>>检测到更新");
    NSString *str = [NSString stringWithUTF8String:[characteristic.value bytes]];
    NSLog(@">>>>>内容：%@",str);
    if (str.length >= 16) {
        NSRange range = NSMakeRange(2, 6);
        if ([[str substringWithRange:range] isEqualToString:@"ELM327"]) {
            self.start = YES;
        }
    }
    
    NSLog(@">>>>>长度：%lu",(unsigned long)[str length]);
}

@end
