# あなたは PAIZA 遊園地で働くエンジニアです。あなたは今回、観覧車の稼働状況を確認するプログラムを実装することになりました。

# PAIZA 遊園地の観覧車には N 個のゴンドラがあります。N 個のゴンドラには 1 から N までの番号が時計回りの順で付与されており、
# 番号が i のゴンドラには A_i 人まで乗ることができます (1 ≦ i ≦ N)。観覧車は、反時計回りに回転します。

# 開園後すぐに、M 組のグループが観覧車の待機列に並びました。先頭から i 番目のグループは B_i 人の人がいます (1 ≦ i ≦ M)。
# それぞれのグループの人は、次のように観覧車に乗ります。

# ・先頭のグループから順番に乗り場にあるゴンドラに乗車していく。
# ・今乗り場にあるゴンドラにグループ全員が乗れる場合、全員がそのゴンドラに乗る。
# ・今乗り場にあるゴンドラにグループ全員が乗れない場合、乗り場にあるゴンドラに乗車できる分の人だけが乗り、残りの人は次にくるゴンドラを待つ。
# ・乗り場にゴンドラ i があり、ゴンドラ i への乗車が完了した場合、次に乗り場にはゴンドラ i + 1 が到着する。(1 ≦ i ≦ N - 1)。
# ただし、ゴンドラ N の次にはゴンドラ 1 が到着するものとする。
# ・異なるグループの人が同じゴンドラに乗ることはないものとする。
# ・それぞれのゴンドラは 1 周すると乗り場に戻る。乗り場に戻った時点で、乗車していた客は全員降りる。

# 開園時点で、乗り場にはゴンドラ 1 が待機しているものとします。

# M 組目のグループの人が全員ゴンドラから降りたタイミングまでに、各ゴンドラが乗せた客の人数を求めるプログラムを作成してください。
# ただし、開園後すぐに待機列に並んだ M 組のグループ以外の利用者はいないものとします。

# 例えば入力例 1 の場合、次のようになります。
# 入力例 1 では 3 つのゴンドラがあり、それぞれのゴンドラが 5 人乗りのゴンドラになっています。また、現在観覧車には 3 組のグループが並んでいます。
# 1 番目のグループには 6 人、2 番目のグループには 5 人、3 番目のグループには 3 人の人がいます。

# ゴンドラの数とゴンドラごとの制限を取得
gondola_count, pair = gets.split.map(&:to_i)
limits = gondola_count.times.map { gets.to_i }

# ゴンドラごとの合計を初期化
sums = Array.new(gondola_count, 0)

# ゴンドラのインデックスを次に変更する関数
def change_gondola(num, gondola_count)
    num == gondola_count - 1 ? 0 : num + 1
end

# ゴンドラに人を割り振る関数
def assign_to_gondola(person, gondola_index, limits, sums, gondola_count)
    num = gondola_index
    while person > 0
        if person <= limits[num]
            sums[num] += person
            person = 0
        else
            sums[num] += limits[num]
            person -= limits[num]
        end
        num = change_gondola(num, gondola_count)
    end
    num
end

# ゴンドラに順番に人を割り振る
pair.times do
    person = gets.to_i
    gondola_index = assign_to_gondola(person, gondola_index, limits, sums, gondola_count)
end

puts sums
