# 選択ソート (昇順) は、データ列を「整列済み」と「未整列」の2つに分け、「未整列な配列」の最小値を取り出し、
# 「整列済み配列」の末尾に付け加えることを繰り返す手法です。「未整列な配列」の要素数が 1 になるまで処理を繰り返すと、1つの「整列済み配列」が得られます。

# 選択ソートの計算量を考えます。最も多くの計算ステップがかかるのは、二重 for ループ中にて値を比較する処理です。
# よって、この処理が何回行われるかに注目し、計算量を導きます。この処理は、各 i について n-i-1 回行われます。
# つまり、この処理は全体で n-1 + ... + 1 = (n-1)*n/2 = (n^2-n)/2 回行われます。よって、選択ソートは O(n^2) のアルゴリズムとなります。

# 選択ソートは、入力によって効率が左右されないアルゴリズムです。

# https://paiza.jp/works/mondai/sort_naive/sort_naive__selection

n  = gets.to_i
a = gets.split(" ").map(&:to_i)
#selection_sort(a : 配列, n : aの要素数)
    for i in 0...n - 1
        # a[i] ~ a[n-1] の最小値を見つけ、a[i]と交換する
        # つまり、整列済みとなっている a[0] ~ a[i-1] の末尾に、a[i] ~ a[n-1] の最小値を付け加える

        # a[i] ~ a[n-1] の最小値の位置を保存する変数 min_index を用意
        # 暫定的に a[i] を最小値とする
        min_index = i

        # 最小値を探す
        for j in i + 1..n - 1
            if a[j] < a[min_index]
                min_index = j
            end
        end

        # a[i] と a[min_index]を交換
        a[i], a[min_index] = a[min_index], a[i]
    end

    # a[0] ~ a[i] が整列済みになった
    puts a.join(" ")