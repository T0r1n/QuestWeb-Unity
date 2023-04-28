<?php
    $QC = $_POST['QCode'];
    $Command = $_POST['Command'];


    $pdo = new PDO('mysql:host=localhost;dbname=Quest-DB;charset=utf8;','root', '123456');

    $sql = "SELECT `q_text`,`q_answer`,`q_hint`,`q_pic` FROM `QUESTIONS` WHERE `quest` = '$QC'";
    $sql1 = "SELECT COUNT(q_text) FROM `QUESTIONS` WHERE quest = '$QC'";




    if($Command == "get"){
        $statement = $pdo->query($sql);
        $res = $statement->fetchAll(PDO::FETCH_ASSOC);
        //printf($res[0]["q_text"]);
        //printf($res[0]["q_answer"]);
        $json =  json_encode($res,JSON_UNESCAPED_UNICODE);

        //header('Content-Type: application/json; charset=utf-8');
        printf($json);
    }
    elseif ($Command == "CROOM"){
        $statement = $pdo->query($sql1);
        $res = $statement->fetchAll(PDO::FETCH_ASSOC);
        print($res[0]["COUNT(q_text)"]);
    }
    

?>
