# あなたは集団行動のリーダーです。次のような指示を出すことで様々な列の操作ができます。

# ・swap A B
# 先頭から A 番目の人と、先頭から B 番目の人の位置を入れ替える。
# ・reverse
# 列の前後を入れ替える。
# ・resize C
# 先頭から C 人を列に残し、それ以外の人を全員列から離れさせる。ただし、列が既に C 人以下の場合、何も行わない。

# 初め、列には番号 1 〜 N の N 人がおり、先頭から番号の昇順に並んでいます。(1, 2 , 3, ..., N)
# あなたの出した指示の回数 Q とその指示の内容 S_i (1 ≦ i ≦ Q) が順に与えられるので、全ての操作を順に行った後の列を出力してください。

# メモ
# array[n], array[m] = array[m], array[n] 配列内の値を入れ替える記述
# sliceメソッド（開始位置..終了位置）

input = gets.split(" ").map(&:to_i)
array = []
for i in 1..input[0]
    array.push(i)
end
order = readlines(chomp: true).map{|line| line.split(" ")}

for j in 1..input[1]
    if order[j - 1][0] == "swap"
        n = order[j - 1][1].to_i - 1
        m = order[j - 1][2].to_i - 1
        array[n], array[m] = array[m], array[n]
    elsif order[j - 1][0] == "resize"
        array.slice!(order[j - 1][1].to_i..-1)
    else
        array.reverse!
    end
end
puts array