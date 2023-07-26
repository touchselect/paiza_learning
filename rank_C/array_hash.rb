# p 人のグループ A , q 人のグループ B , r 人のグループ C があります。各グループのメンバーにはそれぞれ番号がつけられており、
# A グループの i 番目の人は B グループの j 番目の人に仕事を任せ、 B グループの j 番目の人は与えられた仕事を C グループの k 番目の人に任せます。
# すると結局、 A グループの i 番目の人の仕事をするのは C グループの k 番目の人だということになります。

# パイザ君は A グループの各人の仕事を結局 C グループの誰が行うことになるのか知りたがっています。
# A グループの人のそれぞれが最終的に C グループの誰に仕事を頼むことになるのかを、 A グループの人の番号が小さい順に p 行出力してください。

# https://paiza.jp/works/mondai/c_rank_level_up_problems/c_rank_dictionary_boss

a,b,c = gets.split(" ").map(&:to_i)
a_b = {}
b_c = {}
for i in 1..a
    a1,b1 = gets.split(" ")
    a_b[a1] = b1
end
for i in 1..b
    b2,c2 = gets.split(" ")
    b_c[b2] = c2
end
for i in 1..a
    print i.to_s + " "
    puts b_c[a_b[i.to_s]]
end