## GET /api/v1/youtube/search
Returns a search results.

### Example

#### Request
```
GET /api/v1/youtube/search?keyword=キーワード HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: 97:yknJi1CEtAJ6yB64NAsZ
Content-Length: 0
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 10604
Content-Type: application/json; charset=utf-8
ETag: W/"c7ae111442ce066fdd1cd96454dbf96e"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 2441e267-ed3c-4515-a23c-1152c0d84386
X-Runtime: 0.648509
X-XSS-Protection: 1; mode=block

{
  "next_page_token": "CAoQAA",
  "prev_page_token": null,
  "total_results": 34732,
  "results_per_page": 10,
  "items": [
    {
      "youtube_video_id": "OA47BDAsVP8",
      "title": "ベベチオ / キーワード",
      "channel_title": "hiplandmusic",
      "thumbnail_url": "https://i.ytimg.com/vi/OA47BDAsVP8/mqdefault.jpg",
      "description": "ベベチオ、4/27にリリースとなる3年ぶりの新作『リビングのデカダンス』より、\r\nリードトラック「キーワード」のMUSIC VIDEOです。\r\nFM 802 /4月度へビーローテション獲得！\r\n\r\nベベチオ OFFICIAL HP\r\nhttp://www.bebechio.com/",
      "view_count": 81333,
      "duration": "4:05",
      "published": "2011/03/09"
    },
    {
      "youtube_video_id": "ejawRqOtpFc",
      "title": "※永久保存版※狙ったキーワードで上位表示させる為に必要な観点",
      "channel_title": "道産子アフィリエイタークロレラ",
      "thumbnail_url": "https://i.ytimg.com/vi/ejawRqOtpFc/mqdefault.jpg",
      "description": "↓道産子アフィリエイタークロレラの公式サイトはこちら\nhttp://goo.gl/FzKnfh\n\n↓月収１００万円を応援するメルマガはこちら\nhttps://goo.gl/m6Ab5D",
      "view_count": 11531,
      "duration": "9:14",
      "published": "2017/01/19"
    },
    {
      "youtube_video_id": "ja_F5j-VJG0",
      "title": "〈日本語字幕〉BoA&キー(SHINee) - Ep.79 キーワードBoA終わりに向かって...①",
      "channel_title": "JR n__nO6km",
      "thumbnail_url": "https://i.ytimg.com/vi/ja_F5j-VJG0/mqdefault.jpg",
      "description": "",
      "view_count": 20225,
      "duration": "4:11",
      "published": "2018/03/21"
    },
    {
      "youtube_video_id": "2Yu8j6Wx4cY",
      "title": "稼げるサイト作りで役立つキーワードの極意とは！？",
      "channel_title": "ヒーローゆうき",
      "thumbnail_url": "https://i.ytimg.com/vi/2Yu8j6Wx4cY/mqdefault.jpg",
      "description": "チャンネル登録はこちら\nhttps://www.youtube.com/channel/UC-Z1TD10QN9CBtcyVYBkjSA\n\n\nアフィリエイトで稼ぐためのキーワードの極意を解説しました。\n\nアフィリエイトで報酬を得るためには、キーワードがとても大事です。\n\n訪問者がいったいどんなことを知りたがっているのか？\n\nここをしっかり理解しておかないと、稼げるサイトは作れません。\n\n関連キーワード取得ツールなどを利用して、\nどんなキーワードを選べばいいのかを調べてみましょう。\n\n\n■━■━■━■━■━■━■━■━■━■━■━■\n\nみんなのヒーローゆうきのオフィシャルサイト\nhttp://heroyuuki.com/\n\nアフィリエイトで稼ぐ方法を包み隠さず大公開中！！\n\n\n～プロフィール～\n\nみんなのヒーローゆうき\n\n1974年2月4日生まれ　水瓶座のO型\n\n\n20代の頃はBANDでギターボーカルを担当\n\nフリーターをやりながら、\nライブハウスや路上ライブなどを敢行\n\n30代の頃に一度だけまともに会社に就職するが\nこのまま一生終えるのかと思うと耐えられずに逃亡\n\n2011年からネットビジネスの世界を知って参入\n\n現在はアフィリエイトで生計を立てながら、\n湘南のガレージハウスで自由気ままな生活をエンジョイ中\n\n\n▼詳しいプロフィールはこちら\nhttp://profile.ameba.jp/superheroyuuki/\n\n\n\n★みんなのヒーローゆうきのFacebook\nhttps://www.facebook.com/profile.php?id=100004302460786\n\n\n★みんなのヒーローゆうきのTwitter\nhttps://twitter.com/heroyuukicats\n\n\n★みんなのヒーローゆうきのアメブロ\nhttp://ameblo.jp/superheroyuuki/\n\n\n\nみんなのヒーローゆうきの動画ブローカーチャンネル\nhttp://heroyuuki.net/\n\n気になる商品を動画でレビューしています！\n\n■━■━■━■━■━■━■━■━■━■━■━■\n\n\nみんなのヒーローゆうきへのお問い合わせはこちら\nhttp://heroyuuki.com/?page_id=2\n\nアフィリエイトに関しての質問事項なども受け付けています。\n\nお気軽にメッセージくださいね♪\n(・∀・)/",
      "view_count": 4675,
      "duration": "10:18",
      "published": "2016/01/03"
    },
    {
      "youtube_video_id": "RybglSMD27Q",
      "title": "アフィ中S1#5『キーワードの考え方』",
      "channel_title": "アフィリエイト中学校",
      "thumbnail_url": "https://i.ytimg.com/vi/RybglSMD27Q/mqdefault.jpg",
      "description": "アフィリエイト中学校にたくや先生の代わりに「この街」先生がやってきた！アフィリエイトのキーワードの考え方について説明してくれます！\n\n◆◇◆ついに！アフィ中がLINEはじめました！！◆◇◆\n\n皆さん、是非友達になりましょう。\n\n【LINE友達追加URL】\nhttps://line.me/R/ti/p/%40qhd5479c\n\n友達登録お待ちしています＾＾\n\n◆◇◆ チャンネル登録 ◆◇◆\n\n【アフィリエイト中学校】チャンネル登録はコチラ\nhttps://www.youtube.com/channel/UCmOegrxAj6uzaw5c5uM7rjA?sub_confirmation=1&src_vid=2oHkLffLYuk&feature=iv&annotation_id=annotation_1397360565\n\n\n\n===== アフィリエイト中学校の動画一覧 =====\n\n【ブログアフィリエイト編】\n無料ブログを使って、アフィリエイトをはじめよう！ アフィリエイトの基礎が満載のコンテンツ。初心者必見！\nhttps://www.youtube.com/playlist?list=PLstagH_Zz9-jocjHyM9oZMS-JD3G2_22V\n\n\n【キーワード編】\n稼げるキーワードの基本的な考え方から、ズラシた一般キーワードのひねり方まで、具体的な手法を大公開！ \nhttps://www.youtube.com/watch?v=RybglSMD27Q\n\n\n【ワードプレス編】\n無料のワードプレスを使って、本格的なアフィリエイトサイトを作成。0からはじめて3ヶ月で5万円稼げるか！？\nhttps://www.youtube.com/playlist?list=PLstagH_Zz9-h3OL3Fjx0uTzis-vkLDeNB",
      "view_count": 13783,
      "duration": "17:14",
      "published": "2016/03/17"
    },
    {
      "youtube_video_id": "zGuf__SbyAU",
      "title": "【ゆっくり実況】検索してはいけないキーワード講座　第1講目",
      "channel_title": "Hamu Majik",
      "thumbnail_url": "https://i.ytimg.com/vi/zGuf__SbyAU/mqdefault.jpg",
      "description": "今回は霊夢と魔理沙が私の為に救済の収録をしてくれました！！\n検索してはいけないのリクエストをちょっとだけ消化してくれるそうなので、助かりますｗ\nしかし、リクエストを締め切ったわけではないので、これからもよろしくお願いします。\n次は生声実況のhamuのビビり修行です。\n【キーワード】\nペニーワイズ\n喉ナイフ\nカールマイヤー\nトミノの地獄\n顔バク\nねこじる\n本編→https://www.youtube.com/watch?v=sR7ZEZMpFZQ&list=PLpE5zjy3CHsDByvrKY3iX7AwOO5eJEpe2\n\nチャンネル登録→https://www.youtube.com/channel/UCXQHTwQNTvDjna-ZUt1HekA\n\nツイッター→https://twitter.com/hamumajik\n\n次の動画→ https://youtu.be/Wf4u16z7f5Y",
      "view_count": 1662039,
      "duration": "17:04",
      "published": "2015/11/02"
    },
    {
      "youtube_video_id": "nJDlSyEFM1o",
      "title": "嫌でも上位独占！キーワード選定のコツと必勝法",
      "channel_title": "yamaguchi",
      "thumbnail_url": "https://i.ytimg.com/vi/nJDlSyEFM1o/mqdefault.jpg",
      "description": "◆ブログ記事→http://kntym.com/archives/3394.html\n\n〜テーマ〜\n必勝法,ネタ,ネタ探し,記事,タイトル,決め方,検索需要,検索される,トレンド,爆発,探し方,スマホ,動画,検索順位,検索上位,キーワード選定,キーワード,被リンク,バックリンク,コンテンツSEO,滞在時間,google,おすすめ,ブログ,稼ぐ,無料,SEO,書き方,集客,作り方,アフィリエイト,収入,アクセス,アクセスアップ,ワードプレス,ビジネス,成功,文章,文章の書き方,文章作成,文章術,コツ,トレーニング,講座,教室,上手い,サイト,基本\n\n\n〜関連動画〜\nトレンドアフィリエイトのキーワード選定\n→https://youtu.be/wezNIEPZ1go\n\n\n◆その他メディア◆\nメルマガ登録：http://bit.ly/1FzIfi7\n\nブログ：http://kntym.com/\n\nTwitter：https://twitter.com/kntym22\n\n\nBGM © Music is VFR様",
      "view_count": 3783,
      "duration": "11:47",
      "published": "2015/05/07"
    },
    {
      "youtube_video_id": "SUSFBrkhJ3M",
      "title": "キーワードプランナーで検索ボリュームが月間１０～１００でも記事を書くべき理由",
      "channel_title": "たろおチャンネル",
      "thumbnail_url": "https://i.ytimg.com/vi/SUSFBrkhJ3M/mqdefault.jpg",
      "description": "キーワードプランナーの検索ボリューム解説です。\n■電子書籍『新時代SEOライティング術』期間限定プレゼント中！\n→http://tarosan01.com/lp/densidw/\n\n■チャンネル登録すると、関連情報を手に入れることができます。\n→https://goo.gl/ZGFv3t\n\n【運営者情報】\n公式ブログ：http://tarosan01.com/\n\nWebライティングのコツ、ブログの作り方、在宅ワークの方法、などをお伝えしています。\n\n【プロフィール】\n小川善太郎（ハンドルネーム「たろお」）\nコピーライター＆Webメディアプロデューサーとして活動中。\nスモールビジネスを立ち上げる塾を主催し、結果を出す考え方を重視している。\n詳しいプロフィールはこちら\n→http://tarosan01.com/profile/",
      "view_count": 1865,
      "duration": "9:17",
      "published": "2017/05/31"
    },
    {
      "youtube_video_id": "WzxaMjJ2n5g",
      "title": "稼ぐキーワードを たった１時間で １４２個 見つける思考法(その１)",
      "channel_title": "Yoshinari Takashima",
      "thumbnail_url": "https://i.ytimg.com/vi/WzxaMjJ2n5g/mqdefault.jpg",
      "description": "■キーワードの選び方【無料】無料講座→　https://enjoylife801.com/keysentei/\n稼ぐキーワードを たった１時間で １４２個 見つける思考法は、ロングテールＳＥＯはもちろん、ＰＰＣ広告でも威力を発揮します！",
      "view_count": 1842,
      "duration": "6:33",
      "published": "2015/11/11"
    },
    {
      "youtube_video_id": "NS2ybN3nipg",
      "title": "キーワードから考えてブログを書いてみよう",
      "channel_title": "宇田和志",
      "thumbnail_url": "https://i.ytimg.com/vi/NS2ybN3nipg/mqdefault.jpg",
      "description": "まず最初にキーワードを考えてみる。そしてそのキーワードにマッチした記事を書く。これが読者にとって有益なブログを書くテクニックの1つです。\nhttp://faec.dollsent.jp/blog/",
      "view_count": 4122,
      "duration": "7:34",
      "published": "2014/05/25"
    }
  ]
}
```

## GET /api/v1/youtube/search
Returns a search results.

### Example

#### Request
```
GET /api/v1/youtube/search?keyword=キーワード&page_token=CAoQAA HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: 99:Vsm-wzxaon4wcU4QNBZt
Content-Length: 0
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 12501
Content-Type: application/json; charset=utf-8
ETag: W/"14da1e95e983648910552379f237cd71"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 7abb691a-cc1b-4bb1-93f1-d887997d83a2
X-Runtime: 0.717014
X-XSS-Protection: 1; mode=block

{
  "next_page_token": "CBQQAA",
  "prev_page_token": "CAoQAQ",
  "total_results": 34736,
  "results_per_page": 10,
  "items": [
    {
      "youtube_video_id": "lRmhVKfIJMY",
      "title": "COMPASSでお宝キーワード(ブルーオーシャンキーワード)の見つけ方＆豪華特典付き動画",
      "channel_title": "channel taka",
      "thumbnail_url": "https://i.ytimg.com/vi/lRmhVKfIJMY/mqdefault.jpg",
      "description": "キーワード選定に物凄く時間をかけている方へ\n効率化を図るためにもCOMPASSはアフィリエイトやっている方なら\n絶対必須なSEO分析ツールですね(｀・∀・´)v\n\n\nインターネットにはクッキーと呼ばれる機能がありまして\nこれが有効になっていないと特典を受け取ることが出来ませんので\n注意してください。\n\nご購入の際に、「たか(taka)からの豪華特典」の記載が確認\nできましたらそのままご購入にお進み下さい。\n\n商品ダウンロードページ内で特典案内のテキストを\nダウンロード頂けます。\n\nそちらの特典案内テキスト内の指示に従い特典請求を行って\n頂けますよう宜しくお願い致します。\n\n\nCOMPASS販売ページ\n⇒ http://pctaka777.com/t/vrdgjdx\n\nクッキー確認はこちらから\n⇒ http://tokuten.kasegoo.info/cookie/\n\nご連絡フォームはこちら\n⇒ http://my.formman.com/form/pc/mJzFyCAbDqipmyM5/\n\n------------------------------------------------------------------------------\n\nよろしかったらこちらも\nチャンネル登録お願いします！ヽ(´▽｀)\n\nTaka Games\n⇒ https://www.youtube.com/channel/UClVp1egjJ0-UqtBuu33i01g/\n\n\nたか(taka)公式ブログはこちら\n⇒ http://pctaka777.com/\n\n\nブログ、転売、YouTubeで稼ぐためのメルマガ配信しております。\n無料登録で便利ツールプレゼント中！\n※メルマガ解除はいつでもできます。\n⇒ http://pctaka777.com/takamerumaga/\n\n\nTwitter フォローよろしくお願いします。\n⇒ https://twitter.com/trainn777\n\n\n【おすすめ商品】\nボタン一つ押せばリサーチツールがおもしろいように\n実際に売れている売れ筋商品だけをピックアップ！\n豪華特典付き！\n⇒ http://pctaka777.com/review/buymaster/\n\n\n稼いでいるアフィリエイターさん は皆、持っている\nそれ位必須の最強・ 高機能デザインツール！\nSIRIUS(シリウス) 豪華特典付きサイトはこちら\n⇒ http://pctaka777.com/review/sirius/",
      "view_count": 316,
      "duration": "10:40",
      "published": "2017/09/09"
    },
    {
      "youtube_video_id": "8hHe1g7huSE",
      "title": "アフィリエイトでライバルサイト不在のキーワードを見つける「ずらし」の方法！実践解説",
      "channel_title": "龍市",
      "thumbnail_url": "https://i.ytimg.com/vi/8hHe1g7huSE/mqdefault.jpg",
      "description": "チャンネル登録はコチラから⇒http://bit.ly/2fy0Hw7\n龍市のブログはコチラから⇒http://ryu-blo.jp/\n無料メルマガ登録はコチラ⇒https://my24p.com/p/r/B3XFh90F\n\n龍市（しゃべってる人）のチャンネル登録 & 公式ブログは\n上記リンクからお願いします！\n\n\n動画を気に入ってもらえた場合は\nぜひ、チャンネル登録して頂けるとうれしいです(^^)\n\n◆関連ブログ記事\nアフィリエイトのキーワードずらし！簡単にずらすコツは発想術に？\nhttp://ryu-blo.jp/writing/1341/\n\n◆関連動画\nアフィリエイト記事のタイトルの2種類の作り方や考え方！魅力的なタイトルの付け方も！\nhttps://youtu.be/dxSMEvFG6rk\n\n【初心者必見】アフィリエイトの記事タイトル！文字数やキーワードの種類を完全ガイド！\nhttps://youtu.be/JSLa8k4rt7M\n\nタイトルのメインキーワードネタとは？SEOに効果的な探し方やライバルを出し抜くコツも\nhttps://youtu.be/ReiVVqEzotM\n\n関連キーワードとは？意味や探し方を実況解説！検索数で入れる順番や個数が決まる？\nhttps://youtu.be/Y0kQDn79boE\n\nアフィリエイトのライバルチェック4項目！初心者でも簡単にできる裏技も無料で暴露！\nhttps://youtu.be/muPmjOXqWkc\n\n【動画説明】\nライバル不在・少ないキーワードやネタを見つけるためには\n「ずらし」のテクニックが必須になってきます。\n\n\nこれは、インターネットビジネスの世界では\n皆が声を挙げていることですが、\n肝心のその「ずらし方」についてまで言及している人は\n殆ど見られないように思います。\n\n\nそこで、今回の動画では\n具体的にどのように「ずらし」を行うのかを動画にまとめました。\n\n初心者の方にもおすすめな動画となっていますので、\nぜひ、この動画をみてあなたのブログ運営に活かしていってください。",
      "view_count": 363,
      "duration": "6:28",
      "published": "2017/06/25"
    },
    {
      "youtube_video_id": "1Vqs1hmcUUs",
      "title": "エコノミスト・森田龍二の「経済・会計キーワード解説」 第3回　～G20～",
      "channel_title": "【資格の総合スクール】LEC東京リーガルマインド",
      "thumbnail_url": "https://i.ytimg.com/vi/1Vqs1hmcUUs/mqdefault.jpg",
      "description": "森田龍二LEC専任講師が、経済・会計の領域からキーワードをピックアップして解説していきます。\n不動産鑑定士など資格試験の受験生、就職活動中の大学生、経済や会計に興味がある方にお勧め！\n月1回程度の更新を予定しています。\n「森田龍二の経済・会計解説部屋」特設ページはこちら\nhttp://www.lec-jp.com/kanteishi/info/morita_jiji/\n各種ガイダンスや初回講義をご覧になりたい方は「WEB公開講座」\nhttp://www.lec-jp.com/kanteishi/guidance/index_web.html\nLEC不動産鑑定士サイト\nhttp://www.lec-jp.com/kanteishi/",
      "view_count": 125,
      "duration": "24:46",
      "published": "2018/03/29"
    },
    {
      "youtube_video_id": "7LTda4-SIa4",
      "title": "キーワード（ベベチオ カバー）　弾き語り",
      "channel_title": "エキスイチョウの葉",
      "thumbnail_url": "https://i.ytimg.com/vi/7LTda4-SIa4/mqdefault.jpg",
      "description": "Capo.1\nベベチオはもっと評価されるべき！！",
      "view_count": 442,
      "duration": "5:05",
      "published": "2014/10/05"
    },
    {
      "youtube_video_id": "GVs8iLa0RiQ",
      "title": "アフィ中S1#6『ライバルの少ないキーワードの探し方』",
      "channel_title": "アフィリエイト中学校",
      "thumbnail_url": "https://i.ytimg.com/vi/GVs8iLa0RiQ/mqdefault.jpg",
      "description": "今回も引き続きキーワードについてこの街先生が教えてくれます。前回より深掘りした「ライバルの少ないキーワード」というテーマでより勉強になる回になっています！全アフィリエイター必見です！\n\n\n◆◇◆ついに！アフィ中がLINEはじめました！！◆◇◆\n\n皆さん、是非友達になりましょう。\n\n【LINE友達追加URL】\nhttps://line.me/R/ti/p/%40qhd5479c\n\n友達登録お待ちしています＾＾\n\n◆◇◆ チャンネル登録 ◆◇◆\n\n【アフィリエイト中学校】チャンネル登録はコチラ\nhttps://www.youtube.com/channel/UCmOegrxAj6uzaw5c5uM7rjA?sub_confirmation=1&src_vid=2oHkLffLYuk&feature=iv&annotation_id=annotation_1397360565\n\n\n===== アフィリエイト中学校の動画一覧 =====\n\n【ブログアフィリエイト編】\n無料ブログを使って、アフィリエイトをはじめよう！ アフィリエイトの基礎が満載のコンテンツ。初心者必見！\nhttps://www.youtube.com/playlist?list=PLstagH_Zz9-jocjHyM9oZMS-JD3G2_22V\n\n\n【キーワード編】\n稼げるキーワードの基本的な考え方から、ズラシた一般キーワードのひねり方まで、具体的な手法を大公開！ \nhttps://www.youtube.com/watch?v=RybglSMD27Q\n\n\n【ワードプレス編】\n無料のワードプレスを使って、本格的なアフィリエイトサイトを作成。0からはじめて3ヶ月で5万円稼げるか！？\nhttps://www.youtube.com/playlist?list=PLstagH_Zz9-h3OL3Fjx0uTzis-vkLDeNB",
      "view_count": 14758,
      "duration": "16:03",
      "published": "2016/03/26"
    },
    {
      "youtube_video_id": "SB8CIJfWGzs",
      "title": "キーワード選定によるSEO対策まとめ！検索エンジンにアピールするタイトルを極めよう！",
      "channel_title": "渚ひろし＠自由ライター",
      "thumbnail_url": "https://i.ytimg.com/vi/SB8CIJfWGzs/mqdefault.jpg",
      "description": "ブログとメルマガもよろしくお願いします！＾＾\nワードプレスブログ：http://nagihiro.com/\nメルマガ：http://nagihiro.com/nh55/level/\n\n\n動画を気に入ってもらえた場合は\nぜひチャンネル登録して頂けるとうれしいです。\n\nチャンネル登録はこちら！\n⇒ http://www.youtube.com/user/NAGISA62?sub_confirmation=1",
      "view_count": 5658,
      "duration": "15:19",
      "published": "2014/02/20"
    },
    {
      "youtube_video_id": "1lGkpi67Z94",
      "title": "Googleキーワードプランナーの使い方！検索ボリューム&関連キーワードを調べよう！",
      "channel_title": "渚ひろし＠自由ライター",
      "thumbnail_url": "https://i.ytimg.com/vi/1lGkpi67Z94/mqdefault.jpg",
      "description": "渚ひろし（しゃべってる人）のブログ & 公式メルマガはこちら！\nブログ：http://nagihiro.com/\nメルマガ：http://nagihiro.com/nh55/youtool/\n\n\nキーワードプランナーのログイン画面はこちら\n→ https://adwords.google.co.jp/KeywordPlanner\n\n\n\n動画を気に入ってもらえた場合は\nぜひ、チャンネル登録して頂けるとうれしいです＾＾\n\nチャンネル登録はこちらから！\n⇒ http://www.youtube.com/user/NAGISA62?sub_confirmation=1",
      "view_count": 5393,
      "duration": "10:01",
      "published": "2014/06/25"
    },
    {
      "youtube_video_id": "R1cuHyCF09M",
      "title": "成功のキーワードはセルフイメージにあった！聞くだけで成功脳へ「成功へのサプリ」",
      "channel_title": "Takeshi Yonaha",
      "thumbnail_url": "https://i.ytimg.com/vi/R1cuHyCF09M/mqdefault.jpg",
      "description": "あなたが、成功しないのは、セルフイメージが低いからです。\n聞くだけでセルフイメージを高めます。\nこの音声は、あなたが幸せの成功者となるために録音されました。\n1日１０分、ただ聞き流すだけで90日後にはあなたは自信に満ち、積極的な人間になることができます。\nあなたがリラックスした時、出来れば夜寝る前か朝起きた時にお聴きください。\nこの音声をより効果的に活用するのであれば朝と夜の２回この音声をお聴きください。",
      "view_count": 159301,
      "duration": "11:00",
      "published": "2014/05/06"
    },
    {
      "youtube_video_id": "iaoOHE1BiWM",
      "title": "YouTube人気キーワードのリサーチ方法",
      "channel_title": "YouTube動画集客.com",
      "thumbnail_url": "https://i.ytimg.com/vi/iaoOHE1BiWM/mqdefault.jpg",
      "description": "サラリーマンであることに限界を感じている方へ\nhttp://vancool.biz/l/c/O0SQL1OV/RyjWwNxK\n\n\nYouTube人気キーワードのリサーチ方法\n\n\nキーワードツール\nhttp://keywordtool.io/youtube\n\n\n関連動画\n\n人気動画と人気チャンネルのリサーチ方 \nhttps://youtu.be/biCj1tZKvxg\n\nキーワードリサーチ キーワードの需要を確認しよう\nhttps://youtu.be/5cskgQBWUCM\n\n【SEO基礎01】キーワードリサーチ【関連キーワード取得ツールとGoogleキーワードプランナーを使ってマインドマップで整理する方法】 \nhttps://youtu.be/fKMS0AhC1Cc\n\n4-1. YouTube人気動画リサーチ方法(キーワード編) \nhttps://youtu.be/mJ34XFtG2Ic\n\n5-1. YouTube人気動画リサーチ方法(芋づる式) \nhttps://youtu.be/UteWs1NcQg4",
      "view_count": 1449,
      "duration": "10:25",
      "published": "2017/02/03"
    },
    {
      "youtube_video_id": "bBdnUIOz_Do",
      "title": "キーワードプランナーの使い方",
      "channel_title": "メディサポチャンネル SEO集客コンサル",
      "thumbnail_url": "https://i.ytimg.com/vi/bBdnUIOz_Do/mqdefault.jpg",
      "description": "Google　キーワードプランナーの簡単な説明\n\nhttp://okayama-mediasupport.com/seo/archives/392",
      "view_count": 290,
      "duration": "5:58",
      "published": "2017/01/12"
    }
  ]
}
```

## GET /api/v1/youtube/video
Returns a video.

### Example

#### Request
```
GET /api/v1/youtube/video?id=PqJNc9KVIZE HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: 101:6uisH3J5sLHUQpAS8sUn
Content-Length: 0
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 3750
Content-Type: application/json; charset=utf-8
ETag: W/"5b5f0f1694d32f7361b66c6e53af217a"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: c09cae38-2813-417a-80ae-28d493617e4a
X-Runtime: 0.192022
X-XSS-Protection: 1; mode=block

{
  "youtube_video_id": "PqJNc9KVIZE",
  "title": "livetune feat. 初音ミク 『Tell Your World』Music Video",
  "channel_title": "kzlivetune",
  "thumbnail_url": "https://i.ytimg.com/vi/PqJNc9KVIZE/mqdefault.jpg",
  "description": "Music Video Director : wakamuraP x fantasista utamaro x TAKCOM\n\n※このMusic Videoを鑑賞する際は、部屋を十分に明るくし画面から離れてご覧下さい。\n※When you watch the Music Clip, Please see the screen bright enough away from the room.\n\nlivetune feat. 初音ミク Tell Your World EP リリース記念限定アイテム\n販売中!! → http://toys-hop.com/\n\nlivetune feat. 初音ミク \"Tell Your World\" （サイン入り）等身大パネルが当たる!! → http://dot-and-line.com/\n\nGoogle Chrome \"あなたのウェブを、はじめよう。\"　CMソング\n\nTell Your World／livetune feat. 初音ミク\n作詞・作曲・編曲：kz\n\n形のない気持ち忘れないように\n決まりきったレイアウトを消した\nふと口ずさんだフレーズを掴まえて\n胸に秘めた言葉乗せ空に解き放つの\n\n君に伝えたいことが\n君に届けたいことが\nたくさんの点は線になって\n遠く彼方へと響く\n君に伝えたい言葉\n君に届けたい音が\nいくつもの線は円になって\n全て繋げてく　どこにだって\n\n真っ白に澄んだ光は君のよう\nかざした手の隙間を伝う声が\nふと動いた指先刻むリズムに\nありったけの言葉乗せ空に解き放つの\n\n君に伝えたいことが\n君に届けたいことが\nたくさんの点は線になって\n\n遠く彼方まで穿(うが)つ \n君に伝えたい言葉\n君に届けたい音が\nいくつもの線は円になって\n全て繋げてく　どこにだって\n\n奏でていた  変わらない日々を疑わずに\n朝は誰かがくれるものだと思ってた\n一瞬でも信じた音　景色を揺らすの\n教えてよ　君だけの世界\n\n君が伝えたいことは\n君が届けたいことは\nたくさんの点は線になって\n遠く彼方へと響く\n君が伝えたい言葉\n君が届けたい音は\nいくつもの線は円になって\n全て繋げてく　どこにだって\n\nTell Your World / livetune feat. Hatsune Miku\nLyrics, Music, Arrangement: kz\n\nNot to forget the intangible feelings\nI deleted the routine layout\nGrasp the phrase I happened to be humming\nSpread secret words of the heart into the sky\n\nI want to tell you\nI want to give you\nNodes of feelings form a link\nEchoing to the faraway distance\nWords I want to tell you\nSounds I want to give you\nLinks of feelings form a world\nConnecting everything   Connecting to everywhere\n\nThe pure white light feels like you\nThe voice flows through my hand held against the light\nOn the rhythm my fingertips suddenly make\nSpread all words of the heart into the sky\n\nI want to tell you\nI want to give you\nNodes of feelings form a link\nReaching over the faraway distance\nWords I want to tell you\nSounds I want to give you\nLinks of feelings form a world\nConnecting everything   Connecting to everywhere\n\nI had been playing the tune without a doubt about the rhythm of my days\nI had thought the coming of mornings is a given\nThe sounds I believe in even for a second, shift my sceneries\nTell your world\n\nYou want to tell\nYou want to give\nNodes of feelings form a link\nEchoing to the faraway distance\nWords you want to tell\nSounds you want to give\nLinks of feelings form a world\nConnecting everything   Connecting to everywhere\n\n\n(C) Crypton Future Media, Inc. crypton.net\n(C) FANTASISTAUTAMARO ALL RIGHTS RESERVED.",
  "view_count": 16776161,
  "duration": "4:33",
  "published": "2012/03/12"
}
```
