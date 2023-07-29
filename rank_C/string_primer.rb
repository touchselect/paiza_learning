# paiza 研究所では実験データをわかりやすい形式で保存したいのですが、
# 機械によって得られる数値には、次のような表記ミスがあることがわかっています。

# ・ ミス 1
# 先頭に必要のない 0 がいくつかついてしまう
# ・ 本来 1 である数値が 0001 と表記されてしまう
# ・ 本来 0.001 である数値が 00.001 と表記されてしまう

# ・ ミス 2
# 小数である数値の末尾に必要のない 0 がいくつかついてしまう
# ・ 本来 0.1 である数値が 0.10 と表記されてしまう

# ・ ミス 3
# 小数である数値に小数点が複数個ついてしまう
# ただし、 1 つめの小数点の位置が正しい小数点の位置であるものとします
# ・ 本来 0.123 である数値が 0.1.2.3 と表記されてしまう。

# 表記が正しくない可能性のある数値を表す文字列 S が与えられるので、その数値を正しい表記にしてください。
# S を数値として扱うと上手く処理が行えないので気をつけてください。

# https://paiza.jp/works/mondai/string_primer/advance_step7

s = gets.chomp
if !s.include?(".")
    i = 0
    while i < s.length
      break if s[i] != "0"
      i += 1
    end
  
    if i == s.length
      puts 0
    else
      puts s[i..-1]
    end
  else
    ans = ""
    start = 0
  
    s.each_char.with_index do |char, i|
      if char != "0"
        if char == "."
          ans += "0"
        end
  
        start = i
        break
      end
    end
  
    last = 0
    s.each_char.with_index do |char, i|
      if char != "0"
        last = i
      end
    end
  
    first_dot = s[start..last].index(".")
    s[start..last].each_char.with_index do |char, i|
      if char != "."
        ans += char
      elsif i == first_dot
        ans += char
      end
    end
  
    puts ans
  end
  
