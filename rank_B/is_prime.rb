# 素数大学学長に就任した paiza 君は素数が好きすぎるあまり、受験番号が素数の生徒を全員合格、素数でない生徒を全員不合格とすることにしました。
# N 人の受験生の受験番号 A_1 , ... ,A_N が与えられるので、各受験生について合否を判定してください。
# なお、「整数 N が素数である」とは「N が 1 でない、かつ、N の約数が 1 と N のみしか存在しない」ことをいいます。
# ただじ、受験番号は6,000,000までである。

# https://paiza.jp/works/mondai/prime_number_primer/prime_number_primer__is_prime_multi

# メモ
# エラトステネスの篩

n = gets.to_i

is_prime = Array.new(6000001, true)
is_prime[0] = false
is_prime[1] = false

(2..6000000).each do |i|
    if is_prime[i]
        j = i * 2
        while j <= 6000000 do
            is_prime[j] = false
            j += i
        end
    end
end

n.times do
     a = gets.to_i
    if is_prime[a]
        puts "pass"
    else
        puts "failure"
    end
end