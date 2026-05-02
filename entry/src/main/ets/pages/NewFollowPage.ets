
 import router from '@ohos.router';

interface FollowItem {
  avatar: Resource;
  name: string;
  date: string;
  buttonType: string; // 'follow' | 'message' | 'followback'
}

@Entry
@Component
struct NewFollowPage {
  @State followData: FollowItem[] = [
    {
      avatar: $r('app.media.NewFollowPage_a'),
      name: '旼天见^',
      date: '2025-07-06',
      buttonType: 'follow'
    },
    {
      avatar: $r('app.media.NewFollowPage_b'),
      name: 'wu_xo',
      date: '2025-07-06',
      buttonType: 'follow'
    },
    {
      avatar: $r('app.media.NewFollowPage_c'),
      name: 'Alonemr',
      date: '2025-07-06',
      buttonType: 'follow'
    },
    {
      avatar: $r('app.media.NewFollowPage_d'),
      name: '요시',
      date: '2025-06-28',
      buttonType: 'follow'
    },
    {
      avatar: $r('app.media.NewFollowPage_e'),
      name: '2owon',
      date: '2025-06-28',
      buttonType: 'follow'
    },
    {
      avatar: $r('app.media.NewFollowPage_f'),
      name: '抹茶蛋挞加土豆泥拌饭',
      date: '2025-05-31',
      buttonType: 'message'
    },
    {
      avatar: $r('app.media.NewFollowPage_g'),
      name: '南鸢',
      date: '2025-05-31',
      buttonType: 'followback'
    },
    {
      avatar: $r('app.media.NewFollowPage_h'),
      name: '0.07',
      date: '2025-05-31',
      buttonType: 'followback'
    },
    {
      avatar: $r('app.media.NewFollowPage_i'),
      name: 'H',
      date: '2025-05-30',
      buttonType: 'followback'
    },
    {
      avatar: $r('app.media.NewFollowPage_j'),
      name: '77',
      date: '2025-05-30',
      buttonType: 'message'
    }
  ];

  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Text("←")
          .fontSize(24)
          .fontColor('#333')
          .margin({ left: 12 })
          .onClick(() => {
            router.back();
          })

        Text('新增关注')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333')
          .layoutWeight(1)
          .textAlign(TextAlign.Center)

        Text('')
          .width(24)
          .height(24)
          .margin({ right: 12 })
      }
      .height(44)
      .alignItems(VerticalAlign.Center)
      .width('100%')
      .backgroundColor('#FFF')

      // 列表内容
      List({ space: 0 }) {
        ForEach(this.followData, (item: FollowItem, index: number) => {
          ListItem() {
            Row() {
              // 左侧头像
              Image(item.avatar)
                .width(48)
                .height(48)
                .borderRadius(24)
                .margin({ right: 12 })

              // 中间内容
              Column() {
                Text(item.name)
                  .fontSize(15)
                  .fontWeight(FontWeight.Medium)
                  .fontColor('#333')
                  .width('100%')
                  .margin({ bottom: 6 })

                Text('开始关注你了 ' + item.date)
                  .fontSize(13)
                  .fontColor('#999')
                  .maxLines(1)
                  .width('100%')
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)

              // 右侧按钮
              if (item.buttonType === 'follow') {
                Text('关注')
                  .fontSize(14)
                  .fontColor('#FF2442')
                  .width(80)
                  .height(32)
                  .textAlign(TextAlign.Center)
                  .border({
                    width: 1,
                    color: '#FF2442',
                    radius: 16
                  })
                  .onClick(() => {
                    // 切换为回关状态
                    this.followData[index].buttonType = 'followback';
                  })
              } else if (item.buttonType === 'followback') {
                Text('回关')
                  .fontSize(14)
                  .fontColor('#FF2442')
                  .width(80)
                  .height(32)
                  .textAlign(TextAlign.Center)
                  .border({
                    width: 1,
                    color: '#FF2442',
                    radius: 16
                  })
              } else {
                Text('发私信')
                  .fontSize(14)
                  .fontColor('#666')
                  .width(80)
                  .height(32)
                  .textAlign(TextAlign.Center)
                  .border({
                    width: 1,
                    color: '#E8E8E8',
                    radius: 16
                  })
              }
            }
            .width('100%')
            .padding({ left: 16, right: 16, top: 16, bottom: 16 })
            .backgroundColor('#FFF')
          }
        }, (item: FollowItem, index: number) => item.name + item.date)
      }
      .layoutWeight(1)
      .width('100%')
      .backgroundColor('#FFF')
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFF')
  }
}
