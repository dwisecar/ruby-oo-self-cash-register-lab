class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = {}
    end

    def total
        @total
    end

    def add_item(title, price, quantity = 1)
        self.total += (price * quantity)
        self.items.fill(title, self.items.length, quantity)
        self.last_transaction = {:last_item => title, :last_price => price, :last_quantity => quantity}
    end

    def apply_discount
        if discount == 0
            "There is no discount to apply."
        else
            self.total = self.total - self.total * discount / 100.00
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def void_last_transaction
        self.total -= self.last_transaction[:last_price] * self.last_transaction[:last_quantity]
        self.items.reject {|i| i == self.last_transaction[:last_item]}
    end

end
