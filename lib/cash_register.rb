require "pry"
class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(employee_discount = 0)
        self.total = 0
        self.discount = employee_discount
        self.items = []
    end

    def add_item(title, price, quantity = 1)
        # increase total and save last transaction
        item_cost = price * quantity
        self.total += item_cost
        self.last_transaction = item_cost

        # add items to items array
        i = 0
        while i < quantity do
            @items << title
            i += 1
        end 
    end

    def apply_discount
        # binding.pry
        if self.discount == 0
            "There is no discount to apply."
        else 
            new_total = self.total * ((100 - self.discount.to_f) / 100)
            self.total = new_total.to_i
            "After the discount, the total comes to $#{self.total}."
        end 
    end

    def items
        @items
    end

    def void_last_transaction
        self.total -= last_transaction
    end

end
