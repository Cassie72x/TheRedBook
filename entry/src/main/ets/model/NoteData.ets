// 笔记数据模型
export interface NoteItem {
  id: number;
  images: Resource[];     // 详情页轮播图
  coverUrl: Resource;     // 首页封面图
  avatar: Resource;         // 用户头像
  userName: string;       // 用户名
  title: string;          // 标题
  desc: string;           // 正文内容
  tags: string[];         // 标签
  likeCount: number;      // 点赞数
  isLiked: boolean;       // 是否已点赞
  isCollected: boolean;   // 是否已收藏
  cardHeight: number;     // 首页卡片高度
  location?: string;      // 地点
  activity?: string;      // 活动
  groupChat?: string;     // 群聊
  searchSuggestion?: string; // 猜你想搜
  publishDate?: string;   // 发布日期
  publishLocation?: string; // 发布地点
  commentCount?: number;  // 评论数
  collectCount?: number;  // 收藏数
}

export const noteData: NoteItem[] = [
  {
    id: 1,
    images: [$r('app.media.Colorwalk'), $r('app.media.Colorwalk_2'), $r('app.media.Colorwalk_3'), $r('app.media.Colorwalk_4')],
    coverUrl: $r('app.media.Colorwalk'),
    avatar: $r('app.media.avatar_Colorwalk'),
    userName: "灏_",
    title: "Colorwalk | 记录我的街拍时刻，黄色治愈系",
    desc: "原来当我把目光聚焦在一种颜色上\n整座城市突然变得温柔又具体\n黄色不是最亮眼的\n但它总在不经意间跳出来\n像城市里的小太阳\n哪怕阴天\n也能照进心里一小块地方",
    tags: ["#colorwalk", "#交换春天", "#一键播放春天", "#黄色系", "#抬头看艺术", "#第一视角扫街", "#小红书影像激励计划", "#镜头里的光影", "#光影的艺术"],
    likeCount: 383,
    isLiked: false,
    isCollected: false,
    cardHeight: 200,
    commentCount: 60
  },
  {
    id: 2,
    images: [$r('app.media.Autumn'), $r('app.media.Autumn_2'), $r('app.media.Autumn_3')],
    coverUrl: $r('app.media.Autumn'),
    avatar: $r('app.media.avatar_Autumn'),
    userName: "伊森",
    title: "无限怀念大兴安岭的秋天",
    desc: "好想再一次回到大兴安岭的秋天\n.",
    tags: ["#大兴安岭", "#治愈系风景", "#留住秋天的一百种方式", "#对我友好的旅行", "#P人友好旅行"],
    likeCount: 20000,
    isLiked: true,
    isCollected: false,
    cardHeight: 240,
    location: "呼伦贝尔·大兴安岭",
    groupChat: "伊森的旅行群🏝️(124)",
    searchSuggestion: "大兴安岭在哪个城市",
    publishDate: "04-02",
    publishLocation: "山东",
    commentCount: 1419,
    collectCount: 6258
  },
  {
    id: 3,
    images: [$r('app.media.livephoto'), $r('app.media.livephoto_2'), $r('app.media.livephoto_3')],
    coverUrl: $r('app.media.livephoto'),
    avatar: $r('app.media.avatar_livephoto'),
    userName: "aoi_moe",
    title: '"是的——春天也需要你"livephoto⚫️',
    desc: "是的——春天需要你。\n经常会有一颗星等着你抬头去看。\n—— 里尔克《杜伊诺哀歌》\n-\n | iphone 17pro\n | 自带的调色盘超好用啊啊啊！\n大家拍完照片，如果对光不是很喜欢\n可以适应自带的调节 | 风格 | 进行选择~\n还可以滑动遥杆调整色彩范围\n我真的很喜欢了~",
    tags: ["#odd #生活影像诗 #治愈系生活摄影", "#我的摄影日记 #生活摄影治愈系", "#审美积累 #高级感", "#iPhone 拍照 #iPhone 摄影", "#低饱和 #ins 风", "#暗调滤镜 #暗调系调色", "#调色教程 #ins 风 #ins 风拍照", "#笔记灵感 #live 图"],
    likeCount: 88,
    isLiked: false,
    isCollected: false,
    cardHeight: 220,
    publishDate: "03-30",
    publishLocation: "日本",
    commentCount: 11,
    collectCount: 18
  },
  {
    id: 4,
    images: [$r('app.media.open_arms'), $r('app.media.open_arms_2')],
    coverUrl: $r('app.media.open_arms'),
    avatar: $r('app.media.avatar_open_arms'),
    userName: "大鼻狗 BigNoseDog",
    title: "人 拥抱和告别都需要 open arms",
    desc: ": 人 快看 狗找到了 sza 海",
    tags: ["#纽结大鼻狗 #原创IP #sza #travisscot #openarms #我的宝藏歌单 #海的那边是自由 #我的宝藏歌单 #inmyfeelings #小狗"],
    likeCount: 3005,
    isLiked: false,
    isCollected: false,
    cardHeight: 180,
    publishDate: "03-18",
    publishLocation: "重庆",
    commentCount: 49,
    collectCount: 630
  },
  {
    id: 5,
    images: [$r('app.media.Wednesday')],
    coverUrl: $r('app.media.Wednesday'),
    avatar: $r('app.media.avatar_Wednesday'),
    userName: "斑点香蕉",
    title: "星期三最有趣的植物生长在暗处",
    desc: "阴暗角落也有生命力。",
    tags: ["#植物", "#观察"],
    likeCount: 1343,
    isLiked: false,
    isCollected: false,
    cardHeight: 250
  },
  {
    id: 6,
    images: [$r('app.media.sleep')],
    coverUrl: $r('app.media.sleep'),
    avatar: $r('app.media.avatar_sleep'),
    userName: "大星 Paperstarfish",
    title: "睡觉",
    desc: "晚安,世界。",
    tags: ["#插画", "#黑白"],
    likeCount: 1,
    isLiked: false,
    isCollected: false,
    cardHeight: 190
  },
  {
    id: 7,
    images: [$r('app.media.star_sheep')],
    coverUrl: $r('app.media.star_sheep'),
    avatar: $r('app.media.avatar_star_sheep'),
    userName: "松间织晚风",
    title: "被这只小羊很很治愈",
    desc: "可可爱爱,没有脑袋。",
    tags: ["#可爱", "#小羊"],
    likeCount: 647,
    isLiked: false,
    isCollected: false,
    cardHeight: 210
  },
  {
    id: 8,
    images: [$r('app.media.water')],
    coverUrl: $r('app.media.water'),
    avatar: $r('app.media.avatar_water'),
    userName: "15_",
    title: "保佑我的一生是一万次的歪打正着",
    desc: "好运连连。",
    tags: ["#好运", "#天空"],
    likeCount: 430,
    isLiked: false,
    isCollected: false,
    cardHeight: 260
  },
  {
    id: 9,
    images: [$r('app.media.wechat_avatar')],
    coverUrl: $r('app.media.wechat_avatar'),
    avatar: $r('app.media.avatar_wechat_avatar'),
    userName: "Fishing 摸鱼画报局",
    title: "WeChat 头像 | 小猫好天气",
    desc: "猫猫祟祟。",
    tags: ["#猫咪", "#头像"],
    likeCount: 696,
    isLiked: false,
    isCollected: false,
    cardHeight: 230
  },
  {
    id: 10,
    images: [$r('app.media.film')],
    coverUrl: $r('app.media.film'),
    avatar: $r('app.media.avatar_film'),
    userName: "紫希王",
    title: "电影《自杀专卖店》",
    desc: "黑色幽默的治愈。",
    tags: ["#电影", "#推荐"],
    likeCount: 2913,
    isLiked: false,
    isCollected: false,
    cardHeight: 200
  },
  {
    id: 11,
    images: [$r('app.media.March')],
    coverUrl: $r('app.media.March'),
    avatar: $r('app.media.avatar_March'),
    userName: "吴咔嗦",
    title: "三月",
    desc: "春天的气息。",
    tags: ["#三月", "#记录"],
    likeCount: 514,
    isLiked: false,
    isCollected: false,
    cardHeight: 200
  },
  {
    id: 12,
    images: [$r('app.media.mr_chu')],
    coverUrl: $r('app.media.mr_chu'),
    avatar: $r('app.media.avatar_mr_chu'),
    userName: "鹿鹿鹿鹿鹿鹿鹿",
    title: "喜欢这个蓝调时刻的 mr.chu",
    desc: "浪漫至死不渝。",
    tags: ["#蓝调", "#浪漫"],
    likeCount: 207,
    isLiked: false,
    isCollected: false,
    cardHeight: 280
  },
  {
    id: 13,
    images: [$r('app.media.wind')],
    coverUrl: $r('app.media.wind'),
    avatar: $r('app.media.avatar_wind'),
    userName: "半句",
    title: "风是暖的,好像身体比我先开心起来了",
    desc: "感受风的温度。",
    tags: ["#风", "#温暖"],
    likeCount: 4,
    isLiked: false,
    isCollected: false,
    cardHeight: 240
  },
  {
    id: 14,
    images: [$r('app.media.alive')],
    coverUrl: $r('app.media.alive'),
    avatar: $r('app.media.avatar_alive'),
    userName: "鹿柯阿-",
    title: "所有心气都可以在春天恢复重生",
    desc: "春天万物复苏。",
    tags: ["#春天", "#重生"],
    likeCount: 27000,
    isLiked: false,
    isCollected: false,
    cardHeight: 220
  },
  {
    id: 15,
    images: [$r('app.media.Spring')],
    coverUrl: $r('app.media.Spring'),
    avatar: $r('app.media.avatar_Spring'),
    userName: "江时七",
    title: "春天没有方向,春天只顾开花",
    desc: "文字的力量。",
    tags: ["#文字", "#春天"],
    likeCount: 543,
    isLiked: false,
    isCollected: false,
    cardHeight: 250
  },
  {
    id: 16,
    images: [$r('app.media.brave')],
    coverUrl: $r('app.media.brave'),
    avatar: $r('app.media.avatar_brave'),
    userName: "麦简单",
    title: "临摹 18| 勇敢的人先享受世界",
    desc: "画画日常。",
    tags: ["#临摹", "#画画"],
    likeCount: 252,
    isLiked: false,
    isCollected: false,
    cardHeight: 210
  }
];
