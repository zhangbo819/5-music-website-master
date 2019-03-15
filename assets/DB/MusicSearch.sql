SET NAMES UTF8;
DROP DATABASE IF EXISTS MusicSearch;
CREATE DATABASE MusicSearch CHARSET=UTF8;
USE MusicSearch;


/**用户信息**/
CREATE TABLE ms_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),
  avatar VARCHAR(128),        #头像图片路径
  user_name VARCHAR(32),      #用户名，如王小明
  gender INT                  #性别  0-女  1-男
);

/**音乐信息**/
CREATE TABLE ms_musicDetails(
  mid INT PRIMARY KEY AUTO_INCREMENT,
  mname VARCHAR(32),
  author VARCHAR(64),
  author2 VARCHAR(64),
  time VARCHAR(32),		   #歌曲时间
  cImgUrl VARCHAR(128) ,           #content 图片路径
  cmusicDetails VARCHAR(1024),     #content 详细信息
  mMusicUrl VARCHAR(128) ,         #音乐歌曲路径
  mImgUrl VARCHAR(128),            #音乐图片路径
  type VARCHAR(32),                #音乐类型
  playCount INT                    #音乐播放次数
);

/**公告信息**/
CREATE TABLE ms_noticeDetails(
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64) ,
  Content VARCHAR(256) ,
  times DATETIME
);

/**会员信息**/
CREATE TABLE ms_member(
  meid INT PRIMARY KEY AUTO_INCREMENT,
  mename VARCHAR(32),
  mepwd VARCHAR(32),
  truename VARCHAR(8),
  sex INT ,		      #性别  0-女  1-男
  Age INT, 
  phone VARCHAR(16),
  Email VARCHAR(32),
  QQ INT           
);

/**留言信息**/
CREATE TABLE ms_leaveMeassage(
  id INT PRIMARY KEY AUTO_INCREMENT,
  Student_id INT ,
  title VARCHAR(32) ,
  Content VARCHAR(128) ,
  times DATETIME 
);




/**用户信息**/
INSERT INTO ms_user VALUES
(NULL, 'dingding', '123456', 'ding@qq.com', '13501234567', 'img/avatar/default.png', '丁伟', '1'),
(NULL, 'dangdang', '123456', 'dang@qq.com', '13501234568', 'img/avatar/default.png', '林当', '1'),
(NULL, 'doudou', '123456', 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦志强', '1'),
(NULL, 'yaya', '123456', 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅', '0');

/**音乐信息**/
INSERT INTO ms_musicDetails VALUES
(NULL, '搁浅的心', '董运昌', '格子', '2016-12-21','./assets/images/music_details/搁浅的心2.jpg',
'董运昌是台湾指弹先驱，有“吉他诗人”的称号。曾获得台湾地区大专创作歌谣冠军及最佳编曲奖、热门音乐大赛冠军及最佳创作奖、青春之星第三名及青春之星金手奖最佳吉他手、第一 届行政院环保歌曲创作比赛优胜奖、第十届以及第十四届金曲奖最佳流行音乐演奏专辑奖、并荣获第十四届金曲奖流行音乐制作人提名。搁浅的心收录于作品谱集《在第三十三街角与你相遇》。', './assets/music/搁浅的心.mp3', './assets/images/music_details/搁浅的心1.jpg'
,'guitar',16451),

(NULL, '梦中的婚礼', '理查德.克莱德曼',  'Richard Clayderman', '2016-11-17','./assets/images/music_details/安静的午后1.jpg',
'躺在绿树下，静静的吹着微风，度过一个安静的午后。
<br /><br /> 年不识愁滋味，<br /> 爱上层楼。<br /><br /> 爱上层楼，<br /> 为赋新词强说愁。<br /><br /> 而今识尽愁滋味，<br /> 欲说还休。<br /><br /> 欲说还休，<br /> 却道天凉好个秋。','./assets/music/梦中的婚礼.mp3', 'http://p4.music.126.net/y_m2FXuYNBxITD4D80Aq2w==/1372190524437978.jpg','piano',9531),

(NULL, 'The truth that you leave', 'Pianoboy', 'Boom', '2016-12-13','./assets/images/music_details/Thetruththatyouleave1.jpg',
'这曲The truth that you leave存在着很多的意义，至今仍有无数的人为它填词，但一直都没能有合适的歌词。整曲洋溢着忧伤的气氛。<br />
<br />
Pianoboy 在部落格里分享他自己创作的音乐。他作了不少曲子，但公开的很少。是一位独立的音乐创作人。<br />
<br />
他的作品极具个人化。都是旋律非常简单的钢琴，没有大师般华丽的技巧，有过一定钢琴基础的人都能够弹奏。然而，简单的旋律能够如此讨人喜欢，亦是一种不简单。', './assets/music/Thetruththatyouleave.mp3', 'http://p4.music.126.net/y_m2FXuYNBxITD4D80Aq2w==/1372190524437978.jpg','piano',10923),

(NULL, '夜的钢琴曲五', '石进', '超级无敌帅气苗', '2016-11-14','./assets/images/music_details/夜的钢琴曲五1.jpg',
' 每一个被敲打的黑白键，都流淌着时光的味道。<br />
谁不眷恋这一词一曲的光辉。<br />
<br />
每个人记录生活的方式都不同，<br />
有人用文字，有人用DV，有人用述说，而石进，选择用音乐，<br />
每个人方式不一样，但却都有着共同的愿望，<br />
失去的日子，我们都需要回忆……', './assets/music/夜的钢琴曲五.mp3', 'http://p3.music.126.net/hNJFmhHzaGxYYwVbQbALNw==/79164837215733.jpg','piano',1319),

(NULL, 'Tassel', 'Cymophane', '超级无敌帅气苗', '2016-12-25','./assets/images/music_details/Tassel1.jpg',
'清脆的钢琴，<br />
伴随着鼓点的节奏，<br />
依然无法掩盖住忧伤的提琴…<br />
<br />
已经走了这么久的路,<br />
还是没有走出昨日的痛苦,<br />
徘徊在命运的归途,<br />
等待未来我的路,<br />
以前明明很幸福,<br />
怎么变成了孤独,<br />
<br />
犯下的错误,<br />
已经无法弥补,<br />
我只是希望你幸福,<br />
你却不知道我用心良苦.<br />
<br />
已经走到了这一步,<br />
还要怎么认输,<br />
我真的希望你快乐.<br />
可你怎么将爱割舍,<br />
就算是我的过错,<br />
也不要变得这样冷漠,<br />
我只是希望你幸福.', './assets/music/Tassel.mp3', 'http://p3.music.126.net/7cYhniBuLvU3fvLjeRFeNw==/106652627910735.jpg','piano',1314),

(NULL, 'Flower Dance', 'DJ OKAWARI', 'HaPBoy', '2016-11-11','./assets/images/music_details/FlowerDance1.jpg',
' Woman-They serve the purpose of changing hydrogen into breathable oxygen. And they‘re as necessary here as the air is, on Earth.<br />
Man-But I still say, they`re flowers.<br />
Woman-If you like... <br />
Man-Do you sell them? <br />
Woman-I afraid not. <br />
Man-But, maybe we could make a deal?<br />
<br />
来自1960电影Outer Space', './assets/music/FlowerDance.mp3', 'http://p3.music.126.net/P1ac-TWkFzjDqcvl5_oK7Q==/881808325476577.jpg','guitar',7861),

(NULL, '流れ行く云', '岸部眞明', 'Hapon', '2016-12-21','./assets/images/music_details/流れ行く云1.jpg',
'人生在世，我们不得不承认，很多人只能是心上的一抹流云
            <br>流云是不可拥有的，所以，早晚会消失在天际
            <br>毋庸感伤什么，只感谢相遇相知的缘分就够了
            <br>从来没有去刻意的去想象
            <br>也没有过多的追问
<br>
            <br>究竟是谁，让我有了一种不能言说的感觉
            <br>多少次的迷惘过后，还是一份不能理清的思绪
            <br>其实，终于明了，不是别人，是自己
            <br>是自己让自己这样的无助且凄迷
<br>
            <br>五月的风掠过城市的上空，五月的雨下的淅淅又沥沥
            <br>五月的小草已经是一片葱绿
            <br>五月的天空明媚如新
            <br>五月的丁香已满城飘香
            <br>五月的柳枝已经摇摆如丝
            <br>走过五月，又是一个炎热的夏季
            <br>而我已不能再回归到从前
            <br>漠然的走在城市的街头
            <br>再也记不起秋季里的那片红叶
<br>
            <br>我已想不起那飘飞的感觉
            <br>天上依然是那流动的浮云
            <br>心却不是那从前的心
            <br>记忆的颜色不再缤纷
            <br>而我却执著着雨季里的声音
            <br>就做天际那一抹流云吧
            <br>来去皆无痕迹
            <br>不会只属于谁
            <br>也不会羁绊为谁
<br>
            <br>笑看落花流水
            <br>坐看风起云涌
            <br>一份闲淡
            <br>一份从容
            <br>就感谢相遇相知的缘分吧
            <br>珍惜着那一份友谊
            <br>感谢着曾经的相知
            <br>即使曾经心痛
            <br>即使泪飞如雨。
<br>
            <br>如果将来的一天
            <br>仍然能隔屏相见，
            <br>可否笑谈昨日云烟
<br>
            <br>记忆中的种种
            <br>风过无痕，水去无踪', './assets/music/流れ行く云.mp3', 'http://p3.music.126.net/l5-9FCPKx9xrUtzyKCMPPw==/81363860481074.jpg','guitar',95124),

(NULL, '奇迹の山', '岸部眞明', 'Hapon', '2016-12-22','./assets/images/music_details/奇迹の山1.jpg',
'岸部真明(Masaaki Kishibe)是日本新生代的演奏家，日本指弹吉他大师中川砂仁(Isato Nakagawa)的学生。其作品风格非常的多元化，既有优美清新的吉他独奏小品，又有另类的独奏作品，他于2003年参加了National Fingerstyle Guitar Championships，并获得了第2名的好成绩，展现了其非凡的实力。《奇迹の山》收录在专辑《奇迹の山》中。', './assets/music/奇迹の山.mp3', 'http://p4.music.126.net/l5-9FCPKx9xrUtzyKCMPPw==/81363860481074.jpg','guitar',89123),

(NULL, '人生的回转木马', '久石譲', 'Hapon', '2016-12-17','./assets/images/music_details/人生的回转木马1.jpg',
'爱情是什么，是从天而降的他拉着你的手飞。爱情是无知少年的一次醒悟，找到此生要做的事情就是保护她。爱情是任性的黑翼天使被纯真的魔法解救，可是要等多久呢，等到你来的时候，我的眼睛还闪亮吗，我还拥有那纯真的魔法吗？如果不巧，就只是瘫坐在椅子中央的老妇想着年轻时候的梦。——哈尔的移动城堡', './assets/music/人生的回转木马.mp3', 'http://p3.music.126.net/GTq53GxoMP72HIjLb9QFcA==/637716744121740.jpg','cartoon',5464),

(NULL, 'Summer', '久石譲', '穿靴子的猫', '2016-12-22','./assets/images/music_details/Summer1.jpg',
'Summer这首歌是完完全全没有用技巧作出来的歌曲，就像天然的玉璞一样不加任何雕饰。全曲和声经计算共六个，证明久石让不仅在复杂和声方面颇有成就，在简单的和声中也能做出这样优美的曲子。', './assets/music/Summer.mp3', 'http://p4.music.126.net/rH6qznhQRIS3u3ANmbckRQ==/556352883666539.jpg','piano',7819),

(NULL, '人生的回转木马', '久石譲', 'Hapon', '2016-12-17','./assets/images/music_details/人生的回转木马1.jpg',
'爱情是什么，是从天而降的他拉着你的手飞。爱情是无知少年的一次醒悟，找到此生要做的事情就是保护她。爱情是任性的黑翼天使被纯真的魔法解救，可是要等多久呢，等到你来的时候，我的眼睛还闪亮吗，我还拥有那纯真的魔法吗？如果不巧，就只是瘫坐在椅子中央的老妇想着年轻时候的梦。——哈尔的移动城堡', './assets/music/人生的回转木马.mp3', 'http://p3.music.126.net/GTq53GxoMP72HIjLb9QFcA==/637716744121740.jpg','cartoon','4581'),

(NULL, '聪明的一休', '小蓓蕾组合', '听歌讲故事', '2016-11-14','./assets/images/music_details/あの夏へ1.jpg',
' 每次音乐一响起，仿佛那个夏天又来临。千寻坐在后座，望向窗外，仿佛同旧的小伙伴告别，同旧的过去告别。带着一点惊奇，一点忧伤，一点云淡风轻，一点宿命的分离，一点平常又童话的开场。旧时光里，那个好奇又纤细敏感的少女。<br />
<br />
人生就是一列开往坟墓的列车 路途上会有很多站 很难有人可以至始至终陪着走完 当陪你的人要下车时 即使不舍 也该心存感激 然后挥手道别。', './assets/music/聪明的一休.mp3', 'http://p3.music.126.net/8uxjyKoiCTrVbbTs_bR5Ow==/28587302347759.jpg','cartoon',13191),

(NULL, '桜花抄', '天門', 'Leo_', '2016-11-25','./assets/images/music_details/桜花抄1.jpg',
'  那时候看5秒还是一个男生推荐的，那时候喜欢那个男生喜欢了两年，告白后他很长时间没有说话<br />
<br />
直到有一节晚自习他推荐我去看5秒，之后我忘了这件事之后他转学了，直到去年突然想起，看了一遍后仅仅是开头就开始难过了两天，马上便去问他为什么让我看，他说当时也喜欢你，只是要转学了不能让你一个人等。', './assets/music/桜花抄.mp3', 'http://p4.music.126.net/1sw_ptPeI_GNm58VBW1udQ==/2504687488135369.jpg','cartoon',7973),

(NULL, '風の住む街', '磯村由纪子', 'Hapon', '2016-12-20','./assets/images/music_details/風の住む街1.jpg',
'《风居住的街道》是2003年矶村由纪子与日本著名二胡演奏家坂下正夫合作的经典曲目，二胡与钢琴的搭配对话，令人耳目一新，钢琴的深沉融入女性特有的细腻，在二胡的泛音延留中，或沉寂，或作轻微的回应，清澈，温暖，淡定。而二胡亦有着优雅而舒缓的气质，那是一缕相思，一腔柔情，一抹淡淡弥漫着的忧伤，更是一种直抵人心的美丽。整体上来说，二胡的比重大于钢琴，或者说是感染力超越了钢琴，二胡的忧伤在这里胜过了钢琴的浪漫，钢琴和二胡交织在一起，相互倾诉，相互爱慕，但永远不会重合，仿佛两个永远都不能在一起的恋人。', './assets/music/風の住む街.mp3', 'http://p4.music.126.net/ap7KvRE0-V4kfThDVVor9A==/18777459579736085.jpg','piano',10901),

(NULL, '晴れ 时どき 雪', 'DEPAPEPE', 'Annie雀', '2016-11-22','./assets/images/music_details/晴れ时どき雪1.jpg',
'清晨
              <br /> 阳光透过玻璃洒落床头
              <br /> 惺忪睁开眼
              <br /> 这是很多人理想中的醒来的场景
              <br /> 生活就该如此美好', './assets/music/晴れ时どき雪.mp3', 'http://p4.music.126.net/-aHb2MWUV7nyYnh8P88Eqg==/854320534825237.jpg','guitar',5915),

(NULL, '暁の车(piano version)', 'FictionJunction', '天爱小羽', '2016-12-11','./assets/images/music_details/暁の车1.jpg',
' 原以为哭喊最痛时的表达，<br />
经历过才知道，<br />
痛到极致是发不出声音，<br />
流不出眼泪的，<br />
那是种无法形容的绝望和空茫。', './assets/music/暁の车.mp3', 'http://p4.music.126.net/aK5v-lsXgqJaYYmw10gnkw==/5796625301669273.jpg','cartoon',19481),

(NULL, '鸟の诗 ~', '車谷浩司', 'Boom', '2016-12-26','./assets/images/music_details/鸟の诗1.jpg',
'             静谧的雨夜，就这样窝在被子里听首钢琴曲吧，每个音符都像踮着脚尖走在心上。<br />
<br />
就让它们来消除所有不安，担忧。让我们暂时徜徉在音乐的海洋里，晚安吧。最近状态不好，给我点时间，我会recover。', './assets/music/鳥の詩.mp3', 'http://p3.music.126.net/MD_NxNSsaIjDHwkvZ0_unA==/849922488271033.jpg','cartoon',19412),

(NULL, 'A Little Story', 'Valentin', 'LoveMiao', '2016-12-26','./assets/images/music_details/ALittleStory1.jpg',
'既有节奏，又有意境的钢琴曲少之又少，分享一首节奏控会喜欢的轻音乐——《A little story》，由Valentin创作，旋律简单但容易上瘾，也是一首只听开头就会喜欢上的纯音乐，钢琴和鼓点搭配在一起如行云流水般。掷地有声的触感，音乐的美好尽在指间流淌。唯美的画面配上清新的旋律，享受一下视觉听觉的双重盛宴！', './assets/music/ALittleStory.mp3', 'http://p4.music.126.net/Kcxcv0cfsdAx30HZ_6tDGQ==/827932255715549.jpg','elect',21211),

(NULL, 'Remember', '7AND5', 'HaPBoy', '2016-11-25','./assets/images/music_details/Remember1.jpg',
'7and5 的真名叫 John H. Nixon，是个集作曲、编曲和制作为一身的音乐家。1989年，John H. Nixon毕业于美国著名的伯克利音乐学院。毕业后，John H. Nixon在密西根州的底特律电影中心与电视市场从事作曲和监制，并在那里工作十几年。曾为许多知名企业和媒体制作宣传音乐和背景音乐，包括 Ford 、Coke 、Chevrolet 、Cadillac 、HGTV、The United Way 、Autotrader、Sirius Radio 等。他参与制作的系列有《Buddha Lounge 6》和《Celtic Lounge III》 7and5构思始于10年前，在底特律市，电子音乐盛行。当时John H. Nixon还在底特律一家发行铁克诺音乐的唱片公司工作。因此John H. Nixon受到了电子音乐的影响，对他以后的创作产生了深远的影响。', './assets/music/Remember.mp3', 'http://p3.music.126.net/N0b8fzm7vl6tkj1Rfqa3hQ==/794946906935600.jpg','elect',11114),

(NULL, 'Purple Passion', 'Diana Boncheva', 'SvenjaWhee', '2016-12-17','./assets/images/music_details/PurplePassion1.jpg',
'《Purple Passion》原曲由保加利亚著名电子小提琴家Diana Boncheva(1981年出生)演奏，是她的一首著名曲目。激情澎湃的旋律，跳跃欢快的音符将听者逐步带入高潮，华丽的乐曲令指尖亦无法抗拒，尽情地随之跳跃。《Purple Passion》被作为游戏《爱丽丝快跑》的背景音乐。《Purple Passion》翻译过来的歌曲名称为《紫色激情》，紫色代表一种强烈的感情，因此才会有“紫色的热情”（直译）的说法。', './assets/music/PurplePassion.mp3', 'http://p3.music.126.net/_LSagRKhZzUsjSy5fIAMsg==/923589767384661.jpg','elect',6479),

(NULL, 'Canon', 'Gustavo Montesano', '穿靴子的猫', '2016-12-11','./assets/images/music_details/Canon1.jpg',
'Flamenco是指传统西班牙南方Andalusia 的歌舞型式，尤其是指这地区吉普赛人的歌舞，它并不是西班牙土生土长的民俗音乐，而是在经过几个世纪的发展，吸收融合阿拉伯摩尔人，吉普赛，Andalusian甚至拉丁美洲等文化的影响，而成为今天的样式。说到Flamenco，不得不提一下它那令人眩目的吉他技术，行云流水，而且速度相当快，Flamenco中一般是两把吉他，西班牙吉他主要是弹奏低音，葡萄牙吉他主要弹奏高音，下面我们来听一段好听的Flamenco吉他演奏。', './assets/music/Canon.mp3', 'http://p3.music.126.net/mwv7Uc-k2xxfB2mcp21IEQ==/1708641069569351.jpg','guitar',3951),

(NULL, 'Intro - intro', 'The XX', 'SvenjaWhee', '2016-11-24','./assets/images/music_details/Introintro1.jpg',
'前奏有种身处宇宙深处的即视感，<br />
随着鼓点的进入，<br />
好像慢慢进入了一个陌生的星球，<br />
<br />
周围全是那么的陌生与奇特，<br />
最后重回浩瀚的宇宙，<br />
深邃壮阔，<br />
隐隐能看到太阳从星球旁漏出的耶稣光。', './assets/music/Intro.mp3', 'http://p4.music.126.net/Xik6a3wXoGPOLI1GNXGdFQ==/825733232504415.jpg','elect',6515),

(NULL, 'Always With Me', '奥户巴寿', 'Hapon', '2016-12-26','./assets/images/music_details/AlwaysWithMe1.jpg',
'            内心深处在呼唤你 我要找到你<br />
虽然悲伤在重演 但我仍坚信不疑<br />
我们总是擦肩而过 但我无能为力<br />
虽然前途很飘渺 但我仍寻找光明<br />
<br />
莫名的生存然后死去 我不知为何来到这里<br />
因为你 我的存在变得很有意义<br />
我的梦想一次次的破碎 不想回忆心中的悲伤<br />
那就让我把心事轻轻的歌唱<br />
<br />
当太阳从东方升起 唤醒沉睡大地<br />
我已感觉到我的存在是那么有意义<br />
所有的闪耀都在身边 有你陪伴着我<br />
从此不再寻找 从此不孤单<br />
♥', './assets/music/AlwaysWithMe.mp3', 'http://p3.music.126.net/nODD72PnMS73c65auMtBkw==/1781208837010263.jpg','piano',13100),

(NULL, 'Levels - Radio Edit', 'Avicii', '千秋', '2016-12-13','./assets/images/music_details/Levels-RadioEdit1.jpg',
'            这首好听的电音歌曲是由知名瑞典DJ及音乐制作人Avicii（原名Tim Bergling）创作。<br />
<br />
Avicii于1989年9月8日出生在瑞典的斯德哥尔摩。自小迷恋音乐的他对电音舞曲情有独钟，受到了Daft Punk的熏陶，加上瑞典地区发达的电音产业让他萌生了成为DJ的念头。', './assets/music/levels.mp3', 'http://p4.music.126.net/70xhYJbIiCCHPA13VYe_0A==/680597697600642.jpg','elect',19153),

(NULL, 'Journey', 'Capo Productions', 'anastas', '2016-12-19','./assets/images/music_details/Journey1.jpg',
'            轻快的钢琴，<br />
与沉重的鼓声。<br />
<br />
好像生活一样，<br />
每天都可以是不同的旋律，<br />
但是时间却会以相同的速度流逝，<br />
<br />
你想要抓住，<br />
想要让时间慢一点，<br />
想要更充分的享受此刻，<br />
<br />
只是时间不曾犹豫不前，<br />
它教会了你专心致志去过好每一个瞬间，<br />
忽快忽慢，<br />
互相交织。','./assets/music/Journey.mp3','http://p3.music.126.net/x-LVbj4tX6oEDH3qkqJP2g==/663005511556827.jpg','piano',9991),

(NULL, 'Alice', 'おさむらいさん', '花咲恵子', '2016-11-14','./assets/images/music_details/Alice1.jpg',
'久远、久远、无法玩笑之谈。哪一天、如果我不再留於此在幽深、幽深的森林中陷落迷茫你会一个人走下去的吧。牵系的手传来柔软的体温交握的手指若缓缓、松脱放下的话枯竭音色的钟便要鸣响。你会一个人继续走下去的吧。','./assets/music/alice.mp3','http://p3.music.126.net/mRxnT6V7zfHBMHAuIA0CCg==/688294279009689.jpg','piano',9959),

(NULL, '風見鶏', 'DEPAPEPE', 'Annie雀', '2016-12-23','./assets/images/music_details/風見鶏1.jpg',
"DEPAPEPE是一个2002年建立的日本二人吉他组合。小组成员分别是德冈庆也和三浦拓也。DEPAPEPE 2002年11月由德冈庆也及三浦拓也二人合组而成的DEPAPEPE 当时从神户到大阪、 京都以及东京，随着街头表演的经验累积，DEPAPEPE瞬间开启了知名度及人气。在他们正是发布自己的专辑之前，曾发行过3张小制作的独立专辑，而且总销量达到十万张。2005年DEPAPEPE发行了他们第一张正式专辑《Let's Go!!!》。風見鶏收录于《Let's Go!!!》。",'./assets/music/风见鶏.mp3','http://p3.music.126.net/NynNk8_jNP_9ycr3g6Ao3g==/909296116194443.jpg','guitar',46451),

(NULL, '白詰草', 'Key Sounds Label', '花咲恵子', '2016-11-14','./assets/images/music_details/白詰草1.jpg',
' 夏日的午后，<br />
<br />
树荫下清凉的微风，<br />
<br />
屋檐下清新的风铃。','./assets/music/白诘草.mp3','http://p4.music.126.net/ckfEE9UUGcnGHylQJ12ENA==/670702092966093.jpg','cartoon',9894),

(NULL, 'Refrain', 'Anan Ryoko', 'HaPBoy', '2016-12-26','./assets/images/music_details/Refrain1.jpg',
'《Refrain》，日本钢琴才女Anan Ryoko所创单曲，旋律优美动听，柔和而清澈，极富自然气息，是Anan最为出名的钢琴曲之一。此单曲后收录于专辑《Eternal Light》中。 Anan Ryoko，日本女钢琴家兼作曲家，从幼年时期就培养出独到的技巧和丰富的音乐理论，再加上从古典爵士高度演奏力中产生出柔滑纤细的旋律，形成独特的音乐风格。现活跃于作曲、编曲、录音、现场演出等各个领域范畴。','./assets/music/Refrain.mp3','http://p3.music.126.net/fNtMX44fvaGByURP0AbOZQ==/836728348761063.jpg','piano',6126),

(NULL, '十年', '杨亮', '幻钢琴', '2016-11-12','./assets/images/music_details/風の詩1.jpg',
'押尾光太郎(Kotaro Oshio)（1968年2月1日－）钢弦吉他手，日本大阪出生。身高183公分。他的创作被区分到许多领域，如POP、NEW AGE、JAZZ之中，技巧包含了fingerpicking、slap harmonics、precisestrumming。曾受到中川砂人（Isato Nakagawa）、冈崎伦典（Rynten Okazaki）两位老师的指导，深受美国知名吉他手Michael Hedges的影响，本身风格除了具有节奏性之外，也保留了中川砂人的低音及旋律性特色，而创出属于自己的风格，他在吉他上演奏出来了让人以为是一把吉他不可能同时演奏出来的音色，这里面融合了力量，温婉，柔美，受到了大家的接受和喜爱。','./assets/music/十年.mp3','http://p4.music.126.net/Fm-iq7PQ0iuWIAFX_0Y_Ag==/691592813893047.jpg','guitar',12511),

(NULL, 'Long Good-Byes', 'July', '千秋', '2016-12-17','http://ww3.sinaimg.cn/large/0060lm7Tgw1fb5etqzv9fj30go0comy3.jpg',
'漫长的再见。<br />
<br />
再见，或许再也不见了吧，<br />
轻巧的钢琴却吐露着世间最难以启齿的话语，两人终于彼此说出了“再见”，也许，他们想说的是“永别”。旋律婉转也不能减少彼此之间深重的忧伤，时间短暂也不能打消彼此之间离去的无奈。','./assets/music/LongGood-Byes.mp3','http://p3.music.126.net/0--3AMUHo5cC51u0bw5m6w==/2459607511360013.jpg','elect',4198),

(NULL, 'Paragon', 'A.N.O.&Shadowx', '小柴神', '2016-12-21','./assets/images/music_details/Paragon1.jpg',
'            整个曲子犹如一个人的一生，<br />
刚开始是小时候慢生活慢节奏，<br />
长大了对一切都麻木，<br />
生活像是重复快进变为快节奏，<br />
老了又是慢节奏，<br />
才发现已经错过太多大好时光。','./assets/music/Paragon.mp3','http://p3.music.126.net/u2qw015YjzoLmZEE9i6BtQ==/5906576464596888.jpg','elect',16121),

(NULL, 'Because of You', 'Josh Vietti', 'Octobse_Idy', '2016-11-23','./assets/images/music_details/BecauseofYou1.jpg',
'            当我垂垂老矣，静坐一藤椅，手捧一册诗集，蝉声伴随着流云流淌过心田，往事一一浮现于眼前，再逐渐烟消云散。<br />
<br />
当我阖上双眼，恍然明了，一切生死皆为浮尘，只是记忆不朽。这便是我的桑榆暮景了罢','./assets/music/BecauseofYou.mp3','http://p4.music.126.net/owPnoYfYbiPKmuPkfruyTQ==/5976945209049357.jpg','elect',16841),

(NULL, 'Easy Breeze', 'Thomas Greenberg', 'Hannah', '2016-11-12','./assets/images/music_details/EasyBreeze1.jpg',
'            清风拂过<br />
<br />
去见你想见的人吧<br />
<br />
趁阳光正好趁微风不噪','./assets/music/EasyBreeze.mp3','http://p3.music.126.net/gt1N74Q6aj8GmCJLJZuGuA==/2908208257356071.jpg','elect',1118),

(NULL, 'Some', 'Nils Frahm', '花咲恵子', '2016-12-22','./assets/images/music_details/Some1.jpg',
'想念一个人，不需要语言，却需要的勇气。<br><br>当你看着路上熙熙攘攘的人，独自品味孤独的时候；当你静坐一隅，默默的感受心里那份惆怅的时候。<br><br>你会感悟，想一个人会多么寂寞，念一个人会多么心痛，想念一个人的夜会多么寒冷。想念一个人有时也许会面带微笑，但你的心却会流泪。','./assets/music/Some.mp3','http://p3.music.126.net/bpfFbQ1zoKPlf7SBa6hx0Q==/7727367720657179.jpg','guitar',95115),

(NULL, 'Whisper Bless', 'V.A.', 'Hannah', '2016-12-20','./assets/images/music_details/WhisperBless1.jpg',
' 一个人的时候，<br />
戴上耳机，<br />
旋律流淌进心房。<br />
<br />
我在城市中最高的地方眺望，<br />
却看不到远方你的身影。<br />
<br />
树影婆娑，<br />
阳光在钢琴的黑白键上跳跃，<br />
我坐你曾经坐过的地方，<br />
好像自己就变成了你一样。<br />
<br />
想一直一直留在你身边。','./assets/music/WhisperBless.mp3','http://p4.music.126.net/wZ1KltU7YVTDaVxQprtUeg==/3383197279803385.jpg','cartoon',16550),

(NULL, 'SPÏKA', 'Rigel Theatre', 'Leo_', '2016-11-21','./assets/images/music_details/SPÏKA1.png',
'凯尔特风格的纯音乐听来就像在幻想的世界里骑着单车看风景，唱诗班呢喃后最后一分钟高潮让人浮想起巨龙跃起于海岸，俯瞰大陆的激昂～借用《妖精的尾巴》里一句话:妖精到底有没有尾巴呢...其实说到底连妖精是否存在都没有人能确定，正因为如此这才是永远的未知...永远的冒险！','./assets/music/SPÏKA.mp3','http://p3.music.126.net/TE36HIHL9C-4-0o4JKOLfQ==/3405187512717671.jpg','cartoon',10319),

(NULL, 'Faded', 'Alan Walker', 'HaPBoy', '2016-12-24','./assets/images/music_details/Faded1.jpg',
"You were the shadow to my light
            <br>你是我生命之光中的一道暗影
            <br>Did you feel us
            <br>你能理解我们吗
            <br>Another star
            <br>另一颗行星
            <br>You fade away
            <br>你逐渐消失
            <br>Afraid our aim is out of sight
            <br>恐惧我们的目标迷失在视野
            <br>Wanna see us
            <br>希望我们互相理解
            <br>Alive
            <br>活着
            <br>Where are you now
            <br>你身在何方?
            <br>Was it all in my fantasy
            <br>难道这一切都在我的幻想里
            <br>Where are you now
            <br>你身在何方?
            <br>Were you only imaginary
            <br>你只是虚幻的不存在吗？
            <br>Where are you now
            <br>你身在何方?
            <br>Atlantis
            <br>亚特兰蒂斯
            <br>Under the sea
            <br>在海底
            <br>Where are you now
            <br>你身在何方?
            <br>Another dream
            <br>另外的梦想
            <br>The monsters running wild inside of me
            <br>狂野的怪兽驰聘在我心深处
            <br>I'm faded
            <br>我憔悴不堪
            <br>So lost
            <br>所以迷失，憔悴不堪
            <br>I'm faded
            <br>我憔悴不堪
            <br>These shallow waters, never met
            <br>那些从未见过的水中之影",'./assets/music/Faded.mp3','http://p4.music.126.net/8dzD62VK8jLDbhEqkmpIAg==/18277181788626198.jpg','elect',13131),

(NULL, 'Sunflower', '孙培博', 'Hapon', '2016-12-21','http://ww4.sinaimg.cn/mw690/67d25024gw1fb5h8xl82bj21hc0xc4e1.jpg',
'向阳花的花语：说不出口的爱。
            <br><br>这首由孙培博创作的指弹曲的旋律走向和音符构成有一种清新感，但却蕴含了耐人寻味的悲凉和无奈，华丽的点弦又把情感推向最高处，如同她的花语一般，流动中的浓烈感情在宁静中爆发。恐怕这朵向阳花面对的不是灿烂的阳光，大概是夕阳的余晖吧。','./assets/music/Sunflower.mp3','http://p4.music.126.net/eZaiNJvjS5xdUeJsFMeM8A==/18163932091287189.jpg','guitar',15432),

(NULL, '秒速五厘米', 'Pianoking', 'Wing', '2016-11-23','./assets/images/music_details/秒速五厘米1.jpg',
'            少年时形影不离的好友贵树和明理却因明理转学、贵树随父母工作调动搬到鹿儿岛而渐渐远离。在搬家前，贵树乘坐新干线千里迢迢和明理相会，在漫长的等待后，茫茫大雪中，两人在枯萎的樱花树下深情相拥，并献出彼此的first kiss，约定着下一次再一起来看樱花。<br />
<br />
时光荏苒，两人竟再没见过，虽然在人海中一直搜寻彼此的身影，但似乎总是徒然。再后来，他们分别有了各自的生活，只是还偶尔会梦到13岁时的这段青涩而美好的感情，才明白当年怎么也说不出口的那个字就是爱。','./assets/music/秒速五厘米.mp3','http://p3.music.126.net/8N1TiSRZfMttoaQlhe-KKQ==/17832979091232041.jpg','cartoon',19181),

(NULL, '微光', 'Stefano', 'Hapon', '2016-12-21','https://cdn.herschelsupply.com/uploads/2015/07/HSC_Journal4_NightLight_02.jpg',
'            暮色茫茫的荒山野岭，
            <br>昏暗的街头巷尾……
            <br>似乎一切都忧郁的凄凉哀鸣。
            <br>
            <br>一阵微风轻拂后，
            <br>渐渐飞来柔和轻快的旋律，
            <br>在空中，在田野，在……
            <br>化作一片柔和的光，
            <br>挤进树林，
            <br>⚡爬上山岳，
            <br>潜入窗户……
            <br>给黯然沉闷的大地，
            <br>抹上了
            <br>一丝亮光
            <br>一丝微光。
            <br>
            <br>乐曲欢快明亮似微光渗入听者的心房。','./assets/music/微光.mp3','http://p3.music.126.net/juVXF3N9G2qwEry9DIXfBg==/16671894812286885.jpg','other',5656);


