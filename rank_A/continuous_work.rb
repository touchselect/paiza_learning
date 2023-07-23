# あなたは N 個の仕事を引き受けていて、それぞれの仕事は A_i 日から B_i 日までかかることがわかっています。
# あまりにも仕事が多く自身の健康状態が心配になったあなたは、最大で連続何日出勤しなければならないのか気になりました。

# それぞれの仕事の期間が与えられるので、最大で連続何日連続出勤しなければならないか計算するプログラムを作成してください。

job = gets
s_e = readlines(chomp: true).map{|n| n.split(" ").map(&:to_i)}

max = 0
s_e.each do |row|
    row.each do |num|
        max = num if num > max
    end
end

days = Array.new(max, 0)
s_e.each do |job|
    for i in job[0] - 1...job[1]
        days[i] = 1
    end
end

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