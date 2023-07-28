# あなたは現在就活生で、ある地域で開催される様々な企業の説明会に参加しようとしています。

# 説明会が開催される地域はあなたの住んでいる地域から遠く、その説明会に参加するためには飛行機で移動しなければいけません。
# しかし、何度も飛行機に乗ると交通費がかさんでしまうため、飛行機での往復は一度限りとし、その一度の渡航でできるだけ多くの企業説明会に参加したいです。

# あなたは、説明会に行く際、時間を無駄にしたくないため、日程が連続している説明会にしか参加しません。
# 企業説明会の日程の情報が与えられるので、一番多く参加できる日程を出力するプログラムを作成してください。

event_count = gets.to_i
event_plan = readlines(chomp: true).map(&:to_i)
event_con = {}
count = 1

for i in 1..event_count
    if event_plan[i - 1] + 1 == event_plan[i]
        count += 1
    else
        start = event_plan[i - count]
        event_con[start] = count
        count = 1
    end
end
sort_event = event_con.map { |key, value| [key, value] }
sort_event = sort_event.sort_by {|x| [x[1], -x[0]]}.reverse
print sort_event[0][0]
print " "
print sort_event[0][0] + sort_event[0][1] - 1