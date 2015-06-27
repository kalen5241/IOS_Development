
#import "TRWeather.h"
static NSString * const iconURLString = @"http://cdn.worldweatheronline.net/images/wsymbols01_png_64/wsymbol_";
@implementation TRWeather

+(instancetype)sharedWeatherData{
    static TRWeather* sharedDataCenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sharedDataCenter = [[self alloc] init];
    });
    return sharedDataCenter;
}

+(NSDictionary *)imageMap{
    return @{
             [NSString stringWithFormat:@"%@0001_sunny.png",iconURLString]:@"weather-clear.png",
             [NSString stringWithFormat:@"%@0003_white_cloud.png",iconURLString]:@"weather-few.png",
             [NSString stringWithFormat:@"%@0004_black_low_cloud.png",iconURLString]:@"weather-scattered.png",
             [NSString stringWithFormat:@"%@0004_black_low_cloud.png",iconURLString]:@"weather-broken",
             [NSString stringWithFormat:@"%@0009_light_rain_showers.png",iconURLString]:@"weather-shower",
             [NSString stringWithFormat:@"%@0025_light_rain_showers_night.png",iconURLString]:@"weather-rain",
             @"11d":@"weather-tstorm",
             @"13d":@"weather-snow",
             [NSString stringWithFormat:@"%@0006_mist.png",iconURLString]
             :@"weather-mist",
             [NSString stringWithFormat:@"%@0008_clear_sky_night.png",iconURLString]:@"weather-moon",
             @"02n":@"weather-few-night",
             @"03n":@"weather-few-night",
             [NSString stringWithFormat:@"%@0002_sunny_intervals.png",iconURLString]:@"weather-broken",
             @"09n":@"weather-shoer",
             [NSString stringWithFormat:@"%@0025_light_rain_showers_night.png",iconURLString]:@"weather-rain-night",
             @"11n":@"weather-tstorm",
             @"13n":@"weather-snow",
             @"50n":@"weather-mist"
             };

}
@end
