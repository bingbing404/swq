//现在正在显示第几张图片  从0开始
var i=0;
//每个li的固定宽度 
var LIWIDTH=1280;
//每次轮播动画持续的时间
var DURATION=500;
//li  的总个数
var LICOUNT=5;
//要移动的ul
var ulImgs=document.getElementById("ul-imgs");
//包含小圆点 的列表ul
var ulIdxs=document.getElementById("ul-idxs");
//小圆点的元素 列表
var lis=ulIdxs.children;
//从当前位置移动到 任意一个范围的位置
function moveTo(to){
    //如果用户没有 插入要调到第几张图 就默认调到  当前图片的 下一
    if(to==undefined){
        to=i+1;
    }
    if(i==0){
        if(to>i){
            //如果滚动从头开始 再重新加上 transition
            //如果要看当前位置 右边的图片  是不会出问题的
            ulImgs.className="transition";
        }else{
            //只有 i=0 在开头  且还要看左边的图片时  才会出问题
            //为了避免 用户看到 偷梁换柱的效果  先把 transition class去掉
            ulImgs.className="";
            //将ulImgs  拉取到最左侧
            ulImgs.style.marginLeft=-LIWIDTH*LICOUNT+"px";
            //使用 定时器是为了将 偷梁换柱操作和 加回transition属性的操作强行 隔离开
            setTimeout(function(){
                moveTo(LICOUNT-1);
            },100);
            return;
        }
    }
    //先将  表示第几张 图片的 变量i  变为目标位置
    i=to;
    //再用i 计算 ulimgs  的 margin-left 的距离
    ulImgs.style.marginLeft=-i*LIWIDTH+"px";
    //先删除所有小圆点的class
    for(var li of lis){
        li.className="";
    }
    console.log(i);
    if(i==LICOUNT){
        i=0;
        //当 transition 动画播放完之后 才
        setTimeout(function(){
            //清掉 transition  属性
            ulImgs.className="";
            //将 ulImgs 拉回 0 位置
            ulImgs.style.magrinLeft=0;
        },DURATION)
    }
    //再给当前位置的 小圆点 添加 class active
    lis[i].className="active";
}
var btnLeft=document.getElementById("btn-left");
var btnRight=document.getElementById("btn-right");
//用开关控制  上次动画还没有  播放完 下次动画不能开始
var canClick=true;
btnRight.onclick=function(){
    //调用两个按钮的 公共移动方法 参数1表示 移动到 i+1 的位置  相当于左移一个
    move(1)
}
//两个按钮 共用的移动函数 n传入1时 移动到i+1位置 左移
//               n传入 -1 时 移动到 i-1 位置  右移
function move(n){
    if(canClick){
        console.log(i+n);
        //只有可单击时 才调用真正移动 ul 的方法
        moveTo(i+n);
        //马上把开关关上 禁止再次点击
        canClick=false;
        //只有本地 transition 动画播放完 才能自动打开开关 点击按钮 才有反应
        setTimeout(function(){
            canClick=true;
        },DURATION+100);
    }
}
btnLeft.onclick=function(){
    move(-1);
}
//每次轮播时间间隔 3秒
var interval=3000;
var timer=setInterval(function(){
    moveTo()
},3000);
var banner=document.getElementById("banner");
//鼠标移入时  停止轮播
banner.onmouseover=function(){
    clearInterval(timer);
}
//鼠标移出  继续执行
banner.onmouseout=function(){
    timer=setInterval(function(){
        moveTo()
    },3000);
}
//小圆点效果
var ulIdxs=document.getElementById("ul-idxs");
var canClick=true;
ulIdxs.onclick=function(e){
    if(canClick){
        var li=e.target;
        if(li.nodeName=="LI"){
            if(li.className!=="active"){
                for(var i=0;i<lis.length;i++){
                    if(lis[i]==li){
                        break;
                    }
                }
                moveTo(i);
                setTimeout(function(){
                    canClick=true;
                },DURATION);
            }
        }
    }
}