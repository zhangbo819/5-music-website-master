var locationSearch = location.search.slice(1).split("&"),
    locationObj = {},
    mid = null,
    headerLiActive = null;

//获取地址栏参数的对象 locationObj
for(var obj of locationSearch){
    var arr = obj.split("=");
    locationObj[arr[0]] = arr[1];
}
mid = locationObj.mid;

$.ajax({
    url: "./assets/data/music/updateOnce.php?mid="+mid,
    success: data => {
        if(data.code==-1){ console.log("播放数更新失败!") }
    },
    error: () => { console.log("网络错误!") },
})

$.ajax({
    url: "./assets/data/music/searchMusic.php?mid="+mid,
    success: data => {
        
        var ap = new APlayer({
                element: document.getElementById('music-player'), // Optional, player element
                narrow: false,                                    // Optional, narrow style
                autoplay: true,                                   // Optional, autoplay song(s), not supported by mobile browsers
                showlrc: 0,                                       // Optional, show lrc, can be 0, 1, 2, see: ###With lrc
                mutex: true,                                      // Optional, pause other players when this player playing
                theme: '#B72712',                                 // Optional, theme color, default: #b7daff
                mode: 'circulation',                              // Optional, play mode, `random` `single` `circulation`(loop) `order`(no loop), default: `circulation`
                preload: 'metadata',                              // Optional, the way to load music, can be 'none' 'metadata' 'auto', default: 'auto'
                listmaxheight: '513px',                           // Optional, max height of play list
                music: {                                          // Required, music info
                    title: data[1],                               // Required, music title
                    author: data[2],                              // Required, music author
                    url: data[7],                                 // Required, music url
                    pic: data[8]                                  // Optional, music picture
                }
            }),
            html = "";
        
        html = `<div class="main-wrap">
                    <div class="content-box article">
                        <div class="title">
                            <h2>${data[1]} - ${data[2]}</h2>
                            <div class="info">
                                <span class="author">${data[3]}</span> /
                                <span class="date">${data[4]}</span>
                            </div>
                        </div>
                        <div class="content">
                            <p>
                                <img src=${data[5]}>
                            </p>
                            <p>
                                ${data[6]}
                            </p>
                        </div>
                    </div>
                </div>`

        $("#js-musicDetails").html(html);

        
    },
    error: () => { console.log("网络错误!") },
})

//
$(function () {
    var html = "";
  
    $.ajax({
      url: "./assets/data/music/showMusic.php",
      success: data => { 
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

