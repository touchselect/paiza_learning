# 挿入ソートは、データ列を「整列済み」と「未整列」の2つに分け、「未整列な配列」からデータを1つ取り出し、
# 「整列済み配列」の適切な位置に挿入することを繰り返す手法です。「未整列な配列」が空になるまで処理を繰り返すと、
# 1つの「整列済み配列」が得られます。この手法は、手持ちのトランプを並び替える際などによく用いられる、自然で比較的直感的なものです。

# 挿入ソートの計算量を考えます。最も多くの計算ステップがかかるのは、while ループ中で値をずらす処理です。
# よって、この処理が最大で何回行われるかに注目し、計算量を導きます。
# 各 i について、while ループ中で値をずらす処理は最大で i 回行われます。
# つまり、最悪の場合この処理は全体で 1 + 2 + ... + n-1 = (n-1)*n/2 = (n^2-n)/2 回行われます。よって、挿入ソートは O(n^2) のアルゴリズムとなります。


# 挿入ソートは、入力される配列によって効率が変わるアルゴリズムです。
# 例えば、入力される配列が予め昇順にソートされている場合は値をずらす処理が全く行われませんが、降順にソートされている場合は (n^2-n)/2 回行われます。

# https://paiza.jp/works/mondai/sort_naive/sort_naive__insertion

n = gets.to_i
a = gets.split(" ").map(&:to_i)
# insertion_sort(a : 配列, n : Aの要素数)
    for i in 1...n
        # a[i] を、整列済みの a[0] ~ a[i-1] の適切な位置に挿入する

        # 実装の都合上、a[i] の値が上書きされてしまうことがあるので、予め a[i] の値をコピーしておく
        x = a[i]

        # a[i] の適切な挿入位置を表す変数 j を用意
        j = i - 1

        # a[i] の適切な挿入位置が見つかるまで、a[i] より大きい要素を1つずつ後ろにずらしていく
        while j >= 0 && a[j] > x
            a[j + 1] = a[j]
            j -= 1
        end

        # a[i] を挿入
        a[j + 1] = x
    end

    # a[0] ~ a[i] が整列済みになった
    puts a.join(" ")