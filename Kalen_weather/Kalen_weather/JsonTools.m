#import "TRWeather.h"
#import "JsonTools.h"

@implementation JsonTools
+(void)Json:(NSData *)data{
    NSDictionary *jsonData  = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    TRWeather *temp   = [TRWeather sharedWeatherData];
    temp.cityName     = jsonData[@"data"][@"request"][0][@"query"];
    temp.dailyArray   = jsonData[@"data"][@"weather"];
    temp.hourlyArray  = jsonData[@"data"][@"weather"][0][@"hourly"];
    temp.iconURL      = jsonData[@"data"][@"current_condition"][0][@"weatherIconUrl"][0][@"value"];
    temp.iconName     = [TRWeather imageMap][temp.iconURL];
    temp.weatherDesc  = jsonData[@"data"][@"current_condition"][0][@"weatherDesc"][0][@"value"];
    temp.temp         = [jsonData[@"data"][@"current_condition"][0][@"temp_C"] floatValue];
    temp.maxTemp      = [jsonData[@"data"][@"weather"][0][@"maxtempC"] floatValue];
    temp.minTemp      = [jsonData[@"data"][@"weather"][0][@"mintempC"] floatValue];
    temp.cityName     = jsonData[@"data"][@"request"][0][@"query"];
}

@end
