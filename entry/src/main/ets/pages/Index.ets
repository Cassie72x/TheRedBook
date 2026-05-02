import router from '@ohos.router';
import { NoteItem, noteData } from '../model/NoteData';
import { NoteCard } from '../components/NoteCard';

@Entry
@Component
struct Index {
  // 定义两个独立的状态变量，互不干扰
  @State bottomNavIndex: number = 0; // 控制底部导航栏
  @State tabSelectedIndex: number = 0; // 控制分类标签栏
  @State isShowPublishSheet: boolean = false; // 控制发布弹窗显示
  private tabs: string[] = ['推荐', '视频', '直播', '短剧', '穿搭', '美食', '美妆'];
  @State topTabIndex: number = 1;
  private topTabs: string[] = ['关注', '发现', '广州'];

  build() {
    Stack() {
      Column() {
      // 1. 顶部导航栏
      Row() {
        Image($r('app.media.ask_ai'))
          .width(24)
          .height(24)
          .margin({ left: 12 })
          .onClick(() => {
          })

        Row({ space: 28 }) {
          ForEach(this.topTabs, (item: string, index: number) => {
            Column() {
              Text(item)
                .fontSize(index === this.topTabIndex ? 16 : 15)
                .fontWeight(index === this.topTabIndex ? FontWeight.Bold : FontWeight.Normal)
                .fontColor(index === this.topTabIndex ? '#333' : '#999')

              if (index === this.topTabIndex) {
                Text("")
                  .width(20)
                  .height(3)
                  .backgroundColor('#FF2442')
                  .borderRadius(1.5)
                  .margin({ top: 2 })
              }
            }
            .onClick(() => {
              this.topTabIndex = index;
            })
          })
        }
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)

        Image($r('app.media.search'))
          .width(26)
          .height(26)
          .margin({ right: 12 })
          .onClick(() => {
            router.pushUrl({ url: 'pages/SearchPage' });
          })
      }
      .height(44)
      .alignItems(VerticalAlign.Center)
      .width('100%')
      .backgroundColor('#FFF')

      // 2. 分类标签栏
      Scroll() {
        Row({ space: 24 }) {
          ForEach(this.tabs, (item: string, index: number) => {
            Column() {
              Text(item)
                .fontSize(this.tabSelectedIndex === index ? 16 : 15)
                .fontWeight(this.tabSelectedIndex === index ? FontWeight.Bold : FontWeight.Normal)
                .fontColor(this.tabSelectedIndex === index ? '#333' : '#666')

              if (this.tabSelectedIndex === index) {
                Text("")
                  .width(18)
                  .height(3)
                  .backgroundColor('#FF2442')
                  .borderRadius(1.5)
                  .margin({ top: 2 })
              }
            }
            .onClick(() => {
              this.tabSelectedIndex = index;
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

      // 3. 瀑布流区域
      Scroll() {
        Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Start }) {
          Column() {
            ForEach(noteData, (item: NoteItem, index: number) => {
              if (index % 2 === 0) {
                NoteCard({ item: item, noteIndex: index })
              }
            }, (item: NoteItem) => item.id.toString())
          }
          .width('50%')
          .layoutWeight(1)

          Column() {
            ForEach(noteData, (item: NoteItem, index: number) => {
              if (index % 2 === 1) {
                NoteCard({ item: item, noteIndex: index })
              }
            }, (item: NoteItem) => item.id.toString())
          }
          .width('50%')
          .layoutWeight(1)
        }
        .width('100%')
        .padding(2)
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .backgroundColor('#F5F5F5')

      // 4. 底部导航栏
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
        .alignItems(HorizontalAlign.Center)
        .margin({ left: 5, right: 5 ,bottom:0})
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
      if (index === 1) {
        router.replaceUrl({ url: 'pages/MarketPage' });
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
