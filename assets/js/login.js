// 加载footer
$("#footer").load('./footer.html');

/**用户名和密码的非空验证**/
$("#uname").blur(function () {
  if (!this.value) {
    $("#showResult").text("用户名不能为空！");
    $("#showResult").css("color", "red");
    return false;
  }
});
$("#upwd").blur(function () {
  if (!this.value) {
    $("#showResult").text("密码不能为空！");
    $("#showResult").css("color", "red");
    return false;
  }
});

/**登录单击按钮事件监听**/
$('#bt-login').click(function () {
  var data = $('#form-login').serialize();
  $.ajax({
    type: 'POST',
    url: './assets/data/user/login.php',
    data: data,
    success:  (result)=> {
      if (result.code === 200) {              //登录成功
        var pageToJump = result.pageToJump?result.pageToJump:'index.html';
        location.href = pageToJump;
      } else if (result.code === 201) {       //登录失败
        alertMsg('<b>登录失败！</b><p>用户名或密码输入有误。</p>');
      } else {
        alertMsg('<b>登录失败！</b><p>原因：' + result.msg + '</p>');
      }
    }
  });
});


/***7天之内不再登录***/
$(document).ready(function () {
  if ($.cookie("rmbUser") == "true") {
    $("#ck_rmbUser").attr("checked", true);
    $("#username").val($.cookie("username"));
    $("#password").val($.cookie("password"));
  }
});
//记住用户名密码
function save() {
  if ($("#ck_rmbUser").attr("checked")) {
    var str_username = $("#username").val();
    console.log(str_username);
    var str_password = $("#password").val();
    $.cookie("rmbUser", "true", {expires: 7}); //存储一个带7天期限的cookie
    $.cookie("username", str_username, {expires: 7});
    $.cookie("password", str_password, {expires: 7});
  }
  else {
    $.cookie("rmbUser", "false", {expire: -1});
    $.cookie("username", "", {expires: -1});
    $.cookie("password", "", {expires: -1});
  }
}

//mode为空，即只有一个确认按钮，mode为1时有确认和取消两个按钮
function alertMsg(msg, mode) {
  msg = msg || '';
  mode = mode || 0;
  var top = document.body.scrollTop || document.documentElement.scrollTop;
  var isIe = (document.all) ? true : false;
  var isIE6 = isIe && !window.XMLHttpRequest;
  var sTop = document.documentElement.scrollTop || document.body.scrollTop;
  var sLeft = document.documentElement.scrollLeft || document.body.scrollLeft;
  var winSize = function(){
      var xScroll, yScroll, windowWidth, windowHeight, pageWidth, pageHeight;
      // innerHeight获取的是可视窗口的高度，IE不支持此属性
      if (window.innerHeight && window.scrollMaxY) {
          xScroll = document.body.scrollWidth;
          yScroll = window.innerHeight + window.scrollMaxY;
      } else if (document.body.scrollHeight > document.body.offsetHeight) { // all but Explorer Mac
          xScroll = document.body.scrollWidth;
          yScroll = document.body.scrollHeight;
      } else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari
          xScroll = document.body.offsetWidth;
          yScroll = document.body.offsetHeight;
      }

      if (self.innerHeight) {    // all except Explorer
          windowWidth = self.innerWidth;
          windowHeight = self.innerHeight;
      } else if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode
          windowWidth = document.documentElement.clientWidth;
          windowHeight = document.documentElement.clientHeight;
      } else if (document.body) { // other Explorers
          windowWidth = document.body.clientWidth;
          windowHeight = document.body.clientHeight;
      }

      // for small pages with total height less then height of the viewport
      if (yScroll < windowHeight) {
          pageHeight = windowHeight;
      } else {
          pageHeight = yScroll;
      }

      // for small pages with total width less then width of the viewport
      if (xScroll < windowWidth) {
          pageWidth = windowWidth;
      } else {
          pageWidth = xScroll;
      }

      return{
          'pageWidth':pageWidth,
          'pageHeight':pageHeight,
          'windowWidth':windowWidth,
          'windowHeight':windowHeight
      }
  }();
  //遮罩层
  var styleStr = 'top:0;left:0;position:absolute;z-index:10000;background:rgba(0,0,0,.6);width:' + winSize.pageWidth + 'px;height:' +  (winSize.pageHeight + 30) + 'px;';
  var shadowDiv = document.createElement('div'); //添加阴影DIV
  shadowDiv.style.cssText = styleStr; //添加样式
  shadowDiv.id = "shadowDiv";
  //如果是IE6则创建IFRAME遮罩SELECT
  if (isIE6) {
      var maskIframe = document.createElement('iframe');
      maskIframe.style.cssText = 'width:' + winSize.pageWidth + 'px;height:' + (winSize.pageHeight + 30) + 'px;position:absolute;visibility:inherit;z-index:-1;filter:alpha(opacity=0);';
      maskIframe.frameborder = 0;
      maskIframe.src = "about:blank";
      shadowDiv.appendChild(maskIframe);
  }
  document.body.insertBefore(shadowDiv, document.body.firstChild); //遮罩层加入文档


  //弹出框
  var styleStr1 = 'display:block;position:fixed;_position:absolute;left:' + (winSize.windowWidth / 2 - 200) + 'px;top:' + (winSize.windowHeight / 2 - 150) + 'px;_top:' + (winSize.windowHeight / 2 + top - 150)+ 'px;'; //弹出框的位置
  var alertBox = document.createElement('div');
  alertBox.id = 'alertMsg';
  alertBox.style.cssText = styleStr1;
  //创建弹出框里面的内容P标签
  var alertMsg_info = document.createElement('P');
  alertMsg_info.id = 'alertMsg_info';
  alertMsg_info.innerHTML = msg;
  alertBox.appendChild(alertMsg_info);
  //创建按钮
  var btn1 = document.createElement('a');
  btn1.id = 'alertMsg_btn1';
  btn1.href = 'javascript:void(0)';
  btn1.innerHTML = '<cite>确定</cite>';
  btn1.onclick = function () {
      document.body.removeChild(alertBox);
      document.body.removeChild(shadowDiv);
      return true;
  };

  alertBox.appendChild(btn1);
  if (mode === 1) {
      var btn2 = document.createElement('a');
      btn2.id = 'alertMsg_btn2';
      btn2.href = 'javascript:void(0)';
      btn2.innerHTML = '<cite>取消</cite>';
      btn2.onclick = function () {
          document.body.removeChild(alertBox);
          document.body.removeChild(shadowDiv);
          return false;
      };
      alertBox.appendChild(btn2);
  }
 document.body.appendChild(alertBox);
}



