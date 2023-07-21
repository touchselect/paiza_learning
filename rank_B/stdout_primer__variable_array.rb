# 自然数 N, M と N 個の自然数からなる数列 A と M 個の自然数からなる数列 B が与えられます。1 行目には数列 A の最初の B_1 個の値を出力し、
# 2 行目にはその次から B_2 個の値を出力します。このように、i 行目には数列 A の 1 + B_1 + B_2 + ... + B_{i - 1} 番目の値から B_i 個の値を出力してください。
# 言い換えると、数列 A の値を B_1 個、B_2個、... B_M 個で分割し、それぞれの数列を改行区切りで出力してください。
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__variable_array_boss
input_line = gets.split(" ").map(&:to_i)
array = gets.split(" ")
count = gets.split(" ").map(&:to_i)
for i in 0..input_line[1] - 1
    for j in 0..count[i] - 1
        print array.shift
        unless j == count[i] - 1
            print " "
        end
    end
    print "\n"
end