
class CashRegister
    attr_accessor :total, :discount, :last_item, :last_charge, :items, :last_total, :last_items

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @last_items = []
    end

    def add_item(title, price, qty=1)
        @last_total = @total
        @last_items = @items
        @total += (price * qty)
        qty.times {@items << title}
    end

    def apply_discount
        @total = (@total  * (1 - (@discount.to_f/100.00))).to_i
        if @discount > 0
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end


    end

    def void_last_transaction
        @total = @last_total
        @items = @last_items
        if items.length == 0
            @total = 0.0
        end
    end





end
