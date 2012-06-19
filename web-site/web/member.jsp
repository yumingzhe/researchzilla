<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>Researchzilla | Members</title>
    <meta http-equiv="Content-Type" content="text/html; charset=GB2312"/>
    <link rel="stylesheet" href="css/cise.css" type="text/css" media="screen"/>
    <LINK href="css/pic.css" type=text/css rel=stylesheet>
    <link rel="stylesheet" type="text/css" href="css/professor.css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link rel="stylesheet" type="text/css" href="css/xx.css"/>
    <link rel="stylesheet" type="text/css" href="css/zt.css"/>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#professior').click(function () {
                $.ajax({
                    type:"GET",
                    url:"http://localhost:8080/getSiteUserByTypeAction.action?type=professior",
                    dataType:"json",
                    success:function () {
                        alert("hello");
                        /* alert(data);*/
                    }
                });
            })
        })
    </script>
</head>
<body style="margin:0; ">
<div id="container">
    <div id="main">
        <div class="teachers">
            <div id="teachersLeft">
                <div class="father">
                    <div class="left">成员类型</div>
                    <ul class="right">
                        <li onmouseover="this.className='actlihover'" onmouseout="this.className=''"
                                >
                            <a href="" target="_self" id="professior">
                                教授
                            </a>
                        </li>
                        <li onmouseover="this.className='actlihover'" onmouseout="this.className=''"
                            style="background:#00CCFF">
                            <a href="">
                                副教授
                            </a>
                        </li>
                        <li onmouseover="this.className='actlihover'" onmouseout="this.className=''">
                            <a href="" target="_self">
                                实验员
                            </a>
                        </li>
                        <li onmouseover="this.className='actlihover'" onmouseout="this.className=''">
                            <a href="" target="_self">
                                博士生
                            </a>
                        </li>
                        <li onmouseover="this.className='actlihover'" onmouseout="this.className=''">
                            <a href="" target="_self">
                                研究生
                            </a>
                        </li>
                        <li onmouseover="this.className='actlihover'" onmouseout="this.className=''">
                            <a href="" target="_self">
                                本科生
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="teacher">
                <table width="680">
                    <tr>
                        <td width="100"><img src='http://localhost:8080/avatarTmp/1.jpg' alt="abc"/><br/>

                            <div id="name"><a href=''>曾庆田</a></div>
                        </td>
                        <td><a href=''><span style="font-size:12px;">曾庆田，男，博士，教授，博士生导师。1976年1月生，山东高密人。现为中国计算机学会高级会员、中国计算机学会Petri网专业委员会委员、中国农学会计算机农业应用分会理事……</span></a>
                        </td>
                    </tr>
                    <tr>
                        <td width="100">
                            <img src='http://localhost:8080/avatarTmp/hancongying.jpg' alt="abc"/>
                            <br/>
                            <div id="name1">
                                <a href=''>
                                    韩丛英
                                </a>
                            </div>
                        </td>
                        <td>
                            <a href=''>
                                <span style="font-size:12px;">
                                    中共党员。主要研究方向：并行算法、最优化算法及其应用
                                </span>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td width="100">
                            <img src='http://localhost:8080/avatarTmp/liweiming.jpg' alt="abc"/><br/>
                            <div id="name2">
                                <a href=''>李伟明</a>
                            </div>
                        </td>
                        <td>
                            <a href=''>
                                <span style="font-size:12px;">
                                    李伟明，男，副教授，硕士，应用数学系教师。主要研究方向：软件工程。主要讲授《工科数学分析》、《概率论与数理统计》课程
                                </span></a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>