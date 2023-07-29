# 大きな数値Nが入力されます。 位の小さい方から 3 けたごとにカンマ区切りで出力してください。
# ただし、Nのけた数は 3 の倍数とは限りません。
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__specific_split_boss

# メモ
# input_line.insert(length - i, ",") length -  iで後ろから数えて挿入する

input_line = gets.chomp.split("")
length = input_line.length
for i in 1..length
    if i % 3 == 0
        input_line.insert(length - i, ",")
    end
end
if length % 3 == 0
    input_line.shift
end
input_line.each do |num|
    print num
end