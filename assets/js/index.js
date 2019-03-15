var headerLiActive = 0;

// 轮播图
$(function () {
  var sliderData = [
    {
      title: '晴れ 时どき 雪',
      pic: './storage/slider/01.png',
      url: './music_details.html?mid=15'
    },
    {
      title: 'Flower Dance',
      pic: 'http://img.zcool.cn/community/0109575540b83d0000017c946b5535.jpg',
      url: './music_details.html?mid=6'
    },
    {
      title: 'A Little Story - Valentin',
      pic: 'http://ww2.sinaimg.cn/large/67d25024gw1fb5h1swze9j20gq0b6acf.jpg',
      url: './music_details.html?mid=18'
    },
    {
      title: '桜花抄 - 天門',
      pic: 'http://ww4.sinaimg.cn/mw690/67d25024gw1fb5hbjl32jj21hc0u01dz.jpg',
      url: './music_details.html?mid=13'
    }
  ];

  HBSlider.setConfig({
    autoPlay: true,
    delay: 5
  });
  HBSlider.setItems(sliderData);
  HBSlider.init();
  HBSlider.play();
});

//主页
$(function () {
  var html = "";


  $.ajax({
    url: "./assets/data/music/showMusic.php",
    success: data => {
      
      //热门推荐
      var RindexArr = getRandom(data.length - 1, 8);

      for (let i = 0; i < 8; i++) {
        var obj = data[RindexArr[i]];

        html += `
            <li>
                <div class="u-cover">
                  <img src=${obj[8]}>
                  <a title=${obj[1] + "-" + obj[2]} href=${"./music_details.html?mid=" + obj[0]} class="msk"></a>
                </div>
                <p class="dec">
                  <a title=${obj[1] + "-" + obj[2]} href="./music/22712173.html">${obj[1]}</a>
                </p>
                <div class="author">${obj[3]}</div>
            </li>`;
      }
      $("#js-hot").html(html);

      //分类榜单
      for (let k = 0; k < 2; k++) {
        html = "";
        for (let i = 0; i < 2; i++) {
          RindexArr = getRandom(data.length - 1, 5);
          let categoryheader = k == 0 ? (i == 0 ? "🎹 钢琴" : "🎸 吉他") : (i == 0 ? "🍡 动漫" : "⚡️ 电子");

          html += `
                <div class="category-music-list">
                  <div class="category-header">
                    ${categoryheader}
                  </div>
                  <ul>`
          for (let j = 0; j < 5; j++) {
            let obj = data[RindexArr[j]];

            html += `
                    <li class="music-list-item">
                      <div class="title">
                        <div class="title_wrap">
                          <span class="rank">${j + 1}</span>
                          <a href=${"./music_details.html?mid=" + obj[0]} title=${obj[1]} class="music-list-item-a">${obj[1]}</a>
                        </div>
                      </div>
                      <div class="info">
                        <span class="date">${obj[4].slice(5)}</span>
                        <span class="avatar">
                          <img src=${obj[8]}>
                        </span>
                      </div>
                    </li>`;
          }

          html += `</ul>
                </div>`;
        }
        k == 0 ? $("#js-cRow1").html(html) : $("#js-cRow2").html(html);
      }

      //最新单曲 热门单曲
      for (let k = 0; k < 2; k++) {
        html = "";
        RindexArr = [(k+2)*1,(k+2)*2,(k+2)*3,(k+2)*4,(k+2)*6];

        for (let i = 0; i < 5; i++) {
          let obj = data[RindexArr[i]];
          
          html += `
          <li class="artist-song">
            <div class="avatar">
              <img src=${obj[8]}>
            </div>
            <div class="info">
              <h3>${obj[1]}</h3>
              <p>${obj[3]} /
                <span>${obj[10]}</span>次播放</p>
            </div>
            <a href=${"./music_details.html?mid=" + obj[0]} title=${obj[1]} class="cover-link"></a>
          </li>
        `
        }

        k == 0 ? $("#js-zuixin").html(html) : $("#js-remen").html(html);
      }

    },
    error: () => { console.log("网络错误!") },
  })



})



function getRandom(len, c) {
  let arr = [],
    obj = {};

  for (let i = 0; true; i++) {
    let Rindex = Math.ceil(Math.random() * len);

    if (!obj[Rindex]) {
      arr.push(Rindex);
      obj[Rindex] = true;
      if (arr.length == c) break;
    }
  }

  return arr
}