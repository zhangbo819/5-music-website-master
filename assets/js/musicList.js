headerLiActive = null;
var PNO = 1,
    PSIZE = 19,
    locationSearch = location.search.slice(1).split("&"),
    locationObj = {};

function loadProductByPage(pno, pageSize,kw=undefined) {
    PNO = pno;
    let isKw = true;

    if(kw===undefined){
        //获取地址栏参数的对象 locationObj
        for (var obj of locationSearch) {
            var arr = obj.split("=");
            locationObj[arr[0]] = arr[1];
        }
        kw = locationObj.kw;
        isKw = false;
    }
    
    kw = kw===undefined?"":kw;
    $.ajax({
        url: "./assets/data/musicList/music_list.php?kw="+kw,
        data: { pno: pno, pageSize: pageSize},
        success: data => {console.log(data)
            let html = "",
                i = 0;

            $("#js-count").html(" " + data.recordCount + " ")

            for (let obj of data.data) {
                
                html += i % 2 == 0 ? `<div class="item">` : `<div class="item even">`;
                html += `
                        <a href=${"./music_details.html?mid=" + obj.mid}></a>
                        <span>《${obj.mname}》</span>
                        <span>${obj.author}</span>
                        <span>${obj.author2}</span>
                        <span>${obj.playCount + "次"}</span>
                    </div>
                `;
                i++;
            }

            $("#js-musicList").html(html)

            html = "";
            PNO = data.pno;
            PSIZE = data.pageSize;

            html += PNO == 1 ? `<a href="" class="firBtn disable">上一页</a>` : `<a href="" class="firBtn">上一页</a>`;
            if (PNO - 2 > 0) html += `<a href="" class="numBtn">${PNO - 2}</a>`;
            if (PNO - 1 > 0) html += `<a href="" class="numBtn">${PNO - 1}</a>`;
            html += `<a href="" class="numBtn act">${PNO}</a>`;
            if (PNO + 1 <= data.pageCount) html += `<a href="" class="numBtn">${PNO + 1}</a>`;
            if (PNO + 2 <= data.pageCount) html += `<a href="" class="numBtn">${PNO + 2}</a>`;
            html += PNO == data.pageCount ? `<a href="" class="lastBtn disable">下一页</a>` : `<a href="" class="lastBtn">下一页</a>`;

            $("#js-yema").html(html);

            //搜索框
            if(kw){
                $('#js-msInput').val(decodeURI(kw))
            }

            $("#js-kwSpan").html(isKw?kw:decodeURI(kw))
            
        },
        error: () => { console.log("网络错误") },
    })
}

loadProductByPage(PNO, PSIZE)

//为 页码 绑定跳转事件
$("#js-yema").on("click", "a", function (e) {
    //阻止a的自动跳转
    e.preventDefault();
    let pno,
        active = $("#js-yema .act"),
        isJump = true;

    if ($(this).html() == "上一页") {
        if (active.prev().html() == "上一页")
            isJump = false;
        else
            pno = active.prev().html();
    }
    else if ($(this).html() == "下一页") {
        if (active.next().html() == "下一页")
            isJump = false;
        else
            pno = active.next().html();
    }
    else {
        active.html() == $(this).html() ? isJump = false : pno = $(this).html();
    }

    isJump ? loadProductByPage(pno, PSIZE) : "";
});

$("#js-msSearchBtn").click(function(e){
    $("#js-searchInput").val("");
    loadProductByPage(PNO, PSIZE,$("#js-msInput").val())
})
$("#js-msSearchBtn").keyup(function(e){
    if(e.keyCode==13)
    {
		$("#js-searchInput").val("");
		loadProductByPage(PNO, PSIZE,$("#js-msInput").val())
    }
});