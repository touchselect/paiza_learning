# ２つの整数 A , B が与えられるので、 A, A + 1, .... B - 1, B の総和を求めてください。
# https://paiza.jp/works/mondai/etc/a_rank_calculation_step1

a, b = gets.split(" ").map(&:to_i)
plus = a + b
count = b - a + 1
result = plus * count
puts result / 2

# 以下NGコード

a, b = gets.split(" ").map(&:to_i)
sum = 0
for i in a..b
    sum += i
end
puts sum