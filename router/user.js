//用户模块增删改查
const express=require("express");
//引入连接池模块
const pool=require("../pool.js");
//创建路由器对象
var router=express.Router();
//添加路由
//1、用户注册的路由   使用post不会显示在地址栏
router.post("/reg",function(req,res){
	var $sid=req.params.sid;
	//把数据插入到数据库中
	//执行sql语句
	pool.query("INSERT INTO swq_user SET ?",[$uid],function(err,result){
		if(err) throw err;
		console.log(result);
		//判断是否插入成功
		if(result.affectedRows>0){
			res.send({code:200,msg:"reg success"});
		}
	})
});
	//2、用户登录界面
router.get("/v1/login/:sname&:upwd",function(req,res){
	var $sname=req.params.sname;
	var $upwd=req.params.upwd;

	pool.query("select * from swq_user where sname=? and upwd=?",[$sname,$upwd],(err,result)=>{
		if(err) throw err;
		console.log(result);
		if(result.length>0){
			res.send("1")
		
		}else{
			res.send("0")
		}
	})

});


//3、检索用户（查询详情）
router.get("/v1/list",function(req,res){

	
	//执行sql语句
	pool.query("SELECT * FROM swq_user",function(err,result){
		if(err) throw err;
		//把查询到的数据直接响应到浏览器端
		res.send(result);
	})
})

//4、修改用户
router.get("/update",function(req,res){
	//获取数据
	var obj=req.query;
	//验证数据是否为空
	//批量验证，获取每一个属性，然后判断是否为空
	var i=400;
	for(var key in obj){
		i++;
		//console.log(key,obj[key];
		//判断属性值是否为空
		if(!obj[key]){
			res.send({code:"i",msg:"key+required"})
			return;
		}
	}
	//执行sql语句
	pool.query("UPDATE swq_user SET email=?,phone=?,user_name=?,gender=? WHERE sid=?",[obj.email,obj.phone,obj.user_name,obj.gender,obj.sid],function(err,result){
		if(err)  throw  err;
		console.log(result);
		if(result.affectedRows>0){
			res.send({code:200,msg:"update success"})
		}else{
			res.send({code:301,msg:"update error"})
		}

	})
})


//导出路由器
module.exports=router;