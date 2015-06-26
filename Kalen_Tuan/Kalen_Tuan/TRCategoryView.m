#import "TRCategoryView.h"
#import "TRCategory.h"
#import "TRMeataTool.h"

@interface TRCategoryView () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UITableView *secondTableView;
@property (nonatomic,assign) NSInteger selectedCategory;

@end
@implementation TRCategoryView

+ (instancetype)view {
    return [[[NSBundle mainBundle] loadNibNamed:@"TRCategoryView" owner:nil options:nil] lastObject];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.mainTableView) {
        NSLog(@"%lu",(unsigned long)[TRMeataTool categories].count);
        return  [TRMeataTool categories].count;
    }else{
        TRCategory *category = [TRMeataTool categories][self.selectedCategory];
        return category.subcategories.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.mainTableView) {
        NSArray *categoryArray = [TRMeataTool categories];
        TRCategory *category = categoryArray[indexPath.row];
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rightCell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"rightCell"];
        }
        cell.textLabel.text = category.name;
        cell.imageView.image = [UIImage imageNamed:category.icon];
        if (category.subcategories.count != 0) {
              cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        return cell;
    }else{
        NSArray *categoryArray = [TRMeataTool categories];
        TRCategory *category = categoryArray[self.selectedCategory];
        NSArray *subcategory = category.subcategories;
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leftCell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"leftCell"];
        }
        cell.textLabel.text = subcategory[indexPath.row];
        return cell;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.mainTableView) {
        self.selectedCategory = indexPath.row;
        [self.secondTableView reloadData];
    }
}

@end
