var lists = document.querySelector(".details .deta-1 .deta-11").children;
console.log(lists)
for(var list of lists){
  console.log(list);
  list.onclick=function(){
    var list = src;
    var md = document.getElementById("md");
    var src = this.getAttribute("src");
    md.setAttribute("src",src);
  }
}


var btns = document.querySelector(".details .deta-1 .deta-12 .btn");
console.log(btns);
var jbtn = btns.children[0];
console.log(jbtn);
var abtn = btns.children[2];
console.log(abtn)
var n = parseInt(btns.children[1].innerHTML);
console.log(n);
jbtn.onclick = function(){
  var n = parseInt(btns.children[1].innerHTML);
  if(n>1){
    n--;
    btns.children[1].innerHTML = n;
    var price = document.querySelector(".details .deta-1 .deta-12 h1").innerHTML.slice(1);
    var p = `¥ + parseFloat(n*price)`;
    price = p;
  }
}
abtn.onclick = function(){
  var n = parseInt(btns.children[1].innerHTML);
  n++;
  btns.children[1].innerHTML = n;
  var price = document.querySelector(".details .deta-1 .deta-12 h1").innerHTML.slice(1);
  var p = `¥ + parseFloat(n*price)`;
  price = p;
}