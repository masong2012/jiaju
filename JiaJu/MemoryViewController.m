//
//  MemoryViewController.m
//  JiaJu
//
//  Created by MaSong on 2017/6/16.
//  Copyright © 2017年 MaSong. All rights reserved.
//

#import "MemoryViewController.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "MWPhotoBrowser.h"

@interface ItemCell : UICollectionViewCell
@property (strong, nonatomic) UIImageView *imageView;
@end
@implementation ItemCell
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        _imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
    }
    return _imageView;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
        self.clipsToBounds = YES;
    }
    return self;
}

@end


@interface ItemModel : NSObject
@property (strong, nonatomic) NSString *imageName;
@property (assign, nonatomic) CGSize imageSize;
@end

@implementation ItemModel
@end
@interface MemoryViewController ()<UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout,MWPhotoBrowserDelegate>
@property (strong, nonatomic) NSMutableArray *photos;
@property (strong, nonatomic) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation MemoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    self.title = @"回忆";
    
    CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.view addSubview:_collectionView];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[ItemCell class] forCellWithReuseIdentifier:@"item"];
    
    
    self.dataArray = [NSMutableArray new];
    self.photos = [NSMutableArray array];
    ItemModel *item = nil;
    
    NSArray *imageNames = @[
                            @"0140b777a2314b6686cb05a2231e3987_th.jpg",
                            @"b3edfba003ce455aa74e41ea04029169_th.jpg",
                            @"01a142e3c32046dc9407b4129a8117fc_th.jpg",
                            @"b5d774220b2049189143eda158ba1614_th.jpg",
                            @"04f05e0d424540b48a3b4f00acb4e893_th.jpg",
                            @"b60586f27456412a9137f811f90bbf7f_th.jpg",
                            @"06ab5271-4435-4958-8e1a-0d8c963e86e3.jpg",
                            @"b742fb2379b344a293261a2fa4998db2_th.jpg",
                            @"0abf14a7eed54e9faca5f44b665f2a9c_th.jpg",
                            @"b939ca9f239b42ba89e930c3838db321_th.jpg",
                            @"0c640936c9b94274b01c93b0621cefe9_th.jpg",
                            @"ba29755773574d6ba8666da878dc917a_th.jpg",
                            @"16555e4959584b2c8277981b746266e7_th.jpg",
                            @"19f1b1f2d87346e894f8e563bd67f5fb_th.jpg",
                            @"1b4c510fd9f9d72aa5d8a0e8d12a2834359bbb83.jpg",
                            @"bc3d8fbc95d844c6872c8b31ae8b7ecf_th.jpg",
                            @"1d76d421a6704a35ae5fc0c923592f08_th.jpg",
                            @"bc6d3dd9cdeb463f99bf6e9b6a9dcb31_th.jpg",
                            @"1ef626fde8924820bd8ff946b6b0c9cf_th.jpg",
                            @"be2eee8656d64cce9e47090aed5dcc11_th.jpg",
                            @"20170614163220_f618f646242eef63b9aabf9a06508d72_1.png",
                            @"c4a28ef8-1f09-4104-af73-7660d3f9f53b.jpg",
                            @"20170614163220_f618f646242eef63b9aabf9a06508d72_2.png",
                            @"c890f430cd184a6d81b6821fa60e92a8_th.jpg",
                            @"212d94df5c8a4b5784fd374e1773fc2c.jpg",
                            @"cc4cdb633268404e9677455f1818f0ac_th.jpg",
                            @"21812f05ab0c42c69ae704214501269b_th.jpg",
                            @"cd30070c155547f5a9eb59533a9da7f5_th.jpg",
                            @"23feece16aee456d935f4b4f8e5d7e00.jpg",
                            @"cd495f06062c4fdaad838d81389bd1f7_th.jpg",
                            @"25ce01b9136640ce8caf6c3348ffad63_th.jpg",
                            @"cdc35fa1fa0c40fb8b1772b0e8aa8213_th.jpg",
                            @"2995dc1cb5e04ae994d55a9dd22b17f7_th.jpg",
                            @"d1057047cbf04dcd88be21c109a76d1e_th.jpg",
                            @"327c0c904d9c4e5b9c38b1234e39c284_th.jpg",
                            @"d11d275b58254128ba0f7bbc46c43aab_th.jpg",
                            @"3478c01a5a6d4c138c7a3d23500f82e0_th.jpg",
                            @"d1768264d2314e28932cb9a6fa096715.jpg",
                            @"34b113eebf494080a6e69e9fff297ed7_th.jpg",
                            @"dc60e526d25d4f37a409eb1f59997777_th.jpg",
                            @"34d7356a29b54ea4be7e5b50c15f51b4_th.jpg",
                            @"deeb7cfcc7c6427d8489f8eccc45bfb6.jpg",
                            @"350904583396407290b9fc0c08d338de_th.jpg",
                            @"e09079eafdc04807a5ab06b7d7ae9ce0_th.jpg",
                            @"377b3b564d9c42148be81c77f4464d98.jpg",
                            @"eb68e21739ee40f089a11f5d3bb76a07_th.jpg",
                            @"38389c71c5764cb2a93cf06088b93c90_th.jpg",
                            @"ecbb9213b2404fabad7423444b42b7b7_th.jpg",
                            @"39273f58e59046e79d8de9957f68378e_th.jpg",
                            @"eed2f93b87d344d2bbc208f4067794df_th.jpg",
                            @"3ba9ebe15e7c46d9af8c8fcf9681c0f0_th.jpg",
                            @"3f8bd3df2c8743389fc98abb6d1d169b_th.jpg",
                            @"f0071500876147b08eed73021fe8c40b_th.jpg",
                            @"40095c4657824555bfd832e2c2bb5a0b_th.jpg",
                            @"f3b6285928bc4561948392f344a1bc7a_th.jpg",
                            @"42d0b60f51624737a92dd456f76bba6d_th.jpg",
                            @"f444e198be2443ac836be912ebdc5a35_th.jpg",
                            @"44fa3a6d-3f56-49e1-a973-1a7e6f07d14e.jpg",
                            @"f5215a07526a4239bc38d0833cd237d7_th.jpg",
                            @"467210dee51a4d54ac290e3cb53914f5_th.jpg",
                            @"f5fa22279a554d2b9bddd7c02d361317_th.jpg",
                            @"4a0446ed8d0a44f9b9dd643313bb0591_th.jpg",
                            @"f74890e5507a480a8923e16741ccac77_th.jpg",
                            @"4a09d85c6fc4410bb6d338fa7aefc7d1_th.jpg",
                            @"fd9a8018a9d342cfadc9782de3cfb510_th.jpg",
                            @"4a0fefd76ab04389935bea1d9608610b_th.jpg",
                            @"fdbc0fdcab354479908eb9c3d4f72db6_th.jpg",
                            @"4b1c98d2c0b44255b256c3f0ab23eafd_th.jpg",
                            @"51f9b43d865b46eaaf068e4b81dde18c_th.jpg",
                            @"5389552516c34cf196d82699995641e0_th.jpg",
                            @"54c2442dc9a6426182d463d07bda73d2_th.jpg",
                            @"570a56f7591946c49019105b735a9cc5_th.jpg",
                            @"5a229a767f6e4bfabb52087e6afebc7d_th.jpg",
                            @"5a6587d4b439444b86d7ca04db98e454_th.jpg",
                            @"5cea4f15b5474bb5aa653867fe876989_th.jpg",
                            @"64c69cdf01ec49929957d78f0ee53f18_th.jpg",
                            @"64f18d3bb9b745c99c95a2e4758fce62_th.jpg",
                            @"6520860029784146a1416a2169ee4281_th.jpg",
                            @"66182af43b1343c18fb4bf0d936da742_th.jpg",
                            @"677f257b2c5a43ebaab9dbd4ec620788_th.jpg",
                            @"6ac0a92d41b14843924d1792697c0ee7_th.jpg",
                            @"6c99f85e3686479ebacf6e39aad7e5d3_th.jpg",
                            @"6e0eb132e33541a6a6fb623b0a63d2e5_th.jpg",
                            @"6ef3a710cc074adb8e00f5808216fd39.jpg",
                            @"7338a8e2fe17441684a82cd00146f3bf_th.jpg",
                            @"737b4847gw1dweuioth1oj.jpg",
                            @"775418681601438faf357cee80ba9179_th.jpg",
                            @"77f9d6b5d96242d88f626dcc63f70ad5_th.jpg",
                            @"7c507eb4124b44c89192d2309b18f48b_th.jpg",
                            @"7cab4532cd574d6cbae17075e3fbcd73_th.jpg",
                            @"8913b33cbd414d4c9ab9b67f444c3f0b_th.jpg",
                            @"8f511855896f490ab5cdc5259f0a5d77_th.jpg",
                            @"90f26d07bdf94903ad1b173e8ffeaeae_th.jpg",
                            @"916fcd6bc9db4e3a82389134615e622a_th.jpg",
                            @"919516c9218c4bd9912190d7de809f14_th.jpg",
                            @"96c5e74cc69f4c1b801318a8fc46732d_th.jpg",
                            @"9794b457f0b8439b9e31afa94cdd1ea8_th.jpg",
                            @"98cb10fc018c452e8f5e405000eea4cc_th.jpg",
                            @"99e88f1d131b4293946dc536a39e74bb_th.jpg",
                            @"9a0114c1ed6f44bcbae52bd1cdac715c_th.jpg",
                            @"9b3081fed18045d3a7fe444d29161378_th.jpg",
                            @"9b3f3f86fc26494c9e89db5ba5563cb3.jpg",
                            @"9f042cad6e7440e5b35a36e259186c8c_th.jpg",
                            @"acec16810781467680056ac9b5de80f7_th.jpg",
                            @"af1d90a019ee4999b80f83e9eb5e4077_th.jpg",
                            @"b041018d731a469d8eceab6c86730519_th.jpg",
                        ];
    
    for(NSString *imageName in imageNames){
        item = [ItemModel new];
        item.imageName = imageName;
        [_dataArray addObject:item];
        
        NSArray *components = [imageName componentsSeparatedByString:@"."];
        [_photos addObject:[MWPhoto photoWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:components[0] ofType:components[1]]]]];
    }


}

#pragma mark - UICollectionView Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ItemCell *cell = (ItemCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"item"
                                                                               forIndexPath:indexPath];
    
    ItemModel *model = [self.dataArray objectAtIndex:indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:model.imageName];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:browser];
    [browser setCurrentPhotoIndex:indexPath.row];
    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ItemModel *model = [self.dataArray objectAtIndex:indexPath.row];
    if (!CGSizeEqualToSize(model.imageSize, CGSizeZero)) {
        return model.imageSize;
    }
    return CGSizeMake(150, 150);
}

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return self.photos.count;
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < self.photos.count) {
        return [self.photos objectAtIndex:index];
    }
    return nil;
}
@end
