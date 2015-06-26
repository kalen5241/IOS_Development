#import "TRDeal.h"
@implementation TRDeal
+(id)parseDealWithDictionary:(NSDictionary *)dic{
    return [[self alloc]initWithDealDic:dic];
}

-(id)initWithDealDic:(NSDictionary *)dic{
    self = [super init];
    if (!self) {
        self.deal_id = dic[@"deal_id"];
        self.title = dic[@"title"];
        self.desc = dic[@"description"];
        self.city = dic[@"city"];
        self.list_price = dic[@"list_price"];
        self.current_price = dic[@"current_price"];
        self.regions = dic[@"regions"];
        self.categories = dic[@"categories"];
        self.purchase_count =(int)dic[@"purchase_count"];
        self.purchase_deadline = dic[@" purchase_deadline"];
        self.publish_date = dic[@"publish_date"];
        self.distance = dic[@"distance"];
        self.image_url = dic[@"image_url"];
        self.s_image_url = dic[@"s_image_url"];
        self.deal_url = dic[@"deal_url"];
        self.deal_h5_url = dic[@" deal_h5_url"];
        self.commission_ratio = dic[@"commission_ratio"];
        self.businesses = dic[@"businesses"];
    }
    return self;
}
@end
