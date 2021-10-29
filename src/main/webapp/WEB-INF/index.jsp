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

    <%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--%>
    <%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2-bootstrap-css/1.4.6/select2-bootstrap.min.css">--%>
    <%--    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.4/css/select2.min.css" rel="stylesheet" />--%>
    <%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.2.1/js/bootstrap.min.js"></script>--%>
    <%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.4/js/select2.min.js"></script>--%>

    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <%--script src = "http://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js" defer ></script>--%>

    <script src="https://cdn.anychart.com/releases/8.9.0/js/anychart-base.min.js" type="text/javascript"></script>
    <script src="https://cdn.anychart.com/js/latest/anychart-bundle.min.js"></script>
    <%--<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" type="text/css" rel="stylesheet" />
        <!--Import jQuery before export.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>--%>


    <script type="text/javascript">

            function disableButton(btn) {
                document.getElementById(btn.id).disabled = true;
            }

    </script>

    <style type="text/css">

        .tabs { width: 100%; padding: 0px; margin: 0 auto; }
        .tabs>input { display: none; }
        .tabs>div {
            display: none;
            padding: 12px;
            border: 1px solid #C0C0C0;
            background: #FFFFFF;
        }
        .tabs>label {
            font-family: "Helvetica Neue", Helvetica, sans-serif;
            font-size: small;
            display: inline-block;
            padding: 7px;
            margin: 0 -5px -1px 0;
            text-align: center;
            color: #666666;
            border: 1px solid #C0C0C0;
            background: #E0E0E0;
            cursor: pointer;
        }
        .tabs>input:checked + label {
            color: #000000;
            border: 1px solid #C0C0C0;
            border-bottom: 1px solid #FFFFFF;
            background: #FFFFFF;
        }
        #tab_1:checked ~ #txt_1,
        #tab_2:checked ~ #txt_2,
        #tab_3:checked ~ #txt_3,
        #tab_4:checked ~ #txt_4 { display: block; }

        .blue-button{
            background: #25A6E1;
            padding:3px 5px;
            color:#fff;
            font-family:'Helvetica Neue',sans-serif;
            font-size:12px;
            border-radius:2px;
            -moz-border-radius:2px;
            -webkit-border-radius:4px;
            border:1px solid #1A87B9
        }

        table {
            font-family: "Helvetica Neue", Helvetica, sans-serif;
            font-size: xx-small;
            /*width: 100%; padding: 0px; margin: 0 auto;*/
        }
        th {
            background:  crimson;
            color: white;
            position: -webkit-sticky;
            position: sticky;
            top: 0;
            z-index: 2;
            /*height: 110px;*/
        }
        td,th{
            border: 1px solid gray;
            text-align: left;
            padding: 5px 10px;
        }

        .text {
            text-align: center;
        }

        h1,h2,h3{
            color: red;
        }

        .center-justified {
            text-align: justify;
            margin: 0 auto;
            width: 60em;
            font-size: small;
        }

        body {
            /*font-size: xx-small;*/
            /* 	font-family: 'Ubuntu', sans-serif; */
            /*font-weight: bold;*/
            /*//height: 85%;*/
        }
        .select2-container {
            min-width: 800px;
        }

        .select2-results__option {
            padding-right: 20px;
            vertical-align: middle;
        }
        .select2-results__option:before {
            content: "";
            display: inline-block;
            position: relative;
            height: 20px;
            width: 20px;
            border: 2px solid #e9e9e9;
            border-radius: 4px;
            background-color: #fff;
            margin-right: 20px;
            vertical-align: middle;
        }
        .select2-results__option[aria-selected=true]:before {
            font-family:fontAwesome;
            content: "\f00c";
            color: #fff;
            background-color: red;
            border: 0;
            display: inline-block;
            padding-left: 3px;
        }


        .select2-container--default .select2-results__option[aria-selected=true] {
            background-color: #fff;
        }
        .select2-container--default .select2-results__option--highlighted[aria-selected] {
            background-color: #eaeaeb;
            color: #272727;
        }
        .select2-container--default .select2-selection--multiple {
            margin-bottom: 10px;
        }
        .select2-container--default.select2-container--open.select2-container--below .select2-selection--multiple {
            border-radius: 4px;
        }

        .select2-container--default.select2-container--focus .select2-selection--multiple {
            border-color: red;
            border-width: 2px;
        }

        .select2-container--open .select2-dropdown--below {

            border-radius: 6px;
            box-shadow: 0 0 10px rgba(0,0,0,0.5);

        }
        .select2-selection .select2-selection--multiple:after {
            content: 'hhghgh';
        }

        /* select with icons badges single*/
        .select-icon .select2-selection__placeholder .badge {
            display: none;
        }

        .select-icon .placeholder {
            /* 	display: none; */
        }
        .select-icon .select2-results__option:before,
        .select-icon .select2-results__option[aria-selected=true]:before {
            display: none !important;
            /* content: "" !important; */
        }
        .select-icon  .select2-search--dropdown {
            display: none;
        }

        .ok{
            background:  green;
        }

        .right{
            background:  black;
        }

        .minus{
            background:  red;
        }

        .plus{
            background:  green;
        }


        .table-wrapper {
            position:relative;
        }
        .table-scroll {
            height:570px;
            overflow:auto;
            margin-top:5px;
        }
        .table-wrapper table {
            width:100%;


        }
        .table-wrapper table * {
        //background:yellow;
        //color:black;
        }
        .table-wrapper table thead th .text {
            position:absolute;
            top:-20px;
            z-index:2;
            height:20px;
            width:35%;
            border:1px solid red;
        }

        .front-sign-in {
            padding-top: 9px;
            padding-right: 9px;
            position: absolute;
            top: 0;
            right:0;
            width: inherit;
            -webkit-transition: -webkit-transform 0.6s;
            -moz-transition: -moz-transform 0.6s;
            -o-transition: -o-transform 0.6s;
            transition: transform 0.6s;
            display : inline-block;
            text-align: right;
            font-size: medium;
        }
        .front-sign-in-right {
            padding-top: 9px;
            padding-right: 9px;
            position: absolute;
            top: 0;
            right:0;
            width: inherit;
            -webkit-transition: -webkit-transform 0.6s;
            -moz-transition: -moz-transform 0.6s;
            -o-transition: -o-transform 0.6s;
            transition: transform 0.6s;
            display : inline-block;
            text-align: right;
            font-family: "Helvetica Neue", Helvetica, sans-serif;
            font-size: small;
        }
        .front-sign-in-left {
            padding-top: 9px;
            position: absolute;
            top: 0;
            /*right:0;*/
            width: inherit;
            -webkit-transition: -webkit-transform 0.6s;
            -moz-transition: -moz-transform 0.6s;
            -o-transition: -o-transform 0.6s;
            transition: transform 0.6s;
            display : inline-block;
            font-family: "Helvetica Neue", Helvetica, sans-serif;
            font-size: small;
        }
        #container {
            border: 1px solid black;

        }

        .bottom-right {
            position: absolute;
            bottom: 100px;
            right: 16px;
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
            bottom:35%;
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
    </style>
</head>
<body>

<div class="text">
    <img class="text" style="width:15%;" src="data:image/svg+xml;base64,PHN2ZyBpZD0ibC11LWciIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IiB3aWR0aD0iMTg3LjdweCIgaGVpZ2h0PSI0NC44cHgiIHZpZXdCb3g9IjAgMCAxODcuNyA0NC44IiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCAxODcuNyA0NC44OyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+DQo8c3R5bGUgdHlwZT0idGV4dC9jc3MiPg0KCS5zdDB7ZmlsbC1ydWxlOmV2ZW5vZGQ7Y2xpcC1ydWxlOmV2ZW5vZGQ7ZmlsbDojQ0MwMDAwO30NCgkuc3Qxe2ZpbGwtcnVsZTpldmVub2RkO2NsaXAtcnVsZTpldmVub2RkO2ZpbGw6Izk5OTk5OTt9DQo8L3N0eWxlPg0KPHBhdGggY2xhc3M9InN0MCIgZD0iTTQzLjYsMjcuNUwyMi4xLDlMMC42LDI3LjVDMC4yLDI1LjgsMCwyNC4yLDAsMjIuNEMwLDEwLDkuOSwwLDIyLjEsMGMxMi4yLDAsMjIuMSwxMCwyMi4xLDIyLjQgQzQ0LjIsMjQuMiw0NCwyNS44LDQzLjYsMjcuNSBNMTAxLDM1LjFjMy41LDAsNS4yLTAuMiw2LjQtMC41YzIuNC0wLjcsNC0yLjMsNC44LTQuOGMwLjMtMC44LDAuNC0xLjUsMC40LTIuMiBjMC0yLjMtMC45LTQuNC0yLjYtNS45Yy0xLjYtMS40LTMuNi0yLTYtMmgtNC4xYy0wLjUsMC4xLTEsMC4zLTEuMiwwLjdjLTAuMiwwLjQtMC40LDAuOC0wLjUsMS4zdjE5LjZoMi44VjM1LjEgTTEwOC4yLDIyLjggYzAuOCwxLjMsMS4zLDMuMSwxLjMsNC45YzAsMS43LTAuNCwzLjEtMS4zLDQuNGMtMSwxLjQtMi4zLDIuMS0zLjksMi4xbC0zLjMsMFYyMS4xYzAtMC4zLDAuMi0wLjUsMC41LTAuNWwyLjcsMCBDMTA1LjksMjAuNSwxMDcuMywyMS4zLDEwOC4yLDIyLjh6IE04OC4yLDM1LjVjMi4zLDAsNC4yLTAuNyw1LjctMi4yYzEuNS0xLjUsMi4zLTMuNCwyLjMtNS44YzAtMi4zLTAuOC00LjItMi4zLTUuNiBjLTEuNS0xLjUtMy40LTIuMi01LjYtMi4yYy0yLjMsMC00LjIsMC43LTUuNiwyLjJjLTEuNSwxLjUtMi4yLDMuNC0yLjIsNS43YzAsMi4zLDAuNyw0LjIsMi4zLDUuN0M4NC4xLDM0LjgsODYsMzUuNSw4OC4yLDM1LjUgTTkyLjMsMzIuMWMtMSwxLjctMi4zLDIuNi00LDIuNmMtMS43LDAtMy0wLjgtNC0yLjNDODMuNSwzMSw4MywyOS40LDgzLDI3LjZjMC0xLjksMC40LTMuNSwxLjItNC45YzEtMS42LDIuMy0yLjQsNC0yLjQgYzEuNiwwLDIuOSwwLjcsMy45LDIuMmMwLjksMS4zLDEuMywyLjksMS4zLDQuNkM5My41LDI5LjEsOTMuMSwzMC43LDkyLjMsMzIuMXogTTcyLjgsMjQuNmw1LjUtNWgtMS4ybC02LjcsNi4xdi02LjFoLTIuOHYxNS41IGwyLjgtMC4xdi04LjJsMC41LTAuNWw2LjksOC44aDMuMUw3Mi44LDI0LjZ6IE01Ni4yLDEzbC05LjgsMjIuMWgxbDIuOC02LjNoMTBsMi44LDYuM2gzTDU2LjIsMTN6IE01MC43LDI3LjlsNC42LTEwLjNsNC41LDEwLjMgSDUwLjd6IE0xMTQuNSwzNC4ybDUtMTIuM2MwLjEtMC4yLDAuMy0wLjQsMC41LDBjMS42LDQsMy4zLDguMyw0LjksMTIuM0gxMTQuNXogTTExMi4xLDMzLjljMCwwLjUsMC4xLDAuOCwwLjEsMWMwLDAuNiwwLDEtMC4xLDEuMiBoMC4yYzAuMy0wLjMsMC42LTAuNSwxLjEtMC43YzAuNC0wLjEsMC45LTAuMiwxLjUtMC4zYzAuNiwwLDEuNCwwLDIuNSwwaDUuOGMxLjEsMCwyLjYsMCwzLjIsMGMwLjUsMCwxLDAuMSwxLjQsMC4zIGMwLjQsMC4xLDAuNywwLjQsMC45LDAuN2gwLjJjMC0wLjMtMC4xLTAuNy0wLjEtMS4yYzAtMC40LDAtMC43LDAuMS0xaC0xbC01LjUtMTMuMWMtMC4xLTAuMy0wLjMtMC42LTAuNS0wLjggCWMtMC4yLTAuMi0wLjQtMC40LTAuNi0wLjVjLTAuNS0wLjItMC45LTAuMi0xLjQsMGMtMC4yLDAuMS0wLjMsMC4yLTAuNSwwLjRjLTAuMiwwLjItMC4zLDAuNC0wLjUsMC42bC01LjgsMTMuM0gxMTIuMXoiLz4NCjxwYXRoIGNsYXNzPSJzdDEiIGQ9Ik01LjQsMzcuMWwxNi43LTIzbDE2LjcsMjNjLTQuMSw0LjctMTAsNy43LTE2LjcsNy43QzE1LjQsNDQuOCw5LjQsNDEuOCw1LjQsMzcuMSBNMTcyLDE5LjZoLTIuOHY2LjRoLTguMXYtNi40IGgtMi44djE1LjVoMi44di04LjJoOC4xdjguMmgyLjhWMTkuNnogTTE1Mi4xLDIxTDE1Mi4xLDIxYy0wLjItMC40LTAuNC0wLjctMC42LTAuOWMtMC4yLTAuMi0wLjUtMC40LTAuNy0wLjVjLTAuNC0wLjEtMC43LTAuMS0xLjEsMGMtMC4yLDAuMS0wLjQsMC4yLTAuNiwwLjRjLTAuNCwwLjQtMC42LDAuOS0wLjgsMS41bC00LjUsMTMuNmgxLjFsMS4yLTMuN2g2LjhsMS4yLDMuN2gyLjdMMTUyLjEsMjF6ICBNMTQ2LjQsMzAuNGMxLTMsMi02LDMtOWMwLTAuMSwwLjItMC4zLDAuMywwbDIuOCw5SDE0Ni40eiBNMTMxLDIxLjdjMC4xLTAuNSwwLjItMC45LDAuNS0xLjNjMC4zLTAuNSwwLjgtMC43LDEuNC0wLjhsNy44LDB2MC45IGMtMi4yLDAtNC40LDAtNi42LDBjLTAuMiwwLTAuMywwLjEtMC4zLDAuNGwwLDUuNmMwLjIsMCwwLjYsMCwxLjIsMGMwLjUsMCwwLjksMCwxLjIsMGMyLDAsMy41LDAuMiw0LjUsMC43IGMxLjUsMC43LDIuMiwxLjksMi4yLDMuN2MwLDEuMy0wLjUsMi40LTEuNiwzLjJjLTEsMC43LTIuMSwxLjEtMy41LDEuMUgxMzFWMjEuOEMxMzEsMjEuOCwxMzEsMjEuNywxMzEsMjEuN0wxMzEsMjEuNyBNMTM2LjksMjcuNSBjMSwwLDEuOSwwLjMsMi42LDAuOWMwLjcsMC42LDEuMSwxLjQsMS4xLDIuNGMwLDEtMC40LDEuOC0xLjEsMi40Yy0wLjcsMC42LTEuNiwwLjktMi42LDAuOWgtM3YtNi42SDEzNi45eiBNMTc5LjcsMjQuNmw1LjUtNSBsLTEuMiwwbC02LjcsNnYtNi4xaC0yLjh2MTUuNWwyLjgtMC4xdi04LjJsMC41LTAuNWw2LjksOC44aDMuMUwxNzkuNywyNC42eiIvPg0KPC9zdmc+">
</div>

<br>

<audio src="/Follow.mp3"></audio>
<%--<button id="butt">play</button--%>
<input id="butt" onclick="disableButton(this)" type="submit" value="ЗМІНА ІНФРАСТРУКТУРИ АКОРДБАНКУ ЗА ОСТАННІ 6 РОКІВ (PUSH)" style="font-weight: bold;font-size:medium;width:100.2%;margin-left: 2px;margin-right: 2px;margin-top: 5px;padding-right: 0px;padding-left: 0px;background-color: lightgrey;color: black">
<div id="container" style="position:center; top:25px; right:25px; width:100%; height: 85%; margin-left: 2px;margin-right: 2px;padding-right: 0px;padding-left: 0px">
    <div id="seconds-counter"></div>
    <div id="hiddentext" class="textspec"  style="display:none"><div style="text-align: center">АКОРДБАНК<br>відкрив 100 відділень<br>і займає 11 місце!</div></div>
    <%--<div id="hiddentext" class="textspec" style="font-size:100px;display:none">Check</div>--%>
</div>

<%--<select id="locality-dropdown" name="locality">
</select>--%>

<%--<h5 class="text">Created by Nazar Mykhailechko</h5>--%>


<%--<button id="dat">change</button>--%>
</body>
<script>

    var seconds = 0;
    var seconds1 = 0;
    var seconds2 = 0;
    var seconds3 = 0;
    var seconds4 = 0;

    var el = document.getElementById('seconds-counter');


    const button = document.querySelector("#butt");
    const icon = document.querySelector("#butt > i");
    const audio = document.querySelector("audio");

    button.addEventListener("click", () => {

        //var data =[{"x":"ОЩАДБАНК","value":4586},{"x":"ПРИВАТБАНК","value":2620},{"x":"РАЙФФАЙЗЕН БАНК АВАЛЬ","value":626},{"x":"УКРСИББАНК","value":458},{"x":"УКРГАЗБАНК","value":246},{"x":"ПУМБ","value":216},{"x":"АКЦЕНТ-БАНК","value":193},{"x":"ПРАВЕКС-БАНК","value":183},{"x":"МЕГАБАНК","value":177},{"x":"СБЕРБАНК","value":173},{"x":"КРЕДІ АГРІКОЛЬ БАНК","value":169},{"x":"ПІВДЕННИЙ","value":142},{"x":"УНІВЕРСАЛ БАНК","value":123},{"x":"ПРОМІНВЕСТБАНК","value":121},{"x":"КРЕДОБАНК","value":111},{"x":"АЛЬФА-БАНК","value":106},{"x":"УКРЕКСІМБАНК","value":103},{"x":"ПОЛТАВА-БАНК","value":97},{"x":"ОТП БАНК","value":86},{"x":"КРЕДИТ-ДНІПРО","value":85},{"x":"ІДЕЯ БАНК","value":83},{"x":"ПРОКРЕДИТ БАНК","value":69},{"x":"ТАСКОМБАНК","value":58},{"x":"КОМІНВЕСТБАНК","value":49},{"x":"АЙБОКС БАНК","value":48},{"x":"МЕТАБАНК","value":44},{"x":"МТБ БАНК","value":43},{"x":"ПЕРШИЙ ІНВЕСТИЦІЙНИЙ БАНК","value":37},{"x":"ІНДУСТРІАЛБАНК","value":37},{"x":"АКОРДБАНК","value":5}]
        var data =[{"x":"ОЩАДБАНК","value":4586},{"x":"ПРИВАТБАНК","value":2620},{"x":"РАЙФФАЙЗЕН БАНК АВАЛЬ","value":626},{"x":"УКРСИББАНК","value":458},{"x":"УКРГАЗБАНК","value":246},{"x":"ПУМБ","value":216},{"x":"АКЦЕНТ-БАНК","value":193},{"x":"ПРАВЕКС-БАНК","value":183},{"x":"МЕГАБАНК","value":177},{"x":"СБЕРБАНК","value":173},{"x":"КРЕДІ АГРІКОЛЬ БАНК","value":169},{"x":"ПІВДЕННИЙ","value":142},{"x":"УНІВЕРСАЛ БАНК","value":123},{"x":"ПРОМІНВЕСТБАНК","value":121},{"x":"КРЕДОБАНК","value":111},{"x":"АЛЬФА-БАНК","value":106},{"x":"УКРЕКСІМБАНК","value":103},{"x":"ПОЛТАВА-БАНК","value":97},{"x":"ОТП БАНК","value":86},{"x":"АКОРДБАНК","value":5}]



        let chart = anychart.bar();//.color('crimson');
        chart.left(30);

        //chart.yAxis().labels().width(200);
        let series = chart.bar(data).color('crimson');
        chart.labels(true);
        //chart.labels(true).background().enabled(true).stroke("red");
        var labels = chart.xAxis().labels();
        labels.fontSize(13);
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

        //var addressArr = ['01_01_2016','01_02_2016','01_03_2016','01_04_2016','01_05_2016','01_06_2016','01_07_2016','01_08_2016','01_09_2016','01_10_2016','01_11_2016','01_12_2016','01_01_2017','01_02_2017','01_03_2017','01_04_2017','01_05_2017','01_06_2017','01_07_2017','01_08_2017','01_09_2017','01_10_2017','01_11_2017','01_12_2017','01_01_2018','01_02_2018','01_03_2018','01_04_2018','01_05_2018','01_06_2018','01_07_2018','01_08_2018','01_09_2018','01_10_2018','01_11_2018','01_12_2018','01_01_2019','01_02_2019','01_03_2019','01_04_2019','01_05_2019','01_06_2019','01_07_2019','01_08_2019','01_09_2019','01_10_2019','01_11_2019','01_12_2019','01_01_2020','01_02_2020','01_03_2020','01_04_2020','01_05_2020','01_06_2020','01_07_2020','01_08_2020','01_09_2020','01_10_2020','01_11_2020','01_12_2020','01_01_2021','01_02_2021','01_03_2021','01_04_2021','01_05_2021','01_06_2021','01_07_2021','01_08_2021','01_09_2021','01_10_2021'],
        var addressArr = ['01_01_2016 - 53 місце','01_02_2016 - 53 місце','01_03_2016 - 50 місце','01_04_2016  - 43 місце','01_05_2016 - 32 місце','01_06_2016 - 29 місце','01_07_2016 - 25 місце','01_08_2016 - 25 місце','01_09_2016 - 25 місце','01_10_2016 - 25 місце','01_11_2016 - 25 місце','01_12_2016 - 26 місце','01_01_2017 - 26 місце','01_02_2017 - 26 місце','01_03_2017 - 26 місце','01_04_2017 - 24 місце','01_05_2017 - 24 місце','01_06_2017 - 24 місце','01_07_2017 - 24 місце','01_08_2017 - 23 місце','01_09_2017 - 23 місце','01_10_2017 - 21 місце','01_11_2017 - 21 місце','01_12_2017 - 22 місце','01_01_2018 - 22 місце','01_02_2018 - 22 місце','01_03_2018 - 22 місце','01_04_2018 - 22 місце','01_05_2018 - 22 місце','01_06_2018 - 22 місце','01_07_2018 - 22 місце','01_08_2018 - 22 місце','01_09_2018 - 22 місце','01_10_2018 - 21 місце','01_11_2018 - 21 місце','01_12_2018 - 21 місце','01_01_2019 - 20 місце','01_02_2019 - 20 місце','01_03_2019 - 20 місце','01_04_2019 - 20 місце','01_05_2019 - 20 місце','01_06_2019 - 19 місце','01_07_2019 - 19 місце','01_08_2019 - 19 місце','01_09_2019 - 19 місце','01_10_2019 - 19 місце','01_11_2019 - 19 місце','01_12_2019 - 19 місце','01_01_2020 - 19 місце','01_02_2020 - 19 місце','01_03_2020 - 19 місце','01_04_2020 - 19 місце','01_05_2020 - 19 місце','01_06_2020 - 19 місце','01_07_2020 - 19 місце','01_08_2020 - 19 місце','01_09_2020 - 19 місце','01_10_2020 - 19 місце','01_11_2020 - 19 місце','01_12_2020 - 19 місце','01_01_2021 - 19 місце','01_02_2021 - 19 місце','01_03_2021 - 19 місце','01_04_2021 - 19 місце','01_05_2021 - 19 місце','01_06_2021 - 19 місце','01_07_2021 - 16 місце','01_08_2021 - 16 місце','01_09_2021 - 15 місце','01_10_2021 - 13 місце'],
            counter = 0,
            timer = setInterval(function(){

                el.innerText = addressArr[counter].replace("_",".").replace("_",".");
                showChart(addressArr[counter]);
                //codeAddress(addressArr[counter]);
                counter++
                if (counter === addressArr.length) {
                    clearInterval(timer);
                    let x = document.getElementById("hiddentext");

                    if (x.style.display === "none") {
                        x.style.display = "block";
                    } else {
                        x.style.display = "none";
                    }

                }
            },500);


        function showChart(selectedvalue) {
          $.getJSON('${pageContext.request.contextPath}/api/divisions/divsall/' + selectedvalue.substring(0,10), function(data) {

              var labels = chart.xAxis().labels();
              labels.fontSize(13);
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


</script>

</html>