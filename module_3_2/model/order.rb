require '../db/db_connector'

class Order
    attr_accessor :reference_no, :customer_name, :date 
    def initialize(reference_no, customer_name, date)
    @reference_no = reference_no
    @customer_name = customer_name
    @date =date
    end

    def save
        return false unless valid?
            
        client = create_db_client
        client.query("INSERT INTO orders(reference_no, customer_name, date) VALUES ()")
    end

    def valid?
        return false if @reference_no.nil?
        return false if @customer_name.nil?
        return false if @date.nil?
    end
end