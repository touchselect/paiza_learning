# 列の数がM、行の数がNの表があります。表の各マスは白か黒で塗られています。
# 黒で塗られたマスが上下左右で隣接している時、その黒マスの塊をまとめて「島」と呼びます。
# 例えば、以下のような4列×5行の表（M=4、N=5）があった場合、

# 0 1 1 0
# 1 0 1 0
# 1 0 0 0
# 0 0 1 1
# 0 1 1 1

# この表には以下の(1)～(3)のように3つの島が存在します。

# 0 島1 島1 0
# 島2 0 島1 0
# 島2 0 0  0
# 0 0 島3 島3
# 0 島3 島3 島3

# 島の数を計算して出力するプログラムを作成して下さい。

# メモ
# アルゴリズム 深さ優先検索DFS

w, h = gets.split(" ").map(&:to_i)
map = readlines(chomp: true).map{|n| n.split(" ").map(&:to_i)}
visit = Array.new(h){Array.new(w,false)}
islands = 0

def search(map, visit, h, w, i, j)
    if i < 0 || i >= h || j < 0 || j >= w || visit[i][j] || map[i][j] == 0
        return
    end
    visit[i][j] = true
    dir = [[0,1],[1,0],[0,-1],[-1,0]]
    dir.each do |d|
        i1 = i + d[0]
        j1 = j + d[1]
        search(map, visit, h, w, i1, j1)
    end
end

for i in 0...h
    for j in 0...w
        if map[i][j] == 1 && !visit[i][j]
            search(map, visit, h, w, i, j)
            islands += 1
        end
    end
end

puts islands