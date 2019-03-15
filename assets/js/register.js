// 加载footer
$.ajax({
  type:"get",
  url:"./footer.html",
  success:data=>$("#footer").html(data),
  error:()=>console.log("网络连接错误，请检查footer.html")
})

/*1.对用户名进行验证*/
uname.onblur = function () {
  if (this.validity.valueMissing) {
    this.nextElementSibling.innerHTML = '用户名不能为空';
    this.nextElementSibling.className = 'msg-error';
  } else if (this.validity.tooShort) {
    this.nextElementSibling.innerHTML = '用户名不能少于3位';
    this.nextElementSibling.className = 'msg-error';
  } else {
    var that = this;
    if (!that.value) {   //用户没有输入任何内容
      return;
    }
    $.ajax({
      url: './assets/data/user/check_uname.php',
      data: {uname: that.value},
      success: function (result) {
        if (result.code === 201) {
          that.nextElementSibling.innerHTML = '用户名已被占用';
          that.nextElementSibling.className = 'msg-error';
        } else if (result.code === 200) {
          that.nextElementSibling.innerHTML = '用户名可以使用';
          that.nextElementSibling.className = 'msg-success';
          upwd.focus();
        } else {
          alertMsg('验证用户名出错！请稍后重试。')
        }
      }
    })
  }
}
uname.onfocus = function () {
  this.nextElementSibling.innerHTML = '用户名长度在6到9位之间';
  this.nextElementSibling.className = 'msg-default';
}
/*2.对密码进行验证*/
upwd.onfocus = function () {
  this.nextElementSibling.innerHTML = '密码长度在6到12位之间';
  this.nextElementSibling.className = 'msg-default';
}
upwd.onblur = function () {
  if (this.validity.valueMissing) {
    this.nextElementSibling.innerHTML = '密码不能为空';
    this.nextElementSibling.className = 'msg-error';
  } else if (this.validity.tooShort) {
    this.nextElementSibling.innerHTML = '密码长度不能少于6位';
    this.nextElementSibling.className = 'msg-error';
  } else {
    this.nextElementSibling.innerHTML = '密码格式正确';
    this.nextElementSibling.className = 'msg-success';
  }
}
/*2.对确认密码进行验证*/
upwdconfirm.onfocus = function () {
  this.nextElementSibling.innerHTML = '密码长度在6到12位之间';
  this.nextElementSibling.className = 'msg-default';
}
upwdconfirm.onblur = function () {
  if (this.validity.valueMissing) {
    this.nextElementSibling.innerHTML = '确认密码不能为空';
    this.nextElementSibling.className = 'msg-error';
  } else if (this.validity.tooShort) {
    this.nextElementSibling.innerHTML = '确认密码长度不能少于6位';
    this.nextElementSibling.className = 'msg-error';
  } else if (this.value != upwd.value) {
    this.nextElementSibling.innerHTML = '两次输入的密码一致';
    this.nextElementSibling.className = 'msg-error';
  } else {
    this.nextElementSibling.innerHTML = '两次输入的密码一致';
    this.nextElementSibling.className = 'msg-success';
  }
}
/*3.对邮箱地址进行验证*/
email.onblur = function () {
  if (this.validity.valueMissing) {
    this.nextElementSibling.innerHTML = '邮箱不能为空';
    this.nextElementSibling.className = 'msg-error';
  } else if (this.validity.typeMismatch) {
    this.nextElementSibling.innerHTML = '邮箱格式不正确';
    this.nextElementSibling.className = 'msg-error';
  } else {
    var that = this;
    if (!that.value) {   //用户没有输入任何内容
      return;
    }
    $.ajax({
      url: './assets/data/user/check_email.php',
      data: {email: that.value},
      success: function (result) {
        if (result.code === 201) {
          that.nextElementSibling.innerHTML = '该邮箱已经注册过';
          that.nextElementSibling.className = 'msg-error';
        } else if (result.code === 200) {
          that.nextElementSibling.innerHTML = '该邮箱可以使用';
          that.nextElementSibling.className = 'msg-success';
          phone.focus();
        } else {
          alertMsg('验证邮箱出错！请稍后重试。')
        }
      }
    })
  }
}
email.onfocus = function () {
  this.nextElementSibling.innerHTML = '请输入合法的邮箱地址';
  this.nextElementSibling.className = 'msg-default';
}
/*4.对手机号进行验证*/
phone.onblur = function () {
  if (this.validity.valueMissing) {
    this.nextElementSibling.innerHTML = '手机号不能为空';
    this.nextElementSibling.className = 'msg-error';
  } else if (this.validity.patternMismatch) {
    this.nextElementSibling.innerHTML = '手机号格式不正确';
    this.nextElementSibling.className = 'msg-error';
  } else {
    var that = this;
    if (!this.value) {   //用户没有输入任何内容
      return;
    }
    $.ajax({
      url: './assets/data/user/check_phone.php',
      data: {phone: that.value},
      success: function (result) {
        if (result.code === 201) {
          that.nextElementSibling.innerHTML = '该电话已经注册过';
          that.nextElementSibling.className = 'msg-error';
        } else if (result.code === 200) {
          that.nextElementSibling.innerHTML = '该电话可以使用';
          that.nextElementSibling.className = 'msg-success';
        } else {
          alertMsg('验证手机出错！请稍后重试。')
        }
      }
    })
  }
}
phone.onfocus = function () {
  this.nextElementSibling.innerHTML = '请输入合法的手机号';
  this.nextElementSibling.className = 'msg-default';
}

/**注册按钮监听函数**/
$('#bt-register').click(function () {
  var count = 0;
  $('.form-group').each(function () {
    if ($(this).find('span').hasClass('msg-success')) {
      count++;
    }
  });
  if (count == 5) {
    $.ajax({
        type: 'POST',
        url: './assets/data/user/register.php',
        data: $('#form-register').serialize(),
        success: function(result){
          if(result.code===200){
            alertMsg('<b>注册成功！</b><p>点击“确定”后将跳转到登录页</p>')
            $('#alertMsg').on('click', '#alertMsg_btn1 cite', function (e) {
              e.preventDefault();
              location.href = 'login.html';
            })
          }else {
            alertMsg('<b>注册失败！</b><p>错误消息：'+result.msg+'</p>')
          }
        }
      }
    )
  }
})


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
