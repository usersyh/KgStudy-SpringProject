<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- fontawesome css: https://fontawesome.com -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">


    <!-- reset.css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />


    <!-- linear icons -->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css" />

    <!-- custom css -->
    <link rel="stylesheet" href="main.css" />


    <!-- custom js -->
    <script src="./app.js" defer></script>


</head>

<body>

    <div class="wrapper">



        <section class="loginSection">
            <div class="loginMain">
                <div id="login">
                    <div class="idBlock loginBlock clearfix">
                        <div class="loginIcon idIcon"><i class="fa-solid fa-id-badge fa-2x"></i></div>
                        <input id="id" type="text" placeholder="아이디를 입력하세요" autofocus>
                    </div>
                    <div class="pwBlock loginBlock clearfix">
                        <div class="loginIcon pwIcon"><i class="fa-solid fa-key fa-2x"></i></div>
                        <input id="password" type="password" type="text" placeholder="비밀번호를 입력하세요">
                    </div>
                </div>
                <div class="loginButton">
                    <button id="loginBtn"><i class="fa-solid fa-lock fa-4x"></i></button>
                </div>
            </div>
        </section>



        <div class="main">

            <div>
                <aside class="userSection">
                    <div id="user">
                        <div class="name">
                            <i class="fa-solid fa-circle-user fa-2x"></i>
                            <span>user</span>
                        </div>
                        <div class="intro clearfix">
                            <div class="introText">
                                <span>소개글을 입력해주세요.</span>
                            </div>
                            <button><i class="fa-solid fa-pen-to-square"></i></button>
                        </div>
                        <div class="logoutBtn">
                            <button>로그아웃<i class="fa-solid fa-right-from-bracket"></i></button>
                        </div>
                    </div>
                </aside>


            </div>

            <div class="page">
                <div id="txtContent" contenteditable="true">
                    <h1>제목</h1>
                    내용을 입력하세요
                </div>

            </div>
            <span id="pageNum">- 1 -</span>
            <div class="pageBtn">

                <button class="prev-page fa-solid fa-xs"></button>

                <button class="next-page fa-solid fa-xs fa-plus"></button>
            </div>

            <aside class="nav">

                <button class="time-stamp">타임스탬프</button>
                <div class="iconDropdown">
                    <div class="dropdown-content">Select Icon
                        <div class="drop-wrapper">
                            <i class="fa-regular fa-address-card chover">명함</i>
                            <i class="fa-regular fa-credit-card chover">카드</i>
                            <i class="fa-regular fa-bell chover">알림</i>
                            <i class="fa-regular fa-hand-point-up chover">포인트</i>
                            <i class="fa-regular fa-heart chover">좋아요</i>
                            <i class="fa-regular fa-hospital chover">병원</i>
                            <i class="fa-regular fa-square-check chover">체크</i>
                        </div>
                    </div>
                </div>

            </aside>

        </div>


    </div>

</body>

</html>