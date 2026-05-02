import router from '@ohos.router';

interface MarketCategory {
  icon: Resource;
  label: string;
}

interface MarketProduct {
  imageUrl: Resource;
  title: string;
  price: string;
  soldCount: string;
  tag?: string;
  isLive?: boolean;
}

@Entry
@Component
struct MarketPage {
  @State bottomNavIndex: number = 1;
  @State marketTabIndex: number = 0;
  @State isShowPublishSheet: boolean = false;
  private marketTabs: string[] = ['推荐', '穿搭', '家居', '美护', '运动', '潮玩', '食饮'];

  @State categories: MarketCategory[] = [
    { icon: $r('app.media.MarketPage_sign_a'), label: '直播广场' },
    { icon: $r('app.media.MarketPage_sign_b'), label: '星光夜市' },
    { icon: $r('app.media.MarketPage_sign_c'), label: '美妙商店' },
    { icon: $r('app.media.MarketPage_sign_d'), label: '好货市场' },
    { icon: $r('app.media.MarketPage_sign_e'), label: '宠粉清单' },
    { icon: $r('app.media.MarketPage_sign_f'), label: '我的订单' },
    { icon: $r('app.media.MarketPage_sign_g'), label: '购物车' },
    { icon: $r('app.media.MarketPage_sign_h'), label: '优惠券' },
    { icon: $r('app.media.MarketPage_sign_i'), label: '客服消息' },
    { icon: $r('app.media.MarketPage_sign_j'), label: '商品足迹' }
  ];

  @State products: MarketProduct[] = [
    {
      imageUrl: $r('app.media.MarketPage_a'),
      title: '法文字母玻璃杯',
      price: '8.99',
      soldCount: '已售4243',
      tag: '2件9折 7000+人加购'
    },
    {
      imageUrl: $r('app.media.MarketPage_b'),
      title: '四叶草调节戒指',
      price: '15.8',
      soldCount: '全店已售9406',
      tag: '跨店每200减30'
    },
    {
      imageUrl: $r('app.media.MarketPage_c'),
      title: '2位数的日抛是真的要疯…',
      price: '29',
      soldCount: '7',
      tag: '主播发券中',
      isLive: true
    },
    {
      imageUrl: $r('app.media.MarketPage_d'),
      title: '【双生默契】小猫情侣手链',
      price: '6',
      soldCount: '已售767',
      tag: '限时立减2.8元 退货包运费'
    },
    {
      imageUrl: $r('app.media.MarketPage_e'),
      title: '蓝山梦海戒指',
      price: '23.75',
      soldCount: '已售70',
      tag: '满30减12 90天最低价'
    },
    {
      imageUrl: $r('app.media.MarketPage_f'),
      title: '42.195km · 富士相机胶片',
      price: '68',
      soldCount: '已售9794',
      tag: '跨店每200减30'
    },
    {
      imageUrl: $r('app.media.MarketPage_g'),
      title: '斯莱特林欲望之戒',
      price: '18.8',
      soldCount: '已售1114',
      tag: '跨店每200减30 退货包运费 180天最低价'
    },
    {
      imageUrl: $r('app.media.MarketPage_h'),
      title: '金鱼星星印花连衣裙',
      price: '99',
      soldCount: '已售584',
      tag: '4000+人加购'
    }
  ];

  build() {
    Stack() {
      Column() {
      // 顶部搜索栏（固定）
      Row() {
        Row({ space: 8 }) {
          Text('闺蜜礼物')
            .fontSize(14)
            .fontColor('#999')
            .layoutWeight(1)

          Image($r('app.media.search_camera'))
            .width(18)
            .height(18)
            .fillColor('#999')

          Text('搜索')
            .fontSize(14)
            .fontColor('#999')
        }
        .layoutWeight(1)
        .height(36)
        .padding({ left: 12, right: 12 })
        .backgroundColor('#F5F5F5')
        .borderRadius(18)
        .onClick(() => {
        })
      }
      .width('100%')
      .height(50)
      .padding({ left: 12, right: 12 })
      .alignItems(VerticalAlign.Center)
      .backgroundColor('#FFF')

      // 分类标签栏（固定）
      Scroll() {
        Row({ space: 24 }) {
          ForEach(this.marketTabs, (item: string, index: number) => {
            Column() {
              Text(item)
                .fontSize(this.marketTabIndex === index ? 16 : 15)
                .fontWeight(this.marketTabIndex === index ? FontWeight.Bold : FontWeight.Normal)
                .fontColor(this.marketTabIndex === index ? '#333' : '#666')

              if (this.marketTabIndex === index) {
                Text("")
                  .width(18)
                  .height(3)
                  .backgroundColor('#FF2442')
                  .borderRadius(1.5)
                  .margin({ top: 2 })
              }
            }
            .onClick(() => {
              this.marketTabIndex = index;
            })
          })
        }
        .padding({ left: 12, right: 12 })
      }
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)
      .height(36)
      .width('100%')
      .backgroundColor('#FFF')

      // 可滚动内容区域
      Scroll() {
        Column() {
          // 功能图标区域
          Grid() {
            ForEach(this.categories, (item: MarketCategory, index: number) => {
              GridItem() {
                Column() {
                  Image(item.icon)
                    .width(40)
                    .height(40)
                    .margin({ bottom: 4 })
                  Text(item.label)
                    .fontSize(12)
                    .fontColor('#333')
                }
                .width('100%')
                .height(60)
                .justifyContent(FlexAlign.Center)
              }
            }, (item: MarketCategory) => item.label)
          }
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
          .rowsTemplate('1fr 1fr')
          .columnsGap(4)
          .rowsGap(4)
          .height(130)
          .padding({ top: 8, bottom: 8, left: 8, right: 8 })
          .backgroundColor('#FFF')

          // 瀑布流商品列表
          Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Start }) {
            Column() {
              ForEach(this.products, (item: MarketProduct, index: number) => {
                if (index % 2 === 0) {
                  this.buildProductCard(item)
                }
              }, (item: MarketProduct, index: number) => index.toString())
            }
            .width('50%')
            .layoutWeight(1)

            Column() {
              ForEach(this.products, (item: MarketProduct, index: number) => {
                if (index % 2 === 1) {
                  this.buildProductCard(item)
                }
              }, (item: MarketProduct, index: number) => index.toString())
            }
            .width('50%')
            .layoutWeight(1)
          }
          .width('100%')
          .padding(4)
        }
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .backgroundColor('#F5F5F5')

      // 底部导航栏
      Row() {
        this.NavItem('', '首页', 0)
        this.NavItem('', '市集', 1)

        Column() {
          Text("+")
            .fontSize(32)
            .fontColor('#FFF')
            .fontWeight(FontWeight.Bold)
            .lineHeight(35)
        }
        .width(45)
        .height(30)
        .backgroundColor('#FF2442')
        .borderRadius(8)
        .justifyContent(FlexAlign.Center)
        .margin({ left: 5, right: 5, bottom: 0 })
        .onClick(() => {
          this.isShowPublishSheet = true;
        })

        this.NavItem('', '消息', 3)
        this.NavItem('', '我的', 4)
      }
      .width('100%')
      .height(60)
      .backgroundColor('#FFF')
      .justifyContent(FlexAlign.SpaceAround)
      .alignItems(VerticalAlign.Center)
      .border({ width: { top: 0.5 }, color: '#E8E8E8' })
      }
      .width('100%')
      .height('100%')

      if (this.isShowPublishSheet) {
        this.buildPublishSheet()
      }
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  buildProductCard(item: MarketProduct) {
    Column() {
      Stack() {
        Image(item.imageUrl)
          .width('100%')
          .height(180)
          .objectFit(ImageFit.Cover)

        if (item.isLive) {
          Row({ space: 4 }) {
            Text('📹')
              .fontSize(12)
            Text('直播中')
              .fontSize(12)
              .fontColor('#FFF')
          }
          .width(60)
          .height(22)
          .backgroundColor('rgba(0, 0, 0, 0.5)')
          .borderRadius(11)
          .position({ x: 8, y: 8 })
          .justifyContent(FlexAlign.Center)
        }
      }
      .width('100%')

      Column() {
        Text(item.title)
          .fontSize(14)
          .fontColor('#333')
          .fontWeight(FontWeight.Medium)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .width('100%')
          .margin({ top: 8, bottom: 6 })

        if (item.tag) {
          Text(item.tag)
            .fontSize(11)
            .fontColor('#FF2442')
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .width('100%')
            .margin({ bottom: 6 })
        }

        Row({ space: 4 }) {
          Text('¥')
            .fontSize(13)
            .fontColor('#ff0e0d0d')
            .fontWeight(FontWeight.Bold)
          Text(item.price)
            .fontSize(18)
            .fontColor('#ff111111')
            .fontWeight(FontWeight.Normal)
          Text(item.soldCount)
            .fontSize(11)
            .fontColor('#999')
            .layoutWeight(1)
        }
        .width('100%')
      }
      .padding({ left: 8, right: 8, bottom: 8 })
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .backgroundColor('#FFF')
    .borderRadius(8)
    .margin({ bottom: 8 })
  }

  @Builder
  NavItem(icon: string, text: string, index: number) {
    Column() {
      Text(icon)
        .fontSize(20)
        .fontColor(index === this.bottomNavIndex ? '#333' : '#999')
        .margin({ bottom: 4 })

      Text(text)
        .fontSize(18)
        .fontColor(index === this.bottomNavIndex ? '#333' : '#999')
        .fontWeight(index === this.bottomNavIndex ? FontWeight.Medium : FontWeight.Normal)
    }
    .width(60)
    .margin({ top: 2 })
    .onClick(() => {
      if (index === 0) {
        router.replaceUrl({ url: 'pages/Index' });
      } else if (index === 3) {
        router.replaceUrl({ url: 'pages/MessagePage' });
      } else if (index === 4) {
        router.replaceUrl({ url: 'pages/ProfilePage' });
      } else {
        this.bottomNavIndex = index;
      }
    })
  }

  @Builder
  buildPublishSheet() {
    Stack() {
      // 半透明背景遮罩
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor('#80000000')
        .onClick(() => {
          this.isShowPublishSheet = false;
        })

      // 底部弹窗内容
      Column() {
        // 从相册选择
        Column() {
          Text("从相册选择")
            .fontSize(18)
            .fontColor('#333')
            .fontWeight(FontWeight.Medium)
        }
        .width('100%')
        .height(56)
        .justifyContent(FlexAlign.Center)
        .onClick(() => {
          this.isShowPublishSheet = false;
          // TODO: 实现从相册选择功能
        })

        Divider().color('#E8E8E8').strokeWidth(0.5)

        // 相机
        Column() {
          Text("相机")
            .fontSize(18)
            .fontColor('#333')
            .fontWeight(FontWeight.Medium)
          Text("拍摄与直播")
            .fontSize(13)
            .fontColor('#999')
            .margin({ top: 4 })
        }
        .width('100%')
        .height(70)
        .justifyContent(FlexAlign.Center)
        .onClick(() => {
          this.isShowPublishSheet = false;
          // TODO: 实现相机功能
        })

        Divider().color('#E8E8E8').strokeWidth(0.5)

        // 写文字
        Column() {
          Text("写文字")
            .fontSize(18)
            .fontColor('#333')
            .fontWeight(FontWeight.Medium)
        }
        .width('100%')
        .height(56)
        .justifyContent(FlexAlign.Center)
        .onClick(() => {
          this.isShowPublishSheet = false;
          // TODO: 实现写文字功能
        })

        // 灰色间隙
        Column()
          .width('100%')
          .height(8)
          .backgroundColor('#F5F5F5')

        Column() {
          Text("取消")
            .fontSize(18)
            .fontColor('#666')
        }
        .width('100%')
        .height(50)
        .justifyContent(FlexAlign.Center)
        .onClick(() => {
          this.isShowPublishSheet = false;
        })
      }
      .width('100%')
      .backgroundColor('#FFF')
      .borderRadius({ topLeft: 16, topRight: 16 })
      .position({ x: 0, y: '100%' })
      .translate({ y: '-100%' })
    }
    .width('100%')
    .height('100%')
  }
}
