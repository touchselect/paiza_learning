# 居酒屋で働きながらクラスの勉強をしていたあなたは、お客さんをクラスに見立てることで勤務時間中の店内の人数や注文の情報を管理できることに気付きました。
# 全てのお客さんは、ソフトドリンクと食事を頼むことができます。加えて 20 歳以上のお客さんはお酒を頼むことができます。
# 20 歳未満のお客さんがお酒を頼もうとした場合はその注文は取り消されます。
# また、お酒（ビールを含む）を頼んだ場合、以降の全ての食事の注文 が毎回 200 円引きになります。

# 今回、この居酒屋でビールフェスをやることになり、ビールの注文が相次いだため、いちいちビールの値段である 500 円を書くのをやめ、
# 注文の種類と値段を書く代わりに 0 とだけを書くことになりました。

# 勤務時間の初めに店内にいるお客さんの人数と与えられる入力の回数、各注文をしたお客さんの番号とその内容、または退店したお客さんの番号が与えられます。
# お客さんが退店する場合はそのお客さんの会計を出力してください。勤務時間中に退店した全てのお客さんの会計を出力したのち、勤務時間中に退店した客の人数を出力してください。

# https://paiza.jp/works/mondai/class_primer/class_primer__static_member

class Customer
    attr_reader :age, :price
    
    def initialize(age)
        @age = age
        @price = []
        @alcohol = false
    end
    
    def adult?(age)
        if age < 20
            return false
        else
            return true
        end
    end
    
    def beer
        if adult?(@age)
            @price << 500
            @alcohol = true
        end
    end
    
    def finish
        total_amount = @price.sum
        return total_amount
    end
    
    def alcohol(price)
        if adult?(@age)
            @price << price
            @alcohol = true
        end
    end
        
    def softdrink(price)
        @price << price
    end
    
    def food(price)
        if @alcohol
            @price << price - 200
        else
            @price << price
        end
    end
    
end

n, k = gets.split(" ").map(&:to_i)
customers = []
count = 0
for i in 1..n
    age = gets.to_i
    customer = Customer.new(age)
    customers << customer
end
for i in 1..k
    order = gets.split(" ")
    num = order[0].to_i
    price = order[2].to_i
    customer = customers[num - 1]
    case order[1]
    when "A"
        count += 1
        puts customer.finish
    when "0"
        customer.beer
    when "alcohol"
        customer.alcohol(price)
    when "softdrink"
        customer.softdrink(price)
    when "food"
        customer.food(price)
    end
end
puts count