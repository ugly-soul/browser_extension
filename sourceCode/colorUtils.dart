set16ToRgb(String str){
   var reg = RegExp(r'^#([0-9A-Fa-f]{3}|[0-9A-Fa-f]{6})$');
   if(!reg.hasMatch(str)){return null;}
   var newStr = (str.toLowerCase()).replaceAll(r'#','');
   var len = newStr.length;
   if(len == 3){
       var t = '';
       for(var i=0;i<len;i++){
           t += newStr.substring(i,i+1) + (newStr.substring(i,i+1));
       }
       newStr = t;
   }
   var arr = []; //将字符串分隔，两个两个的分隔
   for(var i =0;i<6;i=i+2){
      var s = newStr.substring(i,i+2);
      arr.add(int.parse("0x$s"));
   }
   return 'rgb(${arr.join(",")})';
}
setRgbTo16(String str){
    var reg = RegExp(r'^(rgb|RGB)');
    if(!reg.hasMatch(str)){return null;}
    var arr = str.substring(4, str.length-1).split(",");
    var color = '#';
    for(var i=0;i<arr.length;i++){
      var t = int.parse(arr[i]).toRadixString(16);
      if(t == "0"){   //如果为“0”的话，需要补0操作,否则只有5位数
          t =  "${t}0";
      }
      color += t;
    }
    return color;
}