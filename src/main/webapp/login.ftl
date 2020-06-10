<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link  href="css/login.css">
		<script type="text/javascript" src="js/jquery.min.js" ></script>
		<script type="text/javascript">
		    $(function(){
		        var show_num = [];
		        draw(show_num);
		
		        $("#canvas").on('click',function(){
		            draw(show_num);
		        })
		        $(".btn").on('click',function(){
		            var val = $(".input-val").val().toLowerCase();
		            var num = show_num.join("");
		            if(val==''){
		                alert('请输入验证码！');
		            }else if(val == num){
		                alert('提交成功！');
		                $(".input-val").val('');
		                // draw(show_num);
		
		            }else{
		                alert('验证码错误！请重新输入！');
		                $(".input-val").val('');
		                // draw(show_num);
		            }
		        })
		    })
		
		    //生成并渲染出验证码图形
		    function draw(show_num) {
		        var canvas_width=$('#canvas').width();
		        var canvas_height=$('#canvas').height();
		        var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
		        var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
		        canvas.width = canvas_width;
		        canvas.height = canvas_height;
		        var sCode = "a,b,c,d,e,f,g,h,i,j,k,m,n,p,q,r,s,t,u,v,w,x,y,z,A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
		        var aCode = sCode.split(",");
		        var aLength = aCode.length;//获取到数组的长度
		        
		        for (var i = 0; i < 4; i++) {  //这里的for循环可以控制验证码位数（如果想显示6位数，4改成6即可）
		            var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
		            // var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
		            var deg = Math.random() - 0.5; //产生一个随机弧度
		            var txt = aCode[j];//得到随机的一个内容
		            show_num[i] = txt.toLowerCase();
		            var x = 10 + i * 20;//文字在canvas上的x坐标
		            var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
		            context.font = "bold 23px 微软雅黑";
		
		            context.translate(x, y);
		            context.rotate(deg);
		
		            context.fillStyle = randomColor();
		            context.fillText(txt, 0, 0);
		
		            context.rotate(-deg);
		            context.translate(-x, -y);
		        }
		        for (var i = 0; i <= 5; i++) { //验证码上显示线条
		            context.strokeStyle = randomColor();
		            context.beginPath();
		            context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
		            context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
		            context.stroke();
		        }
		        for (var i = 0; i <= 30; i++) { //验证码上显示小点
		            context.strokeStyle = randomColor();
		            context.beginPath();
		            var x = Math.random() * canvas_width;
		            var y = Math.random() * canvas_height;
		            context.moveTo(x, y);
		            context.lineTo(x + 1, y + 1);
		            context.stroke();
		        }
		    }
		
		    //得到随机的颜色值
		    function randomColor() {
		        var r = Math.floor(Math.random() * 256);
		        var g = Math.floor(Math.random() * 256);
		        var b = Math.floor(Math.random() * 256);
		        return "rgb(" + r + "," + g + "," + b + ")";
		    }

		    function register(){
		    	window.open("register.jsp")
			}
		
		</script>
	</head>
	<body style="background-size:100% 100%;">
		<form action="/JavaWebEnd111/login.do" method="post">
			<div style="background-color:moccasin;	background:rgba(0,0,0,0.1);margin-top:150px;margin-left:500px;height:300px;width:500px;">
			<table>
				<tr>
					<h3 style="text-align:center;color:rosybrown;padding-top:20px;">登录页面</h3>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr>
					<td style="color:rosybrown;width: 100px;padding-left: 150px;">用户名:</td>
					<td><input type="text" placeholder="请输入用户名" name="uname"/></td>
				</tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
				<tr>
					<td style="color:rosybrown;width: 100px;padding-left: 150px;">密&nbsp;&nbsp;码:</td>
					<td><input type="password" placeholder="请输入密码" name="pwd"/></td>
				</tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
				<tr>
					<td style="color:rosybrown;width:100px;padding-left: 150px;">验证码:</td>
				    <td><input  type="text" placeholder="验证码"  style="width:50px;height:25px;" class="input-val">
				 <canvas id="canvas" width="100" height="30"></canvas>
				 </td>
				 	<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
				</tr>
				<tr>
					<td style="width:100px;padding-left: 150px;">
						<input type="checkbox" />
				    </td>
					<td>
					<a style="color:rosybrown;">请记住我的决定</a>
					</td>
				</tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
				<tr>
					<td style="color:rosybrown;width: 100px;padding-left: 150px;"><input type="submit" value="登录" style="width:50px;" class="btn btn-primary"></td>
					<td style="color:rosybrown;"><%--<input type="submit" value="注册" style="width:50px;" onclick="register()">--%>
						<a href="register.jsp" style="width:50px; text-decoration: none;" >注册</a>
					</td>
				</tr>
			</table>
			</div>
		</form>
	</body>
</html>
