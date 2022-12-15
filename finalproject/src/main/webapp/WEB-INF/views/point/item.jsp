<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>태그 생성</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="./css/reset.css">
    <link rel="stylesheet" type="text/css" href="./css/commons.css">

    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
    <style>
        .fa-xmark {
            cursor: pointer;
            margin-left: 1em;
            color: red;
        }
        #to-do-list {
            list-style: none;
            line-height: 1.3;
            font-size: 20px;
        }
        #to-do-list > li{
            border:1px solid black;
            padding:0.5em;
        }
    </style>

    <!-- jquery를 사용하기 위하여 라이브러리 js 파일을 불러온다-->
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <script type="text/javascript">
        $(function(){
            //목표 : 추가버튼을 누르면 값을 불러와 태그를 만들고 설정한 뒤 리스트에 추가
            $("#btn-add").click(function(){
                var item = $("#user-input").val();
                if(!item.trim()) return;

                //$("li") 라고 작성하면 li를 선택하라는 의미이다.
                //$("<li>") 라고 작성하면 li를 생성하라는 의미이다.
                
                //li 태그를 생성하고 item을 글자로 설정한 뒤 #to-do-list에 추가하세요
                
                //$("<li>").text(item).appendTo("#to-do-list");

                //li와 버튼을 생성하고 버튼 -> li -> #to-do-list 형태로 추가
                //var button = $("<button>").text("x");
                var button = $("<i>").addClass("fa-solid fa-xmark");
                var li = $("<li>").text(item);

                //버튼 이벤트 설정
                button.click(function(){
                    $(this).parent().remove();
                });

                button.appendTo(li);//li.append(button);
                li.appendTo("#to-do-list");//$("#to-do-list").append(li);
                
                $("#user-input").val("");
            });

            //.btn-pass를 누르면 beforeonload 이벤트를 제거하고 보내준다!
            $(".btn-pass").click(function(){
                $(window).off("beforeunload");   
                return true;   
            });
        });

        //(+추가) 이탈 방지 처리 - beforeunload 이벤트
        $(window).on("beforeunload", function(){
            return false;
        });
    </script>

</head>
<body>

    <!-- HTML 화면 -->
    <div class="container-500">
        <div class="row center">
            <h1>오늘의 할일</h1>
        </div>

        <div class="row">
            <input type="text" id="user-input" class="input w-100">
        </div> 
        
        <div class="row right">
            <button id="btn-add" class="btn btn-positive">
                <i class="fa-solid fa-plus"></i>
                추가
            </button>
        </div>

        <hr>

        <div class="row">
            <ul id="to-do-list"></ul>
        </div>

        <div class="row">
            <a href="https://www.google.com" class="btn btn-neutral btn-pass">구글로 이동</a>
        </div>
    </div>
    
</body>
</html>