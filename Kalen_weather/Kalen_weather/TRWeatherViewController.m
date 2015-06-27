
#import "TRWeatherViewController.h"
#import "Layout.h"
#import "TRHeaderView.h"
#import "HTTPTool.h"
#import "JsonTools.h"
#import "TRWeather.h"

@interface TRWeatherViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIImageView *backgroudImageView;
@property (nonatomic,strong) TRHeaderView *headView;
@property (nonatomic,strong) NSArray *days;
@property (nonatomic,strong) NSArray *hours;
@property (nonatomic,strong) NSURL* url;
@end

@implementation TRWeatherViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.url = [NSURL URLWithString:@"http://api.worldweatheronline.com/free/v2/weather.ashx?q=beijing&num_of_days=2&format=json&tp=6&key=47722af12eecece70a05f6764b346"];
    //num_of_days=2    tp=6 可以被提取为宏
    [self initTableView];
    [self initHeadView];
    [self request];
}

-(void)request{
    //for notification kalen
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveMessage:) name:@"update" object:nil];
   [HTTPTool sendRequest:self.url];
}

//for notification kalen
-(void)receiveMessage:(NSNotification *)notification{
    //获取通知对象中的消息
    //也就是获取company发送的那个字典 数据
    NSDictionary *message = notification.userInfo;
    //按照key值，取到value
    NSLog(@"已经更新到了%@",message);
    
    [JsonTools Json:message[@"JsonData"]];
     TRWeather *temp   = [TRWeather sharedWeatherData];
    NSLog(@"%@",temp.cityName);
    
    
    [self.tableView reloadData];
    [self initHeadView];
}

//for notification kalen
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)initHeadView{
    TRWeather *temp = [TRWeather sharedWeatherData];
    CGRect headerFrame = [UIScreen mainScreen].bounds;
    self.headView = [[TRHeaderView alloc] initWithFrame:headerFrame];
    self.headView.backgroundColor = [UIColor clearColor];
    self.headView.cityLabel.text =temp.cityName;
    NSLog(@"%@",self.headView.cityLabel.text);
    self.headView.temperatureLabel.text = [NSString stringWithFormat:@"%.0f°",temp.temp];
    self.headView.hiloLabel.text = [NSString stringWithFormat:@"%.0f° / %.0f°",temp.minTemp,temp.maxTemp];
    self.headView.conditionsLabel.text = temp.weatherDesc;
    self.tableView.tableHeaderView = self.headView;
}


-(void)initTableView{
    CGRect bounds = self.view.bounds;
    self.backgroudImageView = [[UIImageView alloc]initWithFrame:bounds];
    self.backgroudImageView.image = [UIImage imageNamed:@"bg.png"];
    [self.view addSubview:self.backgroudImageView];
    self.tableView = [[UITableView alloc]init];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.frame = bounds;
    self.tableView.separatorColor = [UIColor colorWithWhite:1 alpha:0.2];
    self.tableView.pagingEnabled =YES;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.days.count+1;
    }else{
        return self.hours.count+1;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"weatherCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    
    cell.backgroundColor=[UIColor colorWithWhite:1 alpha:0];
    cell.textLabel.textColor =[UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"daily forecast";
        }else{
            cell.textLabel.text = @"weather value";
        }
        
    }else{
        if (indexPath.row == 0) {
            cell.textLabel.text = @"hourly forecast";
        }else{
            cell.textLabel.text = @"weather value";
        }
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 44;
//}

/*
 http://api.worldweatheronline.com/free/v2/weather.ashx?q=beijing&num_of_days=2&format=json&tp=6&key=47722af12eecece70a05f6764b346
 */

/*  Json数据
 { "data": { "current_condition": [ {"cloudcover": "0", "FeelsLikeC": "31", "FeelsLikeF": "88", "humidity": "46", "observation_time": "11:57 AM", "precipMM": "0.0", "pressure": "1006", "temp_C": "30", "temp_F": "86", "visibility": "10", "weatherCode": "113",  "weatherDesc": [ {"value": "Clear" } ],  "weatherIconUrl": [ {"value": "http:\/\/cdn.worldweatheronline.net\/images\/wsymbols01_png_64\/wsymbol_0008_clear_sky_night.png" } ], "winddir16Point": "S", "winddirDegree": "170", "windspeedKmph": "15", "windspeedMiles": "9" } ],  "request": [ {"query": "Beijing, China", "type": "City" } ],  "weather": [ { "astronomy": [ {"moonrise": "11:08 AM", "moonset": "11:47 PM", "sunrise": "04:46 AM", "sunset": "07:47 PM" } ], "date": "2015-06-23",  "hourly": [ {"chanceoffog": "0", "chanceoffrost": "0", "chanceofhightemp": "0", "chanceofovercast": "0", "chanceofrain": "10", "chanceofremdry": "0", "chanceofsnow": "0", "chanceofsunshine": "100", "chanceofthunder": "0", "chanceofwindy": "0", "cloudcover": "12", "DewPointC": "17", "DewPointF": "63", "FeelsLikeC": "25", "FeelsLikeF": "77", "HeatIndexC": "25", "HeatIndexF": "77", "humidity": "71", "precipMM": "0.3", "pressure": "1007", "tempC": "23", "tempF": "73", "time": "200", "visibility": "10", "weatherCode": "113",  "weatherDesc": [ {"value": "Clear" } ],  "weatherIconUrl": [ {"value": "http:\/\/cdn.worldweatheronline.net\/images\/wsymbols01_png_64\/wsymbol_0008_clear_sky_night.png" } ], "WindChillC": "23", "WindChillF": "73", "winddir16Point": "ENE", "winddirDegree": "66", "WindGustKmph": "12", "WindGustMiles": "8", "windspeedKmph": "8", "windspeedMiles": "5" }, {"chanceoffog": "0", "chanceoffrost": "0", "chanceofhightemp": "100", "chanceofovercast": "0", "chanceofrain": "8", "chanceofremdry": "0", "chanceofsnow": "0", "chanceofsunshine": "100", "chanceofthunder": "0", "chanceofwindy": "0", "cloudcover": "12", "DewPointC": "19", "DewPointF": "67", "FeelsLikeC": "29", "FeelsLikeF": "84", "HeatIndexC": "29", "HeatIndexF": "84", "humidity": "61", "precipMM": "0.2", "pressure": "1008", "tempC": "28", "tempF": "82", "time": "800", "visibility": "10", "weatherCode": "113",  "weatherDesc": [ {"value": "Sunny" } ],  "weatherIconUrl": [ {"value": "http:\/\/cdn.worldweatheronline.net\/images\/wsymbols01_png_64\/wsymbol_0001_sunny.png" } ], "WindChillC": "28", "WindChillF": "82", "winddir16Point": "ENE", "winddirDegree": "64", "WindGustKmph": "8", "WindGustMiles": "5", "windspeedKmph": "6", "windspeedMiles": "4" }, {"chanceoffog": "0", "chanceoffrost": "0", "chanceofhightemp": "100", "chanceofovercast": "0", "chanceofrain": "0", "chanceofremdry": "0", "chanceofsnow": "0", "chanceofsunshine": "100", "chanceofthunder": "0", "chanceofwindy": "0", "cloudcover": "10", "DewPointC": "17", "DewPointF": "63", "FeelsLikeC": "37", "FeelsLikeF": "98", "HeatIndexC": "37", "HeatIndexF": "98", "humidity": "35", "precipMM": "0.0", "pressure": "1005", "tempC": "35", "tempF": "95", "time": "1400", "visibility": "10", "weatherCode": "113",  "weatherDesc": [ {"value": "Sunny" } ],  "weatherIconUrl": [ {"value": "http:\/\/cdn.worldweatheronline.net\/images\/wsymbols01_png_64\/wsymbol_0001_sunny.png" } ], "WindChillC": "35", "WindChillF": "95", "winddir16Point": "SSW", "winddirDegree": "193", "WindGustKmph": "19", "WindGustMiles": "12", "windspeedKmph": "16", "windspeedMiles": "10" }, {"chanceoffog": "0", "chanceoffrost": "0", "chanceofhightemp": "100", "chanceofovercast": "0", "chanceofrain": "24", "chanceofremdry": "0", "chanceofsnow": "0", "chanceofsunshine": "82", "chanceofthunder": "0", "chanceofwindy": "0", "cloudcover": "33", "DewPointC": "17", "DewPointF": "63", "FeelsLikeC": "37", "FeelsLikeF": "99", "HeatIndexC": "37", "HeatIndexF": "99", "humidity": "47", "precipMM": "0.4", "pressure": "1006", "tempC": "34", "tempF": "94", "time": "2000", "visibility": "9", "weatherCode": "176",  "weatherDesc": [ {"value": "Patchy rain nearby" } ],  "weatherIconUrl": [ {"value": "http:\/\/cdn.worldweatheronline.net\/images\/wsymbols01_png_64\/wsymbol_0025_light_rain_showers_night.png" } ], "WindChillC": "34", "WindChillF": "94", "winddir16Point": "SSE", "winddirDegree": "151", "WindGustKmph": "22", "WindGustMiles": "14", "windspeedKmph": "12", "windspeedMiles": "8" } ], "maxtempC": "36", "maxtempF": "97", "mintempC": "23", "mintempF": "73", "uvIndex": "8" }, { "astronomy": [ {"moonrise": "12:04 PM", "moonset": "No moonset", "sunrise": "04:46 AM", "sunset": "07:47 PM" } ], "date": "2015-06-24",  "hourly": [ {"chanceoffog": "0", "chanceoffrost": "0", "chanceofhightemp": "85", "chanceofovercast": "0", "chanceofrain": "100", "chanceofremdry": "0", "chanceofsnow": "0", "chanceofsunshine": "47", "chanceofthunder": "0", "chanceofwindy": "0", "cloudcover": "75", "DewPointC": "19", "DewPointF": "66", "FeelsLikeC": "25", "FeelsLikeF": "77", "HeatIndexC": "25", "HeatIndexF": "77", "humidity": "76", "precipMM": "0.4", "pressure": "1007", "tempC": "23", "tempF": "74", "time": "200", "visibility": "10", "weatherCode": "353",  "weatherDesc": [ {"value": "Light rain shower" } ],  "weatherIconUrl": [ {"value": "http:\/\/cdn.worldweatheronline.net\/images\/wsymbols01_png_64\/wsymbol_0025_light_rain_showers_night.png" } ], "WindChillC": "23", "WindChillF": "74", "winddir16Point": "N", "winddirDegree": "356", "WindGustKmph": "11", "WindGustMiles": "7", "windspeedKmph": "8", "windspeedMiles": "5" }, {"chanceoffog": "0", "chanceoffrost": "0", "chanceofhightemp": "100", "chanceofovercast": "0", "chanceofrain": "4", "chanceofremdry": "0", "chanceofsnow": "0", "chanceofsunshine": "100", "chanceofthunder": "0", "chanceofwindy": "0", "cloudcover": "16", "DewPointC": "20", "DewPointF": "69", "FeelsLikeC": "30", "FeelsLikeF": "86", "HeatIndexC": "30", "HeatIndexF": "86", "humidity": "64", "precipMM": "0.0", "pressure": "1007", "tempC": "28", "tempF": "82", "time": "800", "visibility": "10", "weatherCode": "113",  "weatherDesc": [ {"value": "Sunny" } ],  "weatherIconUrl": [ {"value": "http:\/\/cdn.worldweatheronline.net\/images\/wsymbols01_png_64\/wsymbol_0001_sunny.png" } ], "WindChillC": "28", "WindChillF": "82", "winddir16Point": "NE", "winddirDegree": "54", "WindGustKmph": "7", "WindGustMiles": "4", "windspeedKmph": "6", "windspeedMiles": "4" }, {"chanceoffog": "0", "chanceoffrost": "0", "chanceofhightemp": "100", "chanceofovercast": "0", "chanceofrain": "0", "chanceofremdry": "0", "chanceofsnow": "0", "chanceofsunshine": "96", "chanceofthunder": "0", "chanceofwindy": "0", "cloudcover": "24", "DewPointC": "14", "DewPointF": "57", "FeelsLikeC": "36", "FeelsLikeF": "97", "HeatIndexC": "36", "HeatIndexF": "97", "humidity": "26", "precipMM": "0.0", "pressure": "1003", "tempC": "36", "tempF": "97", "time": "1400", "visibility": "10", "weatherCode": "113",  "weatherDesc": [ {"value": "Sunny" } ],  "weatherIconUrl": [ {"value": "http:\/\/cdn.worldweatheronline.net\/images\/wsymbols01_png_64\/wsymbol_0001_sunny.png" } ], "WindChillC": "36", "WindChillF": "97", "winddir16Point": "S", "winddirDegree": "191", "WindGustKmph": "22", "WindGustMiles": "14", "windspeedKmph": "19", "windspeedMiles": "12" }, {"chanceoffog": "0", "chanceoffrost": "0", "chanceofhightemp": "100", "chanceofovercast": "0", "chanceofrain": "31", "chanceofremdry": "0", "chanceofsnow": "0", "chanceofsunshine": "1", "chanceofthunder": "0", "chanceofwindy": "0", "cloudcover": "45", "DewPointC": "14", "DewPointF": "57", "FeelsLikeC": "35", "FeelsLikeF": "95", "HeatIndexC": "35", "HeatIndexF": "95", "humidity": "37", "precipMM": "0.1", "pressure": "1002", "tempC": "33", "tempF": "92", "time": "2000", "visibility": "10", "weatherCode": "176",  "weatherDesc": [ {"value": "Patchy rain nearby" } ],  "weatherIconUrl": [ {"value": "http:\/\/cdn.worldweatheronline.net\/images\/wsymbols01_png_64\/wsymbol_0025_light_rain_showers_night.png" } ], "WindChillC": "33", "WindChillF": "92", "winddir16Point": "S", "winddirDegree": "178", "WindGustKmph": "26", "WindGustMiles": "16", "windspeedKmph": "14", "windspeedMiles": "9" } ], "maxtempC": "36", "maxtempF": "97", "mintempC": "23", "mintempF": "74", "uvIndex": "9" } ] }}
 
 */


@end
