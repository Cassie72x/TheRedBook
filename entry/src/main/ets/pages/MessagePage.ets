import router from '@ohos.router';

interface MessageItem {
  avatar: Resource;
  name: string;
  nameIcon?: Resource;
  content: string;
  time: string;
}

interface QuickActionItem {
  icon: Resource;
  label: string;
  bgColor: string;
}

@Entry
@Component
struct MessagePage {
  @State bottomNavIndex: number = 3;
  @State isShowPublishSheet: boolean = false;

  @State quickActions: QuickActionItem[] = [
    { icon: $r('app.media.MessagePage_sign_a'), label: '赞和收藏', bgColor: '#FFE5E5' },
    { icon: $r('app.media.MessagePage_sign_b'), label: '新增关注', bgColor: '#E5F0FF' },
    { icon: $r('app.media.MessagePage_sign_c'), label: '评论和@', bgColor: '#E5FFF0' }
  ];

  @State messages: MessageItem[] = [
    {
      avatar: $r('app.media.MessagePage_a'),
      name: '活动消息',
      content: '你路过的每一座山，都值得被记住',
      time: '星期五'
    },
    {
      avatar: $r('app.media.MessagePage_b'),
      name: 'kpop同款蹲蹲',
      content: '"我想睡觉"加入了群聊',
      time: '星期五'
    },
    {
      avatar: $r('app.media.MessagePage_c'),
      name: '饺子大王',
      nameIcon: $r('app.media.MessagePage_sign'),
      content: '不客气呀',
      time: '04-08'
    },
    {
      avatar: $r('app.media.MessagePage_d'),
      name: '想个新名字中',
      content: '字款的话是单人的 全员100包非偏 银色长条...',
      time: '03-16'
    },
    {
      avatar: $r('app.media.MessagePage_e'),
      name: '我要早点睡觉',
      content: '[表情]',
      time: '03-10'
    },
    {
      avatar: $r('app.media.MessagePage_f'),
      name: '系统消息',
      content: '查收你的佳洁士新锁白惊喜盒子',
      time: '01-21'
    },
    {
      avatar: $r('app.media.MessagePage_g'),
      name: '@kiki',
      content: '[表情]',
      time: '2025-12-23'
    },
    {
      avatar: $r('app.media.MessagePage_h'),
      name: 'Dreamshop 深圳Kpop文创店',
      content: '[卡片]',
      time: '2025-12-21'
    }
  ];

  build() {
    Stack() {
      Column() {
      // 顶部导航栏
      Row() {
        Text('')
          .width(24)
          .height(24)
          .margin({ left: 12 })

        Text('消息')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333')
          .layoutWeight(1)
          .textAlign(TextAlign.Center)

        Row({ space: 12 }) {
          Image($r('app.media.search'))
            .width(24)
            .height(24)

          Text('+')
            .fontSize(24)
            .fontColor('#333')
            .margin({ right: 12 })
        }
      }
      .height(44)
      .alignItems(VerticalAlign.Center)
      .width('100%')
      .backgroundColor('#FFF')

      // 快捷功能区
      Row({ space: 30 }) {
        ForEach(this.quickActions, (action: QuickActionItem, index: number) => {
          Column() {
            Row() {
              Image(action.icon)
                .width(40)
                .height(40)
                .borderRadius(20)
            }
            .width(70)
            .height(70)
            .backgroundColor(action.bgColor)
            .borderRadius(16)
            .justifyContent(FlexAlign.Center)
            .margin({ bottom: 8 })

            Text(action.label)
              .fontSize(13)
              .fontColor('#333')
          }
          .layoutWeight(1)
          .onClick(() => {
            if (index === 0) {
              router.pushUrl({ url: 'pages/LikeCollectPage' });
            } else if (index === 1) {
              router.pushUrl({ url: 'pages/NewFollowPage' });
            } else if (index === 2) {
              router.pushUrl({ url: 'pages/CommentAtPage' });
            }
          })
        }, (action: QuickActionItem, index: number) => action.label)
      }
      .width('100%')
      .padding({ top: 20, bottom: 20 })
      .backgroundColor('#FFF')

      // 消息列表
      List({ space: 0 }) {
        ForEach(this.messages, (item: MessageItem, index: number) => {
          ListItem() {
            Row() {
              Image(item.avatar)
                .width(50)
                .height(50)
                .borderRadius(25)
                .margin({ right: 12 })

              Column() {
                Row() {
                  Row() {
                    Text(item.name)
                      .fontSize(15)
                      .fontWeight(FontWeight.Medium)
                      .fontColor('#333')
                      .maxLines(1)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })

                    if (item.nameIcon) {
                      Image(item.nameIcon)
                        .width(20)
                        .height(20)
                        .margin({ left: 4 })
                    }
                  }
                  .layoutWeight(1)

                  Text(item.time)
                    .fontSize(12)
                    .fontColor('#999')
                }
                .width('100%')
                .margin({ bottom: 4 })

                Text(item.content)
                  .fontSize(14)
                  .fontColor('#666')
                  .maxLines(1)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .width('100%')
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)
            }
            .width('100%')
            .padding({ left: 16, right: 16, top: 12, bottom: 12 })
            .backgroundColor('#FFF')
            .onClick(() => {
              // 传递用户信息到聊天页面
              router.pushUrl({ 
                url: 'pages/ChatPage', 
                params: { 
                  userName: item.name,
                  avatar: item.avatar
                } 
              });
            })
          }
        }, (item: MessageItem) => item.name + item.time)
      }
      .layoutWeight(1)
      .width('100%')
      .backgroundColor('#F5F5F5')
      .scrollBar(BarState.Off)

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
      } else if (index === 1) {
        router.replaceUrl({ url: 'pages/MarketPage' });
      } else if (index === 4) {
        router.replaceUrl({ url: 'pages/ProfilePage' });
      } else if (index !== 3) {
        this.bottomNavIndex = index;
      }
    })
  }
}
