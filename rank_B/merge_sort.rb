# マージソート (昇順) は、データ列を二分し、それぞれをマージソートした後それらを「マージ (統合) 」することを繰り返すソートアルゴリズムです。
# マージソートは、問題を小さな問題に分割して解くことを繰り返すことによって元の問題の答えを得る手法である「分割統治法」に基づいたアルゴリズムです。

# マージソート (昇順) は以下のようなアルゴリズムです。
# データ列を二分してマージソートを行う merge_sort と、昇順にソートされた2つの部分データ列をマージする merge から成ります。

# このプログラムでは番兵と呼ばれるテクニックを使っています。
# これは、処理を行う範囲の境界部分に特殊なデータを置いておくことで、プログラムをすっきりさせるテクニックです。
# 番兵を使わずに上のプログラムを書こうとすると、データ列をマージする処理において lindex や rindex が
# それぞれ nl, nr 未満であるかどうかを確かめながら複雑な条件分岐の処理を書く必要が出てきます。
# 今回は、入力の最大値より大きい数 INF を2つのデータ列の末尾に配置することで、番兵を実現しています。

# https://paiza.jp/works/mondai/sort_efficient/sort_efficient__merge

INF = 2**60

# 部分データ列 a[left] ~ a[mid-1], a[mid] ~ a[right-1] はそれぞれ整列済み
# 2つの部分データ列をマージし、a[left] ~ a[right-1] を整列済みにする
def merge(a, left, mid, right)
    # 2つの部分データ列のサイズ
    nl = mid - left
    nr = right - mid

    # 部分データ列をコピー
    l = []
    r = []
    for i in 0...nl
        l[i] = a[left + i]
    end
    for i in 0...nr
        r[i] = a[mid + i]
    end
    
    # 番兵
    l[nl] = INF
    r[nr] = INF
    
    # 2つの部分データ列をマージして a[left] ~ a[right-1] に書き込む
    lindex = 0
    rindex = 0

    for i in left...right
        if l[lindex] < r[rindex]
            a[i] = l[lindex]
            lindex += 1
        else
            a[i] = r[rindex]
            rindex += 1
        end
    end
end

# a[left] ~ a[right-1] をマージソートする
# 配列 a をマージソートするには merge_sort(a, 0, n) を呼び出す
def merge_sort(a, left, right)
    if left + 1 < right
        mid = (left + right) / 2
        merge_sort(a, left, mid)
        merge_sort(a, mid, right)
        merge(a, left, mid, right)
    end
end

n = gets.to_i
a = gets.split(" ").map(&:to_i)
merge_sort(a, 0, n)
puts a.join(" ")
