<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%--<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>--%>

<html>
<head>

    <title>Клієнти</title>

    <meta charset="utf-8" />

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


        $(document).ready(function() {
      anychart.onDocumentLoad(function() {

            chart = anychart.pie([]);
            chart.labels().position("outside");
            let legend = chart.legend();
            legend.maxWidth("100%");
            legend.maxHeight("30%");
            legend.itemsLayout("verticalExpandable");
            legend.position("bottom");
            legend.paginator().orientation("bottom");
            chart.container("container");
            chart.draw();

          });
        });

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
            /* 	font-family: 'Ubuntu', sans-serif; */
            /*font-weight: bold;*/
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


    </style>
</head>
<body>

<div class="text">
    <img class="text" src="data:image/svg+xml;base64,PHN2ZyBpZD0ibC11LWciIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IiB3aWR0aD0iMTg3LjdweCIgaGVpZ2h0PSI0NC44cHgiIHZpZXdCb3g9IjAgMCAxODcuNyA0NC44IiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCAxODcuNyA0NC44OyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+DQo8c3R5bGUgdHlwZT0idGV4dC9jc3MiPg0KCS5zdDB7ZmlsbC1ydWxlOmV2ZW5vZGQ7Y2xpcC1ydWxlOmV2ZW5vZGQ7ZmlsbDojQ0MwMDAwO30NCgkuc3Qxe2ZpbGwtcnVsZTpldmVub2RkO2NsaXAtcnVsZTpldmVub2RkO2ZpbGw6Izk5OTk5OTt9DQo8L3N0eWxlPg0KPHBhdGggY2xhc3M9InN0MCIgZD0iTTQzLjYsMjcuNUwyMi4xLDlMMC42LDI3LjVDMC4yLDI1LjgsMCwyNC4yLDAsMjIuNEMwLDEwLDkuOSwwLDIyLjEsMGMxMi4yLDAsMjIuMSwxMCwyMi4xLDIyLjQgQzQ0LjIsMjQuMiw0NCwyNS44LDQzLjYsMjcuNSBNMTAxLDM1LjFjMy41LDAsNS4yLTAuMiw2LjQtMC41YzIuNC0wLjcsNC0yLjMsNC44LTQuOGMwLjMtMC44LDAuNC0xLjUsMC40LTIuMiBjMC0yLjMtMC45LTQuNC0yLjYtNS45Yy0xLjYtMS40LTMuNi0yLTYtMmgtNC4xYy0wLjUsMC4xLTEsMC4zLTEuMiwwLjdjLTAuMiwwLjQtMC40LDAuOC0wLjUsMS4zdjE5LjZoMi44VjM1LjEgTTEwOC4yLDIyLjggYzAuOCwxLjMsMS4zLDMuMSwxLjMsNC45YzAsMS43LTAuNCwzLjEtMS4zLDQuNGMtMSwxLjQtMi4zLDIuMS0zLjksMi4xbC0zLjMsMFYyMS4xYzAtMC4zLDAuMi0wLjUsMC41LTAuNWwyLjcsMCBDMTA1LjksMjAuNSwxMDcuMywyMS4zLDEwOC4yLDIyLjh6IE04OC4yLDM1LjVjMi4zLDAsNC4yLTAuNyw1LjctMi4yYzEuNS0xLjUsMi4zLTMuNCwyLjMtNS44YzAtMi4zLTAuOC00LjItMi4zLTUuNiBjLTEuNS0xLjUtMy40LTIuMi01LjYtMi4yYy0yLjMsMC00LjIsMC43LTUuNiwyLjJjLTEuNSwxLjUtMi4yLDMuNC0yLjIsNS43YzAsMi4zLDAuNyw0LjIsMi4zLDUuN0M4NC4xLDM0LjgsODYsMzUuNSw4OC4yLDM1LjUgTTkyLjMsMzIuMWMtMSwxLjctMi4zLDIuNi00LDIuNmMtMS43LDAtMy0wLjgtNC0yLjNDODMuNSwzMSw4MywyOS40LDgzLDI3LjZjMC0xLjksMC40LTMuNSwxLjItNC45YzEtMS42LDIuMy0yLjQsNC0yLjQgYzEuNiwwLDIuOSwwLjcsMy45LDIuMmMwLjksMS4zLDEuMywyLjksMS4zLDQuNkM5My41LDI5LjEsOTMuMSwzMC43LDkyLjMsMzIuMXogTTcyLjgsMjQuNmw1LjUtNWgtMS4ybC02LjcsNi4xdi02LjFoLTIuOHYxNS41IGwyLjgtMC4xdi04LjJsMC41LTAuNWw2LjksOC44aDMuMUw3Mi44LDI0LjZ6IE01Ni4yLDEzbC05LjgsMjIuMWgxbDIuOC02LjNoMTBsMi44LDYuM2gzTDU2LjIsMTN6IE01MC43LDI3LjlsNC42LTEwLjNsNC41LDEwLjMgSDUwLjd6IE0xMTQuNSwzNC4ybDUtMTIuM2MwLjEtMC4yLDAuMy0wLjQsMC41LDBjMS42LDQsMy4zLDguMyw0LjksMTIuM0gxMTQuNXogTTExMi4xLDMzLjljMCwwLjUsMC4xLDAuOCwwLjEsMWMwLDAuNiwwLDEtMC4xLDEuMiBoMC4yYzAuMy0wLjMsMC42LTAuNSwxLjEtMC43YzAuNC0wLjEsMC45LTAuMiwxLjUtMC4zYzAuNiwwLDEuNCwwLDIuNSwwaDUuOGMxLjEsMCwyLjYsMCwzLjIsMGMwLjUsMCwxLDAuMSwxLjQsMC4zIGMwLjQsMC4xLDAuNywwLjQsMC45LDAuN2gwLjJjMC0wLjMtMC4xLTAuNy0wLjEtMS4yYzAtMC40LDAtMC43LDAuMS0xaC0xbC01LjUtMTMuMWMtMC4xLTAuMy0wLjMtMC42LTAuNS0wLjggCWMtMC4yLTAuMi0wLjQtMC40LTAuNi0wLjVjLTAuNS0wLjItMC45LTAuMi0xLjQsMGMtMC4yLDAuMS0wLjMsMC4yLTAuNSwwLjRjLTAuMiwwLjItMC4zLDAuNC0wLjUsMC42bC01LjgsMTMuM0gxMTIuMXoiLz4NCjxwYXRoIGNsYXNzPSJzdDEiIGQ9Ik01LjQsMzcuMWwxNi43LTIzbDE2LjcsMjNjLTQuMSw0LjctMTAsNy43LTE2LjcsNy43QzE1LjQsNDQuOCw5LjQsNDEuOCw1LjQsMzcuMSBNMTcyLDE5LjZoLTIuOHY2LjRoLTguMXYtNi40IGgtMi44djE1LjVoMi44di04LjJoOC4xdjguMmgyLjhWMTkuNnogTTE1Mi4xLDIxTDE1Mi4xLDIxYy0wLjItMC40LTAuNC0wLjctMC42LTAuOWMtMC4yLTAuMi0wLjUtMC40LTAuNy0wLjVjLTAuNC0wLjEtMC43LTAuMS0xLjEsMGMtMC4yLDAuMS0wLjQsMC4yLTAuNiwwLjRjLTAuNCwwLjQtMC42LDAuOS0wLjgsMS41bC00LjUsMTMuNmgxLjFsMS4yLTMuN2g2LjhsMS4yLDMuN2gyLjdMMTUyLjEsMjF6ICBNMTQ2LjQsMzAuNGMxLTMsMi02LDMtOWMwLTAuMSwwLjItMC4zLDAuMywwbDIuOCw5SDE0Ni40eiBNMTMxLDIxLjdjMC4xLTAuNSwwLjItMC45LDAuNS0xLjNjMC4zLTAuNSwwLjgtMC43LDEuNC0wLjhsNy44LDB2MC45IGMtMi4yLDAtNC40LDAtNi42LDBjLTAuMiwwLTAuMywwLjEtMC4zLDAuNGwwLDUuNmMwLjIsMCwwLjYsMCwxLjIsMGMwLjUsMCwwLjksMCwxLjIsMGMyLDAsMy41LDAuMiw0LjUsMC43IGMxLjUsMC43LDIuMiwxLjksMi4yLDMuN2MwLDEuMy0wLjUsMi40LTEuNiwzLjJjLTEsMC43LTIuMSwxLjEtMy41LDEuMUgxMzFWMjEuOEMxMzEsMjEuOCwxMzEsMjEuNywxMzEsMjEuN0wxMzEsMjEuNyBNMTM2LjksMjcuNSBjMSwwLDEuOSwwLjMsMi42LDAuOWMwLjcsMC42LDEuMSwxLjQsMS4xLDIuNGMwLDEtMC40LDEuOC0xLjEsMi40Yy0wLjcsMC42LTEuNiwwLjktMi42LDAuOWgtM3YtNi42SDEzNi45eiBNMTc5LjcsMjQuNmw1LjUtNSBsLTEuMiwwbC02LjcsNnYtNi4xaC0yLjh2MTUuNWwyLjgtMC4xdi04LjJsMC41LTAuNWw2LjksOC44aDMuMUwxNzkuNywyNC42eiIvPg0KPC9zdmc+">
</div>



<div id="container" style="position:absolute; top:25px; right:20px; width:500px; height:500px;"></div>
<div id="seconds-counter"></div>
<%--<select id="locality-dropdown" name="locality">
</select>--%>

<%--<h5 class="text">Created by Nazar Mykhailechko</h5>--%>
<audio src="/ChiMai.mp3"></audio>
<button id="butt">play</button>
<button id="dat">change</button>
</body>
<script>

    var seconds = 0;
    var el = document.getElementById('seconds-counter');

    function incrementSeconds() {
        seconds += 1;
        el.innerText = "You have been here for " + seconds + " seconds.";
    }

    var cancel = setInterval(incrementSeconds, 1000);

    const button = document.querySelector("#butt");
    const icon = document.querySelector("#butt > i");
    const audio = document.querySelector("audio");

    button.addEventListener("click", () => {


        if (audio.paused) {
            audio.volume = 0.2;
            audio.play();
        } else {
            audio.pause();
        }
    });

    window.addEventListener('DOMContentLoaded', function() {

        var data = [
            ["John", 10000],
            ["Jake", 12000],
            ["Peter", 13000],
            ["James", 10000],
            ["Mary", 9000]
        ];

        let chart = anychart.bar();

// create a bar series and set the data
        let series = chart.bar(data);

// set the container id
        chart.container("container");

// initiate drawing the chart
        chart.draw();

        //init chart
/*
        let chart = anychart.pie([{x: "пусто", value: 0}]);
        chart.labels().position("outside");
        let legend = chart.legend();
        legend.maxWidth("100%");
        legend.maxHeight("30%");
        legend.itemsLayout("verticalExpandable");
        legend.position("bottom");
        legend.paginator().orientation("bottom");
        chart.container("container");
        chart.draw();
*/

        //keep chart updated to match dropdown
        const selectElem = document.querySelector('#dat');
        selectElem.addEventListener('click', event => {
            //showChartFor(event.target.value);
            showChartFor(event.target.value);
        });
        //showChartFor(selectElem.value);

        function showChartFor(selectedvalue) {
/*            $.getJSON('${pageContext.request.contextPath}/api/clients/findallmanagerstatusforchart/' + selectedvalue, function(data) {

                chart.data(data);
                chart.container('container');
                chart.draw();
                })*/

            var data = [
                ["John", 12000],
                ["Jake", 11000],
                ["Peter", 10000],
                ["James", 15000],
                ["Mary", 14000]
            ];

            chart.data(data);
            chart.container('container');
            chart.draw();

           /* $('#clientslistbymanager').DataTable({
                pageLength : 200,
                ajax : {
                    url : '${pageContext.request.contextPath}/api/clients/findallmanagerbyname/' + selectedvalue,
                    dataSrc : ''
                },
                scrollx: true,
                fixedHeader: {
                    header: true,
                },
                paging: true,
                select: true,
                destroy: true,
                columns : [{
                    title : 'Змінити',
                    data : 'pr',
                    "render": function(data, type, row, meta){
                        if(type === 'display'){
                            data = '<a href="/mainform/updateclient/' + data + '">Змінити</a>';
                        }
                        return data;
                    }
                }, {
                    title : 'ЄДРПОУ',
                    data : 'pr',
                    "render": function(data, type, row, meta){
                        if(type === 'display'){
                            data = '<a href="/mainform/updateclient/' + data + '">' + data + '</a>';
                        }
                        return data;
                    }
                }, {
                    title : 'Назва клієнта',
                    data : 'client_name'
                }, {
                    title : 'Дата останнього контакту',
                    data : 'last_date_contact'
                }, {
                    title : 'Результат останнього контакту',
                    data : 'last_client_result'
                }, {
                    title : 'Історія взаємовідносин з клієнтом/коментарі',
                    data : 'client_history'
                }, {
                    title : 'Статус',
                    data : 'status'
                }, {
                    title : 'Коментарі',
                    data : 'comments'
                }
                ]
            });

            }*/
        }
    });

</script>

</html>