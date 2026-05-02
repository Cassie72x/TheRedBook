import router from '@ohos.router';

interface LikeCollectItem {
  avatar: Resource;
  name: string;
  action: string;
  date: string;
  comment: string;
  thumbnail: Resource;
}

@Entry
@Component
struct LikeCollectPage {
  @State likeCollectData: LikeCollectItem[] = [
    {
      avatar: $r('app.media.LikeCollectPage_a'),
      name: 'mimum (是代肝!)',
      action: '赞了你的评论',
      date: '03-14',
      comment: '怎么那么好笑哈哈哈哈哈',
      thumbnail: $r('app.media.LikeCollectPage_note_a')
    },
    {
      avatar: $r('app.media.LikeCollectPage_b'),
      name: '好运100%',
      action: '赞了你的评论',
      date: '03-04',
      comment: '怎么那么好笑哈哈哈哈哈',
      thumbnail: $r('app.media.LikeCollectPage_note_a')
    },
    {
      avatar: $r('app.media.LikeCollectPage_c'),
      name: '吃口三文鱼寿司',
      action: '赞了你的评论',
      date: '02-28',
      comment: '怎么那么好笑哈哈哈哈哈',
      thumbnail: $r('app.media.LikeCollectPage_note_a')
    },
    {
      avatar: $r('app.media.LikeCollectPage_d'),
      name: '阿白',
      action: '赞了你的评论',
      date: '02-27',
      comment: '怎么那么好笑哈哈哈哈哈',
      thumbnail: $r('app.media.LikeCollectPage_note_a')
    },
    {
      avatar: $r('app.media.LikeCollectPage_e'),
      name: '披着人皮的鱼',
      action: '赞了你的评论',
      date: '02-25',
      comment: '对啊这孩子不是还模仿了一下样子吗哈...',
      thumbnail: $r('app.media.LikeCollectPage_note_b')
    },
    {
      avatar: $r('app.media.LikeCollectPage_f'),
      name: 'momo',
      action: '赞了你的评论',
      date: '02-24',
      comment: '怎么那么好笑哈哈哈哈哈',
      thumbnail: $r('app.media.LikeCollectPage_note_a')
    },
    {
      avatar: $r('app.media.LikeCollectPage_g'),
      name: '7彩云',
      action: '赞了你的评论',
      date: '02-22',
      comment: '啊宝宝你可以原价买到的呀，有些店铺...',
      thumbnail: $r('app.media.LikeCollectPage_note_c')
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

        Text('收到的赞和收藏')
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
        ForEach(this.likeCollectData, (item: LikeCollectItem, index: number) => {
          ListItem() {
            Column() {
              Row() {
                // 左侧头像
                Image(item.avatar)
                  .width(48)
                  .height(48)
                  .borderRadius(24)
                  .margin({ right: 12, top: -20 })

                // 中间内容
                Column() {
                  Row() {
                    Text(item.name)
                      .fontSize(15)
                      .fontWeight(FontWeight.Medium)
                      .fontColor('#333')
                      .layoutWeight(1)
                  }
                  .width('100%')
                  .margin({ bottom: 6 })

                  Row() {
                    Text(item.action)
                      .fontSize(13)
                      .fontColor('#999')

                    Text(item.date)
                      .fontSize(13)
                      .fontColor('#999')
                      .margin({ left: 12 })
                  }
                  .width('100%')
                  .margin({ bottom: 8 })

                  // 评论内容
                  Row() {
                    Text('▎')
                      .fontSize(12)
                      .fontColor('#E8E8E8')
                      .margin({ right: 4 })

                    Text(item.comment)
                      .fontSize(13)
                      .fontColor('#999')
                      .maxLines(1)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                      .layoutWeight(1)
                  }
                  .width('100%')
                }
                .layoutWeight(1)
                .alignItems(HorizontalAlign.Start)

                // 右侧缩略图
                Image(item.thumbnail)
                  .width(56)
                  .height(56)
                  .borderRadius(4)
                  .margin({ left: 12 })
              }
              .width('100%')
              .padding({ left: 16, right: 16, top: 16, bottom: 16 })
            }
            .width('100%')
            .backgroundColor('#FFF')
          }
        }, (item: LikeCollectItem, index: number) => item.name + item.date)
      }
      .layoutWeight(1)
      .width('100%')
      .backgroundColor('#F5F5F5')
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
