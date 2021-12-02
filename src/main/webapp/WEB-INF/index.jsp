<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%--<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>--%>

<html>
<head>

    <title>Акордбанк-інфраструктура</title>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
    <%--    <meta charset="utf-8" />--%>

    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.anychart.com/releases/8.9.0/js/anychart-base.min.js" type="text/javascript"></script>
    <script src="https://cdn.anychart.com/js/latest/anychart-bundle.min.js"></script>

    <script type="text/javascript">

            function disableButton(btn) {
                document.getElementById(btn.id).disabled = true;
            }

    </script>

    <style type="text/css">

        .text {
            text-align: center;
        }

        h1,h2,h3{
            color: red;
        }

        #container {
            border: 1px solid black;
        }

        #seconds-counter {
            z-index:100;
            position:absolute;
            color: #00008b;
            font-size:5vw;
            font-weight:bold;
            right:15%;
            bottom:20%;
        }
        #hiddentext {
            z-index:100;
            position:absolute;
            color: black;
            font-size:5vw;
            font-weight:bold;
            right:13%;
            bottom:10%;
        }

        .textspec {
            animation-name: tspec;
            animation-duration: 30s;
            animation-iteration-count: infinite;
            animation-timing-function: linear; /* step-start тоже */
        }

        @keyframes tspec {
            0%   { opacity: 0; }
            10%  { opacity: 1; }
            90%  { opacity: 1; }
            100% { opacity: 0; }
        }

        @keyframes tspec1 {
            0%   { opacity: 0; }
            10%  { opacity: 1; }
            90%  { opacity: 1; }
            100% { opacity: 0; }
            0%   { opacity: 0; }
        }

        @keyframes blink {
            from { opacity: 1; /* Непрозрачный текст */ }
            to { opacity: 0; /* Прозрачный текст */ }
        }

        .smile{
            z-index:100;
            position:absolute;
            color: #00008b;
            font-size:5vw;
            font-weight:bold;
            right:30%;
            bottom:32%;
            width:15%;
        }

    </style>
</head>
<body>

<div class="text">
    <img class="text" style="width:15%;" src="data:image/svg+xml;base64,PHN2ZyBpZD0ibC11LWciIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IiB3aWR0aD0iMTg3LjdweCIgaGVpZ2h0PSI0NC44cHgiIHZpZXdCb3g9IjAgMCAxODcuNyA0NC44IiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCAxODcuNyA0NC44OyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+DQo8c3R5bGUgdHlwZT0idGV4dC9jc3MiPg0KCS5zdDB7ZmlsbC1ydWxlOmV2ZW5vZGQ7Y2xpcC1ydWxlOmV2ZW5vZGQ7ZmlsbDojQ0MwMDAwO30NCgkuc3Qxe2ZpbGwtcnVsZTpldmVub2RkO2NsaXAtcnVsZTpldmVub2RkO2ZpbGw6Izk5OTk5OTt9DQo8L3N0eWxlPg0KPHBhdGggY2xhc3M9InN0MCIgZD0iTTQzLjYsMjcuNUwyMi4xLDlMMC42LDI3LjVDMC4yLDI1LjgsMCwyNC4yLDAsMjIuNEMwLDEwLDkuOSwwLDIyLjEsMGMxMi4yLDAsMjIuMSwxMCwyMi4xLDIyLjQgQzQ0LjIsMjQuMiw0NCwyNS44LDQzLjYsMjcuNSBNMTAxLDM1LjFjMy41LDAsNS4yLTAuMiw2LjQtMC41YzIuNC0wLjcsNC0yLjMsNC44LTQuOGMwLjMtMC44LDAuNC0xLjUsMC40LTIuMiBjMC0yLjMtMC45LTQuNC0yLjYtNS45Yy0xLjYtMS40LTMuNi0yLTYtMmgtNC4xYy0wLjUsMC4xLTEsMC4zLTEuMiwwLjdjLTAuMiwwLjQtMC40LDAuOC0wLjUsMS4zdjE5LjZoMi44VjM1LjEgTTEwOC4yLDIyLjggYzAuOCwxLjMsMS4zLDMuMSwxLjMsNC45YzAsMS43LTAuNCwzLjEtMS4zLDQuNGMtMSwxLjQtMi4zLDIuMS0zLjksMi4xbC0zLjMsMFYyMS4xYzAtMC4zLDAuMi0wLjUsMC41LTAuNWwyLjcsMCBDMTA1LjksMjAuNSwxMDcuMywyMS4zLDEwOC4yLDIyLjh6IE04OC4yLDM1LjVjMi4zLDAsNC4yLTAuNyw1LjctMi4yYzEuNS0xLjUsMi4zLTMuNCwyLjMtNS44YzAtMi4zLTAuOC00LjItMi4zLTUuNiBjLTEuNS0xLjUtMy40LTIuMi01LjYtMi4yYy0yLjMsMC00LjIsMC43LTUuNiwyLjJjLTEuNSwxLjUtMi4yLDMuNC0yLjIsNS43YzAsMi4zLDAuNyw0LjIsMi4zLDUuN0M4NC4xLDM0LjgsODYsMzUuNSw4OC4yLDM1LjUgTTkyLjMsMzIuMWMtMSwxLjctMi4zLDIuNi00LDIuNmMtMS43LDAtMy0wLjgtNC0yLjNDODMuNSwzMSw4MywyOS40LDgzLDI3LjZjMC0xLjksMC40LTMuNSwxLjItNC45YzEtMS42LDIuMy0yLjQsNC0yLjQgYzEuNiwwLDIuOSwwLjcsMy45LDIuMmMwLjksMS4zLDEuMywyLjksMS4zLDQuNkM5My41LDI5LjEsOTMuMSwzMC43LDkyLjMsMzIuMXogTTcyLjgsMjQuNmw1LjUtNWgtMS4ybC02LjcsNi4xdi02LjFoLTIuOHYxNS41IGwyLjgtMC4xdi04LjJsMC41LTAuNWw2LjksOC44aDMuMUw3Mi44LDI0LjZ6IE01Ni4yLDEzbC05LjgsMjIuMWgxbDIuOC02LjNoMTBsMi44LDYuM2gzTDU2LjIsMTN6IE01MC43LDI3LjlsNC42LTEwLjNsNC41LDEwLjMgSDUwLjd6IE0xMTQuNSwzNC4ybDUtMTIuM2MwLjEtMC4yLDAuMy0wLjQsMC41LDBjMS42LDQsMy4zLDguMyw0LjksMTIuM0gxMTQuNXogTTExMi4xLDMzLjljMCwwLjUsMC4xLDAuOCwwLjEsMWMwLDAuNiwwLDEtMC4xLDEuMiBoMC4yYzAuMy0wLjMsMC42LTAuNSwxLjEtMC43YzAuNC0wLjEsMC45LTAuMiwxLjUtMC4zYzAuNiwwLDEuNCwwLDIuNSwwaDUuOGMxLjEsMCwyLjYsMCwzLjIsMGMwLjUsMCwxLDAuMSwxLjQsMC4zIGMwLjQsMC4xLDAuNywwLjQsMC45LDAuN2gwLjJjMC0wLjMtMC4xLTAuNy0wLjEtMS4yYzAtMC40LDAtMC43LDAuMS0xaC0xbC01LjUtMTMuMWMtMC4xLTAuMy0wLjMtMC42LTAuNS0wLjggCWMtMC4yLTAuMi0wLjQtMC40LTAuNi0wLjVjLTAuNS0wLjItMC45LTAuMi0xLjQsMGMtMC4yLDAuMS0wLjMsMC4yLTAuNSwwLjRjLTAuMiwwLjItMC4zLDAuNC0wLjUsMC42bC01LjgsMTMuM0gxMTIuMXoiLz4NCjxwYXRoIGNsYXNzPSJzdDEiIGQ9Ik01LjQsMzcuMWwxNi43LTIzbDE2LjcsMjNjLTQuMSw0LjctMTAsNy43LTE2LjcsNy43QzE1LjQsNDQuOCw5LjQsNDEuOCw1LjQsMzcuMSBNMTcyLDE5LjZoLTIuOHY2LjRoLTguMXYtNi40IGgtMi44djE1LjVoMi44di04LjJoOC4xdjguMmgyLjhWMTkuNnogTTE1Mi4xLDIxTDE1Mi4xLDIxYy0wLjItMC40LTAuNC0wLjctMC42LTAuOWMtMC4yLTAuMi0wLjUtMC40LTAuNy0wLjVjLTAuNC0wLjEtMC43LTAuMS0xLjEsMGMtMC4yLDAuMS0wLjQsMC4yLTAuNiwwLjRjLTAuNCwwLjQtMC42LDAuOS0wLjgsMS41bC00LjUsMTMuNmgxLjFsMS4yLTMuN2g2LjhsMS4yLDMuN2gyLjdMMTUyLjEsMjF6ICBNMTQ2LjQsMzAuNGMxLTMsMi02LDMtOWMwLTAuMSwwLjItMC4zLDAuMywwbDIuOCw5SDE0Ni40eiBNMTMxLDIxLjdjMC4xLTAuNSwwLjItMC45LDAuNS0xLjNjMC4zLTAuNSwwLjgtMC43LDEuNC0wLjhsNy44LDB2MC45IGMtMi4yLDAtNC40LDAtNi42LDBjLTAuMiwwLTAuMywwLjEtMC4zLDAuNGwwLDUuNmMwLjIsMCwwLjYsMCwxLjIsMGMwLjUsMCwwLjksMCwxLjIsMGMyLDAsMy41LDAuMiw0LjUsMC43IGMxLjUsMC43LDIuMiwxLjksMi4yLDMuN2MwLDEuMy0wLjUsMi40LTEuNiwzLjJjLTEsMC43LTIuMSwxLjEtMy41LDEuMUgxMzFWMjEuOEMxMzEsMjEuOCwxMzEsMjEuNywxMzEsMjEuN0wxMzEsMjEuNyBNMTM2LjksMjcuNSBjMSwwLDEuOSwwLjMsMi42LDAuOWMwLjcsMC42LDEuMSwxLjQsMS4xLDIuNGMwLDEtMC40LDEuOC0xLjEsMi40Yy0wLjcsMC42LTEuNiwwLjktMi42LDAuOWgtM3YtNi42SDEzNi45eiBNMTc5LjcsMjQuNmw1LjUtNSBsLTEuMiwwbC02LjcsNnYtNi4xaC0yLjh2MTUuNWwyLjgtMC4xdi04LjJsMC41LTAuNWw2LjksOC44aDMuMUwxNzkuNywyNC42eiIvPg0KPC9zdmc+">
</div>

<br>

<audio src="/IFollowRivers.mp3"></audio>
<input id="butt" onclick="disableButton(this)" type="submit" value="ЗМІНА ІНФРАСТРУКТУРИ АКОРДБАНКУ ЗА ОСТАННІ 5 РОКІВ (PUSH)" style="font-weight: bold;font-size:medium;width:100.2%;margin-left: 2px;margin-right: 2px;margin-top: 5px;padding-right: 0px;padding-left: 0px;background-color: lightgrey;color: black">
<div id="container" style="position:center; top:25px; right:25px; width:100%; height: 85%; margin-left: 2px;margin-right: 2px;padding-right: 0px;padding-left: 0px">
    <img id="sm1" class="smile" src="/1.jpeg" style="display: none">
    <img id="sm2" class="smile" src="/2.jpeg" style="display: none">
    <img id="sm3" class="smile" src="/3.jpg" style="display: none">
    <img id="sm4" class="smile" src="/4.jpg" style="display: none">
    <img id="sm5" class="smile" src="/5.jpeg" style="display: none">
    <img id="sm6" class="smile" src="/6.jpeg" style="display: none">
    <div id="seconds-counter"></div>
    <div id="hiddentext" class="textspec"  style="display:none"><div style="text-align: center"><span style="color: red">Акорд</span><span style="color: grey">банк</span><br><span style="line-height: 1.0">відкрив перші 100 відділень</span><br><span style="line-height: 1.0">і займає 11 місце!</span><br><span style="color: #00008b;line-height: 3.0">To Be Continued...</span></div></div>
</div>

</body>
<script>

    var el = document.getElementById('seconds-counter');

    const button = document.querySelector("#butt");
    const icon = document.querySelector("#butt > i");
    const audio = document.querySelector("audio");

    button.addEventListener("click", () => {

        var data =[{"x":"ОЩАДБАНК","value":4586},{"x":"ПРИВАТБАНК","value":2620},{"x":"РАЙФФАЙЗЕН БАНК АВАЛЬ","value":626},{"x":"УКРСИББАНК","value":458},{"x":"УКРГАЗБАНК","value":246},{"x":"ПУМБ","value":216},{"x":"А-БАНК","value":193},{"x":"ПРАВЕКС-БАНК","value":183},{"x":"МЕГАБАНК","value":177},{"x":"СБЕРБАНК","value":173},{"x":"КРЕДІ АГРІКОЛЬ БАНК","value":169},{"x":"ПІВДЕННИЙ","value":142},{"x":"УНІВЕРСАЛ БАНК","value":123},{"x":"ПРОМІНВЕСТБАНК","value":121},{"x":"КРЕДОБАНК","value":111},{"x":"АЛЬФА-БАНК","value":106},{"x":"УКРЕКСІМБАНК","value":103},{"x":"ПОЛТАВА-БАНК","value":97},{"x":"ОТП БАНК","value":86},{"x":"КРЕДИТ-ДНІПРО","value":85},{"x":"ІДЕЯ БАНК","value":83},{"x":"ПРОКРЕДИТ БАНК","value":69},{"x":"ТАСКОМБАНК","value":58},{"x":"КОМІНВЕСТБАНК","value":49},{"x":"АКОРДБАНК","value":5}]

        let chart = anychart.bar();
        chart.left(30);

        let series = chart.bar(data).color('crimson');
        chart.labels(true);

        var labels = chart.xAxis().labels();
        labels.fontSize(10);
        labels.fontColor("black");
        labels.fontWeight(900);
        chart.container("container");
        chart.draw();

        var count = chart.xAxis().labels().getLabelsCount();
        for (var i = 0; i < count; i++) {
            var label = chart.xAxis().labels().getLabel(i);
            value = chart.xAxis().scale().ticks().get()[i];
            if (value === "АКОРДБАНК") {
                label.fontColor("red");
                label.background().enabled(true).stroke("red");
                label.draw();
            }
        }

        if (audio.paused) {
            audio.volume = 0.2;
            audio.play();
        } else {
            audio.pause();
        }

        var addressArr = ['01_01_2016 - 53 місце','01_02_2016 - 53 місце','01_03_2016 - 50 місце','01_04_2016  - 43 місце','01_05_2016 - 32 місце','01_06_2016 - 29 місце','01_07_2016 - 25 місце','01_08_2016 - 25 місце','01_09_2016 - 25 місце','01_10_2016 - 25 місце','01_11_2016 - 25 місце','01_12_2016 - 26 місце','01_01_2017 - 26 місце','01_02_2017 - 26 місце','01_03_2017 - 26 місце','01_04_2017 - 24 місце','01_05_2017 - 24 місце','01_06_2017 - 24 місце','01_07_2017 - 24 місце','01_08_2017 - 23 місце','01_09_2017 - 23 місце','01_10_2017 - 21 місце','01_11_2017 - 21 місце','01_12_2017 - 22 місце','01_01_2018 - 22 місце','01_02_2018 - 22 місце','01_03_2018 - 22 місце','01_04_2018 - 22 місце','01_05_2018 - 22 місце','01_06_2018 - 22 місце','01_07_2018 - 22 місце','01_08_2018 - 22 місце','01_09_2018 - 22 місце','01_10_2018 - 21 місце','01_11_2018 - 21 місце','01_12_2018 - 21 місце','01_01_2019 - 20 місце','01_02_2019 - 20 місце','01_03_2019 - 20 місце','01_04_2019 - 20 місце','01_05_2019 - 20 місце','01_06_2019 - 19 місце','01_07_2019 - 19 місце','01_08_2019 - 19 місце','01_09_2019 - 19 місце','01_10_2019 - 19 місце','01_11_2019 - 19 місце','01_12_2019 - 19 місце','01_01_2020 - 19 місце','01_02_2020 - 19 місце','01_03_2020 - 19 місце','01_04_2020 - 19 місце','01_05_2020 - 19 місце','01_06_2020 - 19 місце','01_07_2020 - 19 місце','01_08_2020 - 19 місце','01_09_2020 - 19 місце','01_10_2020 - 19 місце','01_11_2020 - 19 місце','01_12_2020 - 19 місце','01_01_2021 - 19 місце','01_02_2021 - 19 місце','01_03_2021 - 19 місце','01_04_2021 - 19 місце','01_05_2021 - 19 місце','01_06_2021 - 19 місце','01_07_2021 - 16 місце','01_08_2021 - 16 місце','01_09_2021 - 15 місце','01_10_2021 - 13 місце','01_11_2021 - 12 місце','11_11_2021 - 11 місце'],
            counter = 0,
            timer = setInterval(function(){

                if (counter === addressArr.length) {
                    clearInterval(timer);
                    let x = document.getElementById("hiddentext");
                    let z = document.getElementById("seconds-counter");
                    let y = document.getElementById("sm6");

                    if (x.style.display === "none") {
                        x.style.display = "block";
                    } else {
                        x.style.display = "none";
                    }
                    y.style.display = "none";
                    z.classList.add("blink");
                    setTimeout(fade, 100);

                }

                if (counter === 0){
                    let y = document.getElementById("sm1");
                    y.style.display = "block";
                }
                if (counter === 5){
                    let y = document.getElementById("sm1");
                    y.style.display = "none";
                    let y1 = document.getElementById("sm2");
                    y1.style.display = "block";
                }
                if (counter === 22){
                    let y = document.getElementById("sm2");
                    y.style.display = "none";
                    let y1 = document.getElementById("sm3");
                    y1.style.display = "block";
                }
                if (counter === 46){
                    let y = document.getElementById("sm3");
                    y.style.display = "none";
                    let y1 = document.getElementById("sm4");
                    y1.style.display = "block";
                }
                if (counter === 67){
                    let y = document.getElementById("sm4");
                    y.style.display = "none";
                    let y1 = document.getElementById("sm5");
                    y1.style.display = "block";
                }
                if (counter === 70){
                    let y = document.getElementById("sm5");
                    y.style.display = "none";
                    let y1 = document.getElementById("sm6");
                    y1.style.display = "block";
                }



                el.innerText = addressArr[counter].replace("_",".").replace("_",".");
                showChart(addressArr[counter]);
                counter++

            },500);


        function showChart(selectedvalue) {
          $.getJSON('${pageContext.request.contextPath}/api/divisions/divsall/' + selectedvalue.substring(0,10), function(data) {

              var labels = chart.xAxis().labels();
              labels.fontSize(10);
              labels.fontColor("black");
              labels.fontWeight(900);

                chart.data([]);
                chart.bar(data).color('crimson');
                chart.container('container');
                chart.draw();

              var count = chart.xAxis().labels().getLabelsCount();
              for (var i = 0; i < count; i++) {
                  var label = chart.xAxis().labels().getLabel(i);
                  value = chart.xAxis().scale().ticks().get()[i];
                  if (value === "АКОРДБАНК") {
                      label.fontColor("red");
                      label.background().enabled(true).stroke("red");
                      label.draw();
                  }
              }


                })

        }

    });

    var cnt = document.getElementById('seconds-counter');
    var s = cnt.style;
    function fade(){
        s.transition="opacity 1s";
        s.opacity=0;
    }

</script>

</html>