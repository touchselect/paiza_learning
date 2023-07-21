<!-- A さんと B さんは次の操作を交互に繰り返すことで陣取りゲームをしようと考えました。 2 人の操作によって盤面が変化しなくなったらゲームを終了します。

・ 現在の陣地から上下左右に 1 マス移動することで到達できる、まだ誰の陣地でもない全てのマスを新たに陣地にする。ただし、障害物( '#' )のマスは陣地にできない。
・ 新たに陣地にできるマスが無い場合、何もしない。

盤面の情報と、先攻のプレイヤーの名前が与えられます。
盤面では、はじめに A さんのいるマスが 'A' , B さんのいるマスが 'B' で表されています。
ゲーム終了時に A さん、B さん、それぞれの陣地のマス数と勝った人の名前を出力してください。

なお、引き分けにはならないことが保証されています。

https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_camp_boss -->

<?php
	[$h , $w] = explode(" " , trim(fgets(STDIN)));
    $map = [];
    $que = [[],[]];
    $key = 0;
    $n = 0;
    $flug = false;
    $pass = true;
    $points = [1 , 1];
    $ab = trim(fgets(STDIN));
    
    for($i=0; $i<$h; $i++){
        $map[] = trim(fgets(STDIN));
    }
    
    if($ab == "B"){
        $key++;
        $n++;
    }
    
    for($i=0; $i<$h; $i++){
        for($j=0; $j<$w; $j++){
            if($map[$i][$j] === "A"){
                array_push($que[0] , $i , $j , $n);
            }elseif($map[$i][$j] === "B"){
                array_push($que[1] , $i , $j , 0);
                
            }
        }
    }
    
    while(count($que[0]) || count($que[1])){
        if(count($que[$key % 2]) == 0){
            $key++;
            $pass = false;
        }
        $a = (int)$que[$key % 2][0];
        $b = (int)$que[$key % 2][1];
        $c = (int)$que[$key % 2][2];
        if($key / 2 < $c && $pass){
            $key++;
            $a = (int)$que[$key % 2][0];
            $b = (int)$que[$key % 2][1];
            $c = (int)$que[$key % 2][2];
        }
        
        if($a > 0 && $map[$a - 1][$b] === "."){
            $map[$a - 1][$b] = 0;
            $points[$key % 2]++;
            array_push($que[$key % 2] , $a - 1 , $b , $c + 1);
        }
        if($a < $h - 1 && $map[$a + 1][$b] === "."){
            $map[$a + 1][$b] = 0;
            $points[$key % 2]++;
            array_push($que[$key % 2] , $a + 1 , $b , $c + 1);
        }
        if($b > 0 && $map[$a][$b - 1] === "."){
            $map[$a][$b - 1] = 0;
            $points[$key % 2]++;
            array_push($que[$key % 2] , $a , $b - 1 , $c + 1);
        }
        if($b < $w - 1 && $map[$a][$b + 1] === "."){
            $map[$a][$b + 1] = 0;
            $points[$key % 2]++;
            array_push($que[$key % 2] , $a , $b + 1 , $c + 1);
        }
        unset($que[$key % 2][0]);
        unset($que[$key % 2][1]);
        unset($que[$key % 2][2]);
        $que [$key % 2]= array_values($que[$key % 2]);
        if($flug){
            $key++;
            $flug = false;
        }
    }
    
    echo $points[0] . " " . $points[1] . "\n";
    if($points[0] > $points[1]){
        echo "A";
    }elseif($points[0] == $points[1]){
        echo "Draw";
    }else{
        echo "B";
    }