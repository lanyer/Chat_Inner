//
//  FriendViewController.m
//  Chat_Inner
//
//  Created by lanyer on 16/9/3.
//  Copyright (c) 2016年 lanyer. All rights reserved.
//

#import "FriendViewController.h"
#import "FriendListTableViewCell.h"
#import "XMPPFramework.h"
#import <CoreData/CoreData.h>
#import "ServeManager.h"

@interface FriendViewController ()<UITableViewDataSource,UITableViewDelegate,NSFetchedResultsControllerDelegate>
{
    NSFetchedResultsController *_resultController;//好友列表
}
@property (weak, nonatomic) IBOutlet UITableView *friendsTableView;
@end

@implementation FriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSManagedObjectContext *context = [[ServeManager sharedManager] rosterContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"XMPPUserCoreDataStorageObject" inManagedObjectContext:context];
    NSSortDescriptor *sd1 = [NSSortDescriptor sortDescriptorWithKey:@"sectionNum" ascending:YES];
    NSSortDescriptor *sd2 = [NSSortDescriptor sortDescriptorWithKey:@"displayName" ascending:YES];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    [request setSortDescriptors:@[sd1,sd2]];
    
    _resultController = [[NSFetchedResultsController alloc]initWithFetchRequest:request managedObjectContext:context sectionNameKeyPath:@"sectionNum" cacheName:nil];
    [_resultController setDelegate:self];
    
    [_resultController performFetch:nil];
}
-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [_friendsTableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_resultController sections].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *sections = _resultController.sections;
    id<NSFetchedResultsSectionInfo> sectionInfo = sections[section];
    return sectionInfo.numberOfObjects;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FriendListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendCell" forIndexPath:indexPath];
    XMPPUserCoreDataStorageObject *user = [_resultController objectAtIndexPath:indexPath];
    cell.nameLabel.text = user.jid.user;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}
@end
