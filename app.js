const express=require("express");
//引入用户路由器  引入目录下的某一个模块
const userRouter=require("./router/user.js");
//引入body-parser中间件
const bodyParser=require("body-parser");

var app=express();

app.listen(8080);

//托管静态资源到public目录下
app.use(express.static("public"));
//使用  body-parser中间件
app.use(bodyParser.urlencoded({
	extended:false    //不使用第三方的qs模块而是使用querystring模块
}));

//使用路由器
app.use("/user",userRouter);