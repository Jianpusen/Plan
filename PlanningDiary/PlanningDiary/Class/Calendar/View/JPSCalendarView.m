//
//  JPSCalendarView.m
//  PlanningDiary
//
//  Created by 庄鹏泽 on 16/12/8.
//  Copyright © 2016年 庄鹏泽. All rights reserved.
//

#import "JPSCalendarView.h"
#import "JPSCalendarCell.h"
#import "CalendarModel.h"
NSString *const SZCalendarCellIdentifier = @"cell";


@interface JPSCalendarView()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *monthLabel;
@property (weak, nonatomic) IBOutlet UIButton *previousButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (nonatomic , strong) NSArray *weekDayArray;
@property (nonatomic , strong) UIView *mask;


@end

@implementation JPSCalendarView
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //    [self addTap];
    [self addSwipe];
    [self show];
}

- (void)awakeFromNib
{
    [_collectionView registerClass:[JPSCalendarCell class] forCellWithReuseIdentifier:SZCalendarCellIdentifier];
    _weekDayArray = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
}

- (void)customInterface
{
    CGFloat itemWidth = _collectionView.frame.size.width / 7;
    CGFloat itemHeight = _collectionView.frame.size.height / 7;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.itemSize = CGSizeMake(itemWidth, itemWidth);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    [_collectionView setCollectionViewLayout:layout animated:YES];
    
    
}

- (void)setDate:(NSDate *)date
{
    _date = date;
    [_monthLabel setText:[NSString stringWithFormat:@"%.2d-%i",[self month:date],[self year:date]]];
    [_collectionView reloadData];
}

#pragma mark - date

- (NSInteger)day:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components day];
}


- (NSInteger)month:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components month];
}

- (NSInteger)year:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components year];
}


- (NSInteger)firstWeekdayInThisMonth:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setFirstWeekday:1];//1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    [comp setDay:1];
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:comp];
    
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
    return firstWeekday - 1;
}

- (NSInteger)totaldaysInThisMonth:(NSDate *)date{
    NSRange totaldaysInMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return totaldaysInMonth.length;
}

- (NSInteger)totaldaysInMonth:(NSDate *)date{
    NSRange daysInLastMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return daysInLastMonth.length;
}

- (NSDate *)lastMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

- (NSDate*)nextMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = +1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

#pragma -mark collectionView delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return _weekDayArray.count;
    } else {
        return 42;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JPSCalendarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SZCalendarCellIdentifier forIndexPath:indexPath];
    CalendarModel *model = [[CalendarModel alloc] init];
    
    if (indexPath.section == 0) {//头部日期
        /*
         [cell.dateLabel setText:_weekDayArray[indexPath.row]];
         [cell.dateLabel setTextColor:[UIColor colorWithHexString:@"#15cc9c"]];
         */
        model.dateStr = _weekDayArray[indexPath.row];
        model.strColor = k_RGB(200, 200, 200);
        model.isBorder = NO;
    } else {
        
        NSInteger daysInThisMonth = [self totaldaysInMonth:_date];
        NSInteger firstWeekday = [self firstWeekdayInThisMonth:_date];
        
        NSInteger day = 0;
        NSInteger i = indexPath.row;
        
        if (i < firstWeekday) {//前面两种情况是，头部跟尾部没有日期的情况
            /*
             [cell.dateLabel setText:@""];
             */
            model.isBorder = NO;
        }else if (i > firstWeekday + daysInThisMonth - 1){
            /*
             [cell.dateLabel setText:@""];
             */
            model.isBorder = NO;
        }else{
            
            day = i - firstWeekday + 1;
            /*
             [cell.dateLabel setText:[NSString stringWithFormat:@"%zd",day]];
             [cell.dateLabel setTextColor:[UIColor colorWithHexString:@"#6f6f6f"]];
             */
            model.dateStr = [NSString stringWithFormat:@"%zd",day];
            model.strColor = [UIColor blueColor];//过去
            //日期加边框
            model.isBorder = YES;
            
            //this month
            
            if ([_today isEqualToDate:_date]) {
                if (day == [self day:_date]) {//当天
                    /*
                     [cell.dateLabel setTextColor:[UIColor colorWithHexString:@"#4898eb"]];
                     */
                    model.strColor = [UIColor yellowColor];
                    
                } else if (day > [self day:_date]) {//这个月还没到来的日子
                    /*
                     [cell.dateLabel setTextColor:[UIColor colorWithHexString:@"#cbcbcb"]];
                     */
                    model.strColor = [UIColor redColor];
                }
            } else if ([_today compare:_date] == NSOrderedAscending) {//下月份
                /*
                 [cell.dateLabel setTextColor:[UIColor colorWithHexString:@"#cbcbcb"]];
                 */
                model.strColor = [UIColor orangeColor];
            }
            
        }
    }
    cell.model = model;
    return cell;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        
        return YES;
        
    }
    return NO;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self.date];
    NSInteger firstWeekday = [self firstWeekdayInThisMonth:_date];
    
    NSInteger day = 0;
    NSInteger i = indexPath.row;
    day = i - firstWeekday + 1;
    if (self.calendarBlock) {
        self.calendarBlock(day, [comp month], [comp year]);
    }
    
    
}

- (IBAction)previouseAction:(UIButton *)sender
{
    [UIView transitionWithView:self duration:0.5 options:UIViewAnimationOptionTransitionCurlDown animations:^(void) {
        self.date = [self lastMonth:self.date];
    } completion:nil];
}

- (IBAction)nexAction:(UIButton *)sender
{
    [UIView transitionWithView:self duration:0.5 options:UIViewAnimationOptionTransitionCurlUp animations:^(void) {
        self.date = [self nextMonth:self.date];
    } completion:nil];
}

+ (instancetype)showOnView:(UIView *)view
{
    JPSCalendarView *calendarPicker = [[[NSBundle mainBundle] loadNibNamed:@"JPSCalendarView" owner:self options:nil] firstObject];
    calendarPicker.mask = [[UIView alloc] initWithFrame:view.bounds];
    calendarPicker.mask.backgroundColor = [UIColor blackColor];
    calendarPicker.mask.alpha = 0.3;
    [view addSubview:calendarPicker.mask];
    [view addSubview:calendarPicker];
    return calendarPicker;
}

- (void)show
{
    self.transform = CGAffineTransformTranslate(self.transform, 0, - self.frame.size.height);
    [UIView animateWithDuration:0.5 animations:^(void) {
        self.transform = CGAffineTransformIdentity;
    } completion:^(BOOL isFinished) {
        [self customInterface];
    }];
}


- (void)addSwipe
{
    UISwipeGestureRecognizer *swipLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(nexAction:)];
    swipLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:swipLeft];
    
    UISwipeGestureRecognizer *swipRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(previouseAction:)];
    swipRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self addGestureRecognizer:swipRight];
}

@end
