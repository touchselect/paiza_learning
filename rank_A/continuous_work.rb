# あなたは N 個の仕事を引き受けていて、それぞれの仕事は A_i 日から B_i 日までかかることがわかっています。
# あまりにも仕事が多く自身の健康状態が心配になったあなたは、最大で連続何日出勤しなければならないのか気になりました。

# それぞれの仕事の期間が与えられるので、最大で連続何日連続出勤しなければならないか計算するプログラムを作成してください。

# メモ
# 仕事がある日を記録する配列は「0,1」より、booleanでする方が良かったかも。

job = gets
s_e = readlines(chomp: true).map{|n| n.split(" ").map(&:to_i)}

# 仕事が最大何日まであるか取得
max = 0
s_e.each do |row|
    row.each do |num|
        max = num if num > max
    end
end

# 1日から取得した最大日数までの日数分の配列を作り、仕事がある日は1を格納
days = Array.new(max, 0)
s_e.each do |job|
    for i in job[0] - 1...job[1]
        days[i] = 1
    end
end

# 最大何回1が連続するか調べる
max_count = 0
current_count = 0
days.each do |num|
    if num == 1
        current_count += 1
    else
        max_count = [max_count, current_count].max
        current_count = 0
    end
    max_count = [max_count, current_count].max
end

puts max_count