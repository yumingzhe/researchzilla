<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 12-6-2
  Time: 下午3:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link href="layout.css" rel="stylesheet" type="text/css"/>
    <script>
        /*获取id节点的函数*/
        $(function () {
            function getId(id) {
                return $('#' + id);
            }

            /*创建图片滚动对象(前四个参数是标签的id)*/
            function marquee(divElem, imgElem, lBut, rBut, imgWidth, speed, autoSpeed) {//参数含义(包含两组图片的div，包含一组图片的ul，左侧按钮，右侧按钮,图片宽度，单张图片滚动时间，图片滚动间隔时间)
                this.box = getId(divElem);
                this.img = getId(imgElem);
                this.lBut = getId(lBut);
                this.rBut = getId(rBut);//获取各个节点
                this.imgWidth = imgWidth;
                this.speed = speed;
                this.autoSpeed = autoSpeed;
                this.num = 0;//全局变量,用来进行条件控制
                var that = this;
                /*图片自动滚动函数*/
                this.autoGo = function () {
                    that.num += that.imgWidth;
                    that.box.animate({right:"+=" + that.imgWidth + "px"}, that.speed);
                    if (that.num >= that.img.width()) {
                        that.num = 0;
                        that.box.animate({right:"0px"}, 0);
                    }
                }
            }

            /*对象方法*/
            marquee.prototype = {
                /*图片的自动滚动*/
                autoScroll:function () {
                    var that = this;
                    auto = setInterval(this.autoGo, this.autoSpeed);
                    this.box.mouseover(function () {
                        clearInterval(auto);
                    });
                    this.box.mouseout(function () {
                        auto = setInterval(that.autoGo, that.autoSpeed);
                    })
                    this.lBut.mouseover(function () {
                        clearInterval(auto);
                        if (that.num == that.img.width()) {
                            that.num = 0;
                            that.box.animate({right:"0px"}, 0);
                        }
                    });
                    this.lBut.mouseout(function () {
                        auto = setInterval(that.autoGo, that.autoSpeed);
                    });
                    this.rBut.mouseover(function () {
                        clearInterval(auto);
                        if (that.num == 0) {
                            that.num = that.img.width();
                            that.box.animate({right:that.img.width() + "px"}, 0);
                        }
                    });
                    this.rBut.mouseout(function () {
                        auto = setInterval(that.autoGo, that.autoSpeed);
                        if (that.num == that.img.width()) {
                            that.num = 0;
                            that.box.animate({right:"0px"}, 0);
                        }
                    });
                },
                /*单击左侧按钮,图片向左滚动*/
                leftScroll:function () {
                    var that = this;
                    this.lBut.click(function () {
                        that.num += that.imgWidth;
                        that.box.animate({right:"+=" + that.imgWidth + "px"}, that.speed);
                        if (that.num >= that.img.width()) {
                            that.num = 0;
                            that.box.animate({right:"0px"}, 0);
                        }
                    });
                },
                /*单击右侧按钮,图片向右滚动*/
                rightScroll:function () {
                    var that = this;
                    this.rBut.click(function () {
                        that.num -= that.imgWidth;
                        that.box.animate({right:"-=" + that.imgWidth + "px"}, that.speed);
                        if (that.num <= 0) {
                            that.num = that.img.width();
                            that.box.animate({right:that.img.width() + "px"}, 0);
                        }
                    });
                }
            }

            var a = new marquee("allPic", "picLst", "prel", "next", 170, 300, 1000);//初始化对象
            a.autoScroll();
            a.leftScroll();
            a.rightScroll();
        });
    </script>

</head>
<body>
<div class="picList">
    <span class="prel" id="prel"></span>
    <span class="next" id="next"></span>

    <div class="showBox">
        <div id="allPic" class="allPic">
            <ul class="cusLst" id="picLst">
                <li class="cusLstLi">
                    <img src="./img/b.jpg"/>
                    <a>紫艺陶缘</a>
                    <ul class="w170 midX sveclass">
                        <li>服务：7×24小时</li>
                        <li>类型：在线客服外包</li>
                    </ul>
                </li>
                //10个li
            </ul>
            <ul class="cusLst">
                <li class="cusLstLi">
                    <img src="./img/b.jpg"/>
                    <a>可爱图片</a>
                    <ul class="w170 midX sveclass">
                        <li>服务：7×24小时</li>
                        <li>类型：在线客服外包</li>
                    </ul>
                </li>
                //10个li
            </ul>
            //复制上面的ul，内容完全相同
        </div>
    </div>
</div>
</body>
</html>