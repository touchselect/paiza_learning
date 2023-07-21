<!-- 開始時点の x , y 座標、移動の回数 N が与えられます。
続くN行で移動の向き d1 ... dN が与えられるので、与えられた順に移動をしたときの各移動後の x , y 座標 を答えてください。
移動者ははじめ北を向いています。

なお、マスの座標系は下方向が y 座標の正の向き、右方向が x 座標の正の向きとします。

・ 移動をするごとに向く方角が変わること
・ 移動前に向いている方角によって同じ移動の向きでも座標の変化が違うこと
の 2 点に気をつけてください。
例えば、上の図の状態から右に移動を行った場合、下の図のような状態になります。
https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_snake_move_boss -->
<?php
    [$x , $y , $n] = explode(" " , trim(fgets(STDIN)));
    $directions = ["N", "E", "S", "W"];
    $nd = 0;
    for($i=0; $i<$n; $i++){
        $a = trim(fgets(STDIN));
        if($a == 'R'){
            $nd = ($nd + 1) % 4;
        }else{
            $nd = ($nd + 3) % 4;
        }
        
        if($directions[$nd] == 'N'){
            $y--;
        }elseif($directions[$nd] == 'E'){
            $x++;
        }elseif($directions[$nd] == 'S'){
            $y++;
        }elseif($directions[$nd] == 'W'){
            $x--;
        }
        echo $x . " " . $y . "\n";
    }