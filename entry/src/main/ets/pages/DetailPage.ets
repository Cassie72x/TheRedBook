import router from '@ohos.router';
import { NoteItem, noteData } from '../model/NoteData';

interface CommentItem {
  avatar: Resource;
  userName: string;
  content: string;
  date: string;
  location: string;
  likeCount: number;
  isLiked: boolean;       // 是否已点赞
  isDisliked: boolean;    // 是否已点踩
  isAuthor: boolean;
  isLikedByAuthor: boolean;
  replies?: CommentItem[];
}

@Entry
@Component
struct DetailPage {
  @State note: NoteItem = router.getParams() as NoteItem;
  @State noteIndex: number = (router.getParams() as NoteItem).id - 1;
  @State currentImageIndex: number = 0;
  @State isLiked: boolean = this.note.isLiked;
  @State isCollected: boolean = this.note.isCollected;
  
  @State comments: CommentItem[] = this.note.id === 1 ? [
    {
      avatar: $r('app.media.avatar_brave'),
      userName: "大馄饨想飞起来",
      content: "这组色彩很高级",
      date: "04-04",
      location: "广东",
      likeCount: 1,
      isLiked: false,
      isDisliked: false,
      isAuthor: false,
      isLikedByAuthor: false,
      replies: [
        {
          avatar: $r('app.media.avatar_Colorwalk'),
          userName: "灏_",
          content: "同色系配色显高级",
          date: "04-04",
          location: "江苏",
          likeCount: 1,
          isLiked: false,
          isDisliked: false,
          isAuthor: true,
          isLikedByAuthor: false
        }
      ]
    },
    {
      avatar: $r('app.media.avatar_Spring'),
      userName: "韦菲林📷",
      content: "春天就要看一些像黄色一样明媚的东西",
      date: "04-04",
      location: "广西",
      likeCount: 1,
      isLiked: false,
      isDisliked: false,
      isAuthor: false,
      isLikedByAuthor: false,
      replies: [
        {
          avatar: $r('app.media.avatar_Colorwalk'),
          userName: "灏_",
          content: "黄色充满活力",
          date: "04-04",
          location: "江苏",
          likeCount: 0,
          isLiked: false,
          isDisliked: false,
          isAuthor: true,
          isLikedByAuthor: false
        }
      ]
    },
    {
      avatar: $r('app.media.avatar_wind'),
      userName: "lulu 的日常记录",
      content: "突然想到了还有小黄车",
      date: "04-04",
      location: "江苏",
      likeCount: 1,
      isLiked: false,
      isDisliked: false,
      isAuthor: false,
      isLikedByAuthor: false,
      replies: [
        {
          avatar: $r('app.media.avatar_Colorwalk'),
          userName: "灏_",
          content: "对的 是有这么一张 哈哈哈哈哈",
          date: "04-04",
          location: "江苏",
          likeCount: 0,
          isLiked: false,
          isDisliked: false,
          isAuthor: true,
          isLikedByAuthor: false
        }
      ]
    },
    {
      avatar: $r('app.media.avatar_water'),
      userName: "小红薯64AC2CDE",
      content: "希望再看到你的其他 色彩系列",
      date: "04-04",
      location: "上海",
      likeCount: 0,
      isLiked: false,
      isDisliked: false,
      isAuthor: false,
      isLikedByAuthor: false
    }
  ] : this.note.id === 2 ? [
    {
      avatar: $r('app.media.avatar_water'),
      userName: "某用户",
      content: "评论内容",
      date: "04-15",
      location: "云南",
      likeCount: 0,
      isLiked: false,
      isDisliked: false,
      isAuthor: false,
      isLikedByAuthor: false,
      replies: [
        {
          avatar: $r('app.media.avatar_Autumn'),
          userName: "伊森",
          content: "回复",
          date: "04-15",
          location: "山东",
          likeCount: 0,
          isLiked: false,
          isDisliked: false,
          isAuthor: true,
          isLikedByAuthor: false
        }
      ]
    },
    {
      avatar: $r('app.media.avatar_mr_chu'),
      userName: "Jackie-5329",
      content: "这个季节是大概几月几号啊？求问！",
      date: "04-04",
      location: "重庆",
      likeCount: 0,
      isLiked: false,
      isDisliked: false,
      isAuthor: false,
      isLikedByAuthor: false,
      replies: [
        {
          avatar: $r('app.media.avatar_Autumn'),
          userName: "伊森",
          content: "九月中旬哦",
          date: "04-05",
          location: "山东",
          likeCount: 0,
          isLiked: false,
          isDisliked: false,
          isAuthor: true,
          isLikedByAuthor: false
        }
      ]
    },
    {
      avatar: $r('app.media.avatar_alive'),
      userName: "麦麦的经纪人",
      content: "问下十一去是这样的吗？",
      date: "04-04",
      location: "上海",
      likeCount: 0,
      isLiked: false,
      isDisliked: false,
      isAuthor: false,
      isLikedByAuthor: false,
      replies: [
        {
          avatar: $r('app.media.avatar_Autumn'),
          userName: "吃饱再卷",
          content: "同问",
          date: "04-04",
          location: "广东",
          likeCount: 0,
          isLiked: false,
          isDisliked: false,
          isAuthor: false,
          isLikedByAuthor: false
        }
      ]
    },
    {
      avatar: $r('app.media.avatar_sleep'),
      userName: "momo",
      content: "图1/4/5具体位置都是哪呀",
      date: "04-02",
      location: "广东",
      likeCount: 0,
      isLiked: false,
      isDisliked: false,
      isAuthor: false,
      isLikedByAuthor: false,
      replies: [
        {
          avatar: $r('app.media.avatar_Autumn'),
          userName: "伊森",
          content: "1、5是呼伦湖，4是黑山头",
          date: "04-02",
          location: "山东",
          likeCount: 2,
          isLiked: false,
          isDisliked: false,
          isAuthor: true,
          isLikedByAuthor: false
        }
      ]
    }
  ] : this.note.id === 3 ? [
    {
      avatar: $r('app.media.avatar_March'),
      userName: "-南墙",
      content: "为什么我的 live成像曝光好烂啊",
      date: "04-13",
      location: "上海",
      likeCount: 0,
      isLiked: false,
      isDisliked: false,
      isAuthor: false,
      isLikedByAuthor: false
    },
    {
      avatar: $r('app.media.star_sheep'),
      userName: "三水",
      content: "这个滤镜也太好看了吧！",
      date: "03-31",
      location: "北京",
      likeCount: 0,
      isLiked: false,
      isDisliked: false,
      isAuthor: false,
      isLikedByAuthor: false
    },
    {
      avatar: $r('app.media.avatar_film'),
      userName: "- Serendipity✨",
      content: "最近很爱这种色调",
      date: "04-10",
      location: "福建",
      likeCount: 0,
      isLiked: false,
      isDisliked: false,
      isAuthor: false,
      isLikedByAuthor: false
    },
    {
      avatar: $r('app.media.avatar_sleep'),
      userName: "我倒要看看",
      content: "戒指也是樱花的形状嘞。",
      date: "03-31",
      location: "北京",
      likeCount: 0,
      isLiked: false,
      isDisliked: false,
      isAuthor: false,
      isLikedByAuthor: false
    },
    {
      avatar: $r('app.media.avatar_water'),
      userName: "爱攒钱的吾玖玖",
      content: "好喜欢的色调",
      date: "04-02",
      location: "福建",
      likeCount: 0,
      isLiked: false,
      isDisliked: false,
      isAuthor: false,
      isLikedByAuthor: false
    },
    {
      avatar: $r('app.media.avatar_wechat_avatar'),
      userName: "鹿鹿要暴富",
      content: "图二是在日本吗",
      date: "04-02",
      location: "四川",
      likeCount: 0,
      isLiked: false,
      isDisliked: false,
      isAuthor: false,
      isLikedByAuthor: false
    },
    {
      avatar: $r('app.media.avatar_Autumn'),
      userName: "甜什么恬",
      content: "好会拍",
      date: "04-02",
      location: "浙江",
      likeCount: 0,
      isLiked: false,
      isDisliked: false,
      isAuthor: false,
      isLikedByAuthor: false
    },
    {
      avatar: $r('app.media.avatar_Wednesday'),
      userName: "咸奶油儿",
      content: "好好看，很有氛围感",
      date: "03-31",
      location: "河南",
      likeCount: 0,
      isLiked: false,
      isDisliked: false,
      isAuthor: false,
      isLikedByAuthor: false
    },
    {
      avatar: $r('app.media.avatar_Colorwalk'),
      userName: "方大大大",
      content: "你好 请问这个是哪种字体啊",
      date: "04-04",
      location: "浙江",
      likeCount: 0,
      isLiked: false,
      isDisliked: false,
      isAuthor: false,
      isLikedByAuthor: false
    },
    {
      avatar: $r('app.media.avatar_mr_chu'),
      userName: "小跑傲娇",
      content: "哇~~~隐藏~~Lucky",
      date: "03-30",
      location: "北京",
      likeCount: 0,
      isLiked: false,
      isDisliked: false,
      isAuthor: false,
      isLikedByAuthor: false
    },
    {
      avatar: $r('app.media.avatar_alive'),
      userName: "🚗森yao是我吖~",
      content: "天，图2我巨喜欢！",
      date: "03-31",
      location: "四川",
      likeCount: 0,
      isLiked: false,
      isDisliked: false,
      isAuthor: false,
      isLikedByAuthor: false
    }
  ] : this.note.id === 4 ? [
    {
      avatar: $r('app.media.avatar_March'),
      userName: "明日",
      content: "你好，图一能用做头像吗？",
      date: "03-21",
      location: "湖北",
      likeCount: 2,
      isLiked: false,
      isDisliked: false,
      isAuthor: false,
      isLikedByAuthor: false,
      replies: [
        {
          avatar: $r('app.media.avatar_open_arms'),
          userName: "大鼻狗BigNoseDog",
          content: ": 人 可以！",
          date: "03-23",
          location: "重庆",
          likeCount: 4,
          isLiked: false,
          isDisliked: false,
          isAuthor: true,
          isLikedByAuthor: false
        }
      ]
    },
    {
      avatar: $r('app.media.star_sheep'),
      userName: "甜以待人。",
      content: "求图",
      date: "04-09",
      location: "河南",
      likeCount: 0,
      isLiked: false,
      isDisliked: false,
      isAuthor: false,
      isLikedByAuthor: false
    },
    {
      avatar: $r('app.media.avatar_film'),
      userName: "cute95%",
      content: "想要原图",
      date: "03-24",
      location: "上海",
      likeCount: 0,
      isLiked: false,
      isDisliked: false,
      isAuthor: false,
      isLikedByAuthor: false,
      replies: [
        {
          avatar: $r('app.media.avatar_open_arms'),
          userName: "大鼻狗BigNoseDog",
          content: "已发",
          date: "03-24",
          location: "重庆",
          likeCount: 0,
          isLiked: false,
          isDisliked: false,
          isAuthor: true,
          isLikedByAuthor: false
        }
      ]
    },
    {
      avatar: $r('app.media.avatar_sleep'),
      userName: "momo",
      content: "可以求这个原图嘛，谢谢啦",
      date: "04-12",
      location: "福建",
      likeCount: 0,
      isLiked: false,
      isDisliked: false,
      isAuthor: false,
      isLikedByAuthor: false
    },
    {
      avatar: $r('app.media.avatar_water'),
      userName: "我吃饱了",
      content: "你好求原图",
      date: "03-23",
      location: "辽宁",
      likeCount: 0,
      isLiked: false,
      isDisliked: false,
      isAuthor: false,
      isLikedByAuthor: false
    }
  ] : [];

  formatLikeCount(count: number): string {
    if (count >= 10000) {
      const wan = count / 10000;
      return wan % 1 === 0 ? `${wan.toFixed(0)}万` : `${wan.toFixed(1)}万`;
    }
    return count.toString();
  }

  @Builder
  buildCommentItem(comment: CommentItem, isReply: boolean = false, index: number = -1) {
    Column() {
      Row() {
        Image(comment.avatar)
          .width(isReply ? 24 : 32)
          .height(isReply ? 24 : 32)
          .borderRadius(isReply ? 12 : 16)
          .objectFit(ImageFit.Cover)
        
        Column() {
          Row() {
            Text(comment.userName)
              .fontSize(14)
              .fontColor('#999')
            
            if (comment.isAuthor) {
              Text("作者")
                .fontSize(10)
                .fontColor('#FF4D4F')
                .backgroundColor('#FFF0F0')
                .padding({ left: 4, right: 4, top: 1, bottom: 1 })
                .borderRadius(3)
                .margin({ left: 6 })
            }
          }
          .margin({ bottom: 4 })

          // 评论内容和表情图标
          Row() {
            Text(comment.content)
              .fontSize(15)
              .fontColor('#333')
              .lineHeight(22)

            // 评论中的表情图标
            if (comment.content.includes("同色系配色显高级") || 
                comment.content.includes("春天就要看一些像黄色一样明媚的东西") || 
                comment.content.includes("黄色充满活力") ||
                comment.content.includes("想要原图")) {
              Image($r('app.media.sign_emoji_kiss'))
                .width(18)
                .height(18)
            } else if (comment.content.includes("这个季节是大概几月几号啊?") || 
                       comment.content.includes("戒指也是樱花的形状嘞。")) {
              Image($r('app.media.sign_emoji_surprise'))
                .width(18)
                .height(18)
            }
          }
          .width('100%')
          .margin({ bottom: 6 })
          .alignItems(VerticalAlign.Top)

          Row() {
            Text(comment.date)
              .fontSize(13)
              .fontColor('#999')
            
            if (comment.location) {
              Text(comment.location)
                .fontSize(13)
                .fontColor('#999')
                .margin({ left: 6 })
            }

            Text("回复")
              .fontSize(13)
              .fontColor('#999')
              .margin({ left: 10 })
          }
        }
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)
        .margin({ left: 10 })

        Column() {
          Row({ space: 16 }) {
            // 点赞按钮
            Row({ space: 2 }) {
              if (comment.isLiked) {
                Image($r('app.media.sign_heart_red'))  // 红心
                  .width(16)
                  .height(16)
              } else {
                Image($r('app.media.sign_heart'))      // 空心
                  .width(16)
                  .height(16)
              }
              Text((comment.likeCount + (comment.isLiked ? 1 : 0)).toString())
                .fontSize(13)
                .fontColor('#999')
            }
            .padding({ top: 4, bottom: 4, left: 4, right: 4 })
            .hitTestBehavior(HitTestMode.Block)
            .onClick(() => {
              if (index >= 0 && index < this.comments.length) {
                this.comments[index].isLiked = !this.comments[index].isLiked;
                this.comments[index].isDisliked = false;
                const newComments: CommentItem[] = [];
                for (let i = 0; i < this.comments.length; i++) {
                  newComments.push(this.comments[i]);
                }
                this.comments = newComments;
              }
            })
            
            // 点踩按钮
            Row({ space: 2 }) {
              if (comment.isDisliked) {
                Image($r('app.media.unlike'))  // unlike图标
                  .width(16)
                  .height(16)
              } else {
                Image($r('app.media.sign_dislike'))  // 普通笑脸
                  .width(16)
                  .height(16)
              }
            }
            .padding({ top: 4, bottom: 4, left: 4, right: 4 })
            .hitTestBehavior(HitTestMode.Block)
            .onClick(() => {
              if (index >= 0 && index < this.comments.length) {
                this.comments[index].isDisliked = !this.comments[index].isDisliked;
                if (this.comments[index].isDisliked) {
                  this.comments[index].isLiked = false;
                }
                const newComments: CommentItem[] = [];
                for (let i = 0; i < this.comments.length; i++) {
                  newComments.push(this.comments[i]);
                }
                this.comments = newComments;
              }
            })
          }
        }
        .alignItems(HorizontalAlign.End)
        .justifyContent(FlexAlign.Center)
        .margin({ left: 8 })
      }
      .width('100%')
      .alignItems(VerticalAlign.Top)

      if (comment.replies && comment.replies.length > 0) {
        Column() {
          ForEach(comment.replies, (reply: CommentItem) => {
            this.buildCommentItem(reply, true)
          })
          
          Row() {
            Divider()
              .width(20)
              .strokeWidth(1)
              .color('#E0E0E0')
              .margin({ right: 8 })
            
            Text("展开 " + comment.replies.length + " 条回复")
              .fontSize(13)
              .fontColor('#999')
          }
          .width('100%')
          .margin({ top: 12 })
        }
        .width('100%')
        .margin({ top: 12, left: 42 })
      }
    }
    .width('100%')
    .padding({ left: isReply ? 0 : 16, right: 16, top: isReply ? 12 : 16, bottom: isReply ? 12 : 16 })
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Scroll() {
        Column() {
          Row() {
            Row() {
              Text("←")
                .fontSize(24)
                .fontColor('#333')
                .onClick(() => router.back())
              
              Image(this.note.avatar)
                .width(36)
                .height(36)
                .borderRadius(18)
                .objectFit(ImageFit.Cover)
                .margin({ left: 8 })
              
              Text(this.note.userName.split(' ')[0])
                .fontSize(16)
                .fontColor('#333')
                .fontWeight(FontWeight.Medium)
                .margin({ left: 8 })
            }
            .layoutWeight(1)

            Row() {
              Text("关注")
                .fontSize(15)
                .fontColor('#FF4D4F')
                .border({ width: 1, color: '#FF4D4F', radius: 18 })
                .padding({ left: 20, right: 20, top: 6, bottom: 6 })
              
              Image($r('app.media.sign_transmit'))
                .width(24)
                .height(24)
                .margin({ left: 16 })
            }
          }
          .width('100%')
          .height(56)
          .padding({ left: 12, right: 12 })
          .alignItems(VerticalAlign.Center)
          .backgroundColor('#FFF')

          Swiper() {
            ForEach(this.note.images, (img: Resource) => {
              Image(img)
                .width('100%')
                .height(400)
                .objectFit(ImageFit.Cover)
                .backgroundColor('#F5F5F5')
            })
          }
          .index(0)
          .autoPlay(false)
          .indicator(true)
          .loop(false)
          .onChange((index: number) => {
            this.currentImageIndex = index;
          })

          Column() {
            Text(this.note.title)
              .fontSize(18)
              .fontWeight(FontWeight.Medium)
              .fontColor('#333')
              .width('100%')
              .margin({ top: 16, bottom: 8 })

            Text(this.note.desc)
              .fontSize(15)
              .fontColor('#333')
              .lineHeight(24)
              .width('100%')
              .margin({ bottom: 10 })

            Text(this.note.tags.join('\n'))
              .fontSize(15)
              .fontColor('#083062')
              .lineHeight(24)
              .width('100%')
              .margin({ bottom: 14 })

            Row() {
              Text("共 " + (this.note.commentCount || 0) + " 条评论 ☰")
                .fontSize(15)
                .fontColor('#333')
                .fontWeight(FontWeight.Medium)
            }
            .width('100%')
            .padding({ top: 16, bottom: 8 })

            Row() {
              Image($r('app.media.avatar_mr_chu'))
                .width(32)
                .height(32)
                .borderRadius(16)
                .objectFit(ImageFit.Cover)
                .margin({ right: 12 })

              Row() {
                Text("留下你的想法吧")
                  .fontSize(14)
                  .fontColor('#999')
                
                Blank()
                
                Image($r('app.media.sign_mike'))
                  .width(20)
                  .height(20)
                  .margin({ right: 12 })
                
                Image($r('app.media.search'))
                  .width(20)
                  .height(20)
              }
              .layoutWeight(1)
              .height(40)
              .backgroundColor('#F5F5F5')
              .borderRadius(20)
              .padding({ left: 16, right: 12 })
              .alignItems(VerticalAlign.Center)
            }
            .width('100%')
            .margin({ bottom: 16 })

            ForEach(this.comments, (comment: CommentItem, index: number) => {
              this.buildCommentItem(comment, false, index)
            }, (comment: CommentItem) => comment.userName + comment.date)
          }
          .width('100%')
          .padding({ left: 16, right: 16 })
          .backgroundColor('#FFF')
        }
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#FFF')
      .scrollBar(BarState.Off)

      Row() {
        Row() {
          Image($r('app.media.sign_pen'))
            .width(16)
            .height(16)
          Text(" 说点什么...")
            .fontSize(14)
            .fontColor('#999')
        }
        .layoutWeight(1)
        .height(40)
        .backgroundColor('#F5F5F5')
        .borderRadius(20)
        .padding({ left: 16 })
        .margin({ right: 16 })

        Row({ space: 4 }) {
          if (this.isLiked) {
            Image($r('app.media.sign_heart_red')).width(22).height(22)
          } else {
            Image($r('app.media.sign_heart')).width(22).height(22)
          }
          Text(this.formatLikeCount(this.note.likeCount + (this.isLiked ? 1 : 0)))
            .fontSize(15)
            .fontColor('#333')
        }
        .onClick(() => {
          this.isLiked = !this.isLiked;
        })
        .margin({ left: 12 })

        Row({ space: 4 }) {
          if (this.isCollected) {
            Image($r('app.media.sign_yellow_star')).width(22).height(22)
          } else {
            Image($r('app.media.sign_star')).width(22).height(22)
          }
          Text(this.formatLikeCount((this.note.collectCount || 0) + (this.isCollected ? 1 : 0)))
            .fontSize(15)
            .fontColor('#333')
        }
        .onClick(() => {
          this.isCollected = !this.isCollected;
        })
        .margin({ left: 12 })

        Image($r('app.media.sign_message')).width(24).height(24).margin({ left: 12 })
      }
      .width('100%')
      .height(56)
      .padding({ left: 16, right: 16 })
      .backgroundColor('#FFF')
      .border({ width: { top: 1 }, color: '#E8E8E8' })
      .alignItems(VerticalAlign.Center)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFF')
  }
}
