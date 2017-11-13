<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title></title>
      <style>
          body{font-family: Arial;}
          span{width:20px;display: inline-block;}
          input{width:180px;margin:5px 0 0 0;}
          button{width:180px;margin: 5px 0 0 20px;}
          form{float:left;}
          .wrapper{margin: 10px auto;width:600px;  background-color:#d4f1eb; border-radius: 10px; padding: 30px;}
          .result{width:300px;  float: right;}
          .clr{clear:both;}
          .radio{width:auto; margin: 5px 0 0 20px;}
          .array{width:25px;margin:5px 0 0 0;text-align: center;}

      </style>
      <script src="http://code.jquery.com/jquery-latest.min.js"></script>
      <script>
              function doFunction1(){
              var myx = $('#x1').val();
              var myy = $('#y1').val();
              var myz = $('#z1').val();

                  $.get("Kontrol1", {
                      x : myx,
                      y : myy,
                      z : myz
                  }, function(responseText) {
                      $("#result1").text(responseText);
                  });
              }
      </script>
      <script>
          function doFunction2(){
              var arr = ["rad1", "rad2", "rad3"];
              var rad = 1;
              arr.forEach(function(item){
                  if(document.getElementById(item).checked) rad = $('#'+item).val();
              });
              var myx = $('#c2').val();
              var myy = $('#d2').val();
              var myz = $('#z2').val();

              $.get("Kontrol2", {
                  c : myx,
                  d : myy,
                  z : myz,
                  fi : rad
              }, function(responseText) {
                  $("#result2").text(responseText);
              });
          }
      </script>
      <script>
          function doFunction3(){
              var mya = $('#a3').val();
              var myb = $('#b3').val();
              var myh = $('#h3').val();
              var myn = $('#n3').val();

              $.get("Kontrol3", {
                  a : mya,
                  b : myb,
                  h : myh,
                  n : myn
              }, function(responseText) {
                  arr = responseText.split(';');
                  var result = '<table style="width:100%"><tr><th>S(x)</th><th>Y(x)</th><th>Module</th></tr>';
                  arr.forEach(function(item, i){
                      if(i%3===0) result += '<tr>';
                        result += '<td>' + item + '</td>';
                      if(i%3===2) result += '</tr>';
                  });
                  document.getElementById("result3").innerHTML = result;
              });
          }
      </script>
      <script>
          function changeArrayLen4(){
              var len = 10;
              var inner = "";
              var arrVal = document.getElementById("n4").value;
              if(arrVal!==0 && arrVal<25 && arrVal>0) len = arrVal;
              for(var i = 1; i <= len; i++){
                  inner += '<input type="text" id="arr'+i+'" class="array" value="'+getRand(-10,11)+'">';
              }
              document.getElementById("arrWrap").innerHTML = inner;
          }
          function getRand(min, max) {
              return Math.floor(Math.random() * (max - min)) + min;
          }
          $(document).ready(function(){
              changeArrayLen4();
          });
      </script>
      <script>
          function doFunction4(){
              var result = "";
              $(".array").each(function(){
                  result += $(this).val()+",";
              });
              result.slice(0, -1);
              $.get("Kontrol4", {
                  res : result
              }, function(responseText){
                  $("#result4").text(responseText);
              });
          }
      </script>
  </head>
  <body>
  <div class="wrapper">
      <form>
          <span>X</span><input type="text" id="x1" name="x" value="0.1722"><br>
          <span>Y</span><input type="text" id="y1" name="y" value="6.33"><br>
          <span>Z</span><input type="text" id="z1" name="z" value="3.25e-4"><br>
          <button type="button" onclick="doFunction1()">Run</button>
      </form>
      <div class="result" id="result1"></div>
      <div class="clr"></div>
  </div>
  <div class="wrapper">
      <form>
          <span>C</span><input type="text" id="c2" name="c" value="0.1722"><br>
          <span>D</span><input type="text" id="d2" name="d" value="6.33"><br>
          <span>Z</span><input type="text" id="z2" name="z" value="3.25e-4"><br>
                <input class="radio" type="radio" id="rad1" name="answer" value="1" checked>2X
                <input class="radio" type="radio" id="rad2" name="answer" value="2">X^2
                <input class="radio" type="radio" id="rad3" name="answer" value="3">X/3<br>
          <button type="button" onclick="doFunction2()">Run</button>
      </form>
      <div class="result" id="result2"></div>
      <div class="clr"></div>
  </div>
  <div class="wrapper">
      <form>
          <span>A</span><input type="text" id="a3" name="a" value="0.1"><br>
          <span>B</span><input type="text" id="b3" name="b" value="1"><br>
          <span>H</span><input type="text" id="h3" name="h" value="0.1"><br>
          <span>N</span><input type="text" id="n3" name="n" value="10"><br>
          <button type="button" onclick="doFunction3()">Run</button>
      </form>
      <div class="result" id="result3"></div>
      <div class="clr"></div>
  </div>
  <div class="wrapper">
      <form>
          Размер n =    <input type="text" id="n4" name="n" value="10">
          <button type="button" onclick="changeArrayLen4()">Change Length</button>
          <br>
          <div id="arrWrap"></div>
          <button type="button" onclick="doFunction4()">Run</button>
      </form>
      <div class="result" id="result4"></div>
      <div class="clr"></div>

  </div>

  </body>
</html>