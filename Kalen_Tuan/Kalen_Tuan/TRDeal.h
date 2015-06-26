#import <Foundation/Foundation.h>
@interface TRDeal : NSObject
@property(nonatomic,strong) NSString* deal_id;
@property(nonatomic,strong) NSString* title;
 @property(nonatomic,strong)NSString* desc;
@property(nonatomic,strong) NSString* city;
@property(nonatomic,strong) NSNumber* list_price;
@property(nonatomic,strong) NSNumber* current_price;
@property(nonatomic,strong) NSArray* regions;
@property(nonatomic,strong) NSArray* categories;
@property (nonatomic,assign) int purchase_count;
@property(nonatomic,strong) NSString* purchase_deadline;
@property(nonatomic,strong) NSString* publish_date;
@property(nonatomic,strong) NSNumber* distance;
@property(nonatomic,strong) NSString* image_url;
@property(nonatomic,strong) NSString* s_image_url;
@property(nonatomic,strong) NSString* deal_url;
@property(nonatomic,strong) NSString* deal_h5_url;
@property(nonatomic,strong) NSNumber* commission_ratio;
@property(nonatomic,strong) NSArray* businesses;

+(id)parseDealWithDictionary:(NSDictionary *)dic;
-(id)initWithDeal:(id)deal;

@end
