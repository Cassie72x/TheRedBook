import router from '@ohos.router';

interface CommentItem {
  avatar: Resource;
  icon?: Resource;
  name: string;
  action: string;
  date: string;
  replyContent: string;
  originalContent: string;
  thumbnail: Resource;
}

@Entry
@Component
struct CommentAtPage {
  @State commentData: CommentItem[] = [
    {
      avatar: $r('app.media.comment_a'),
      icon: $r('app.media.comment_cat'),
      name: '',
      action: '回复了你的评论',
      date: '04-14',
      replyContent: '我看他家样片好像有',
      originalContent: '哇塞姐妹你长这张脸做什么妆造都好看...',
      thumbnail: $r('app.media.comment_note_a')
    },
    {
      avatar: $r('app.media.comment_b'),
      icon: $r('app.media.comment_cat'),
      name: '',
      action: '回复了你的评论',
      date: '04-13',
      replyContent: '我觉得还可以[图片]',
      originalContent: '做的风格怎么样姐妹🥰',
      thumbnail: $r('app.media.comment_note_a')
    },
    {
      avatar: $r('app.media.comment_c'),
      icon: $r('app.media.comment_lemon'),
      name: '.宝儿',
      action: '回复了你的评论',
      date: '04-13',
      replyContent: '一般 流水线妆容',
      originalContent: '做的风格怎么样姐妹',
      thumbnail: $r('app.media.comment_note_a')
    },
    {
      avatar: $r('app.media.comment_d'),
      name: 'Dseven',
      action: '回复了你的评论',
      date: '03-16',
      replyContent: '出',
      originalContent: '宝宝可以问问all吗',
      thumbnail: $r('app.media.comment_note_b')
    },
    {
      avatar: $r('app.media.comment_e'),
      name: '问一问',
      icon: $r('app.media.comment_ai'),
      action: '回复了你的评论',
      date: '03-13',
      replyContent: '',
      originalContent: '',
      thumbnail: $r('app.media.comment_note_a')
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

        Text('收到的评论和@')
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
        ForEach(this.commentData, (item: CommentItem, index: number) => {
          ListItem() {
            Column() {
              Row() {
                // 左侧头像
                Image(item.avatar)
                  .width(48)
                  .height(48)
                  .borderRadius(24)
                  .margin({ 
                    right: 12, 
                    top: item.name === '问一问' ? -50 : -100 
                  })

                // 中间内容
                Column() {
                  Row() {
                    if (item.name !== '') {
                      Text(item.name)
                        .fontSize(15)
                        .fontWeight(FontWeight.Medium)
                        .fontColor('#333')
                    }
                    if (item.icon) {
                      Image(item.icon)
                        .width(16)
                        .height(16)
                        .margin({ left: 4 })
                    }
                  }
                  .width('100%')
                  .alignItems(VerticalAlign.Center)

                  Row() {
                    Text(item.action)
                      .fontSize(13)
                      .fontColor('#999')

                    Text(item.date)
                      .fontSize(13)
                      .fontColor('#999')
                      .margin({ left: 4 })
                  }
                  .width('100%')
                  .margin({ top: 4, bottom: 8 })

                  // 回复内容
                  if (item.replyContent !== '') {
                    Text(item.replyContent)
                      .fontSize(14)
                      .fontColor('#333')
                      .width('100%')
                      .margin({ bottom: 8 })
                  }

                  // 原评论内容
                  if (item.originalContent !== '') {
                    Row() {
                      Text('▎')
                        .fontSize(12)
                        .fontColor('#E8E8E8')
                        .margin({ right: 4 })

                      Text(item.originalContent)
                        .fontSize(13)
                        .fontColor('#999')
                        .maxLines(1)
                        .textOverflow({ overflow: TextOverflow.Ellipsis })
                        .layoutWeight(1)
                    }
                    .width('100%')
                    .margin({ bottom: 12 })
                  }

                  // 底部按钮
                  Row({ space: 12 }) {
                    Row({ space: 4 }) {
                      Text('♡')
                        .fontSize(16)
                        .fontColor('#666')
                      Text('赞')
                        .fontSize(13)
                        .fontColor('#666')
                    }
                    .width(70)
                    .height(32)
                    .justifyContent(FlexAlign.Center)
                    .backgroundColor('#F5F5F5')
                    .borderRadius(16)

                    Row({ space: 4 }) {
                      Text('💬')
                        .fontSize(16)
                      Text('回复')
                        .fontSize(13)
                        .fontColor('#666')
                    }
                    .width(80)
                    .height(32)
                    .justifyContent(FlexAlign.Center)
                    .backgroundColor('#F5F5F5')
                    .borderRadius(16)
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
        }, (item: CommentItem, index: number) => item.name + item.date)
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
