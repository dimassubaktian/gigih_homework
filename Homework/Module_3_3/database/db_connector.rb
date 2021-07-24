def create_db_client
    client = Mysql2::Client.new(
        :host=>ENV['DB_HOST'],
        :username => ENV['DB_USER'],
        :password => ENV['DB_PASSWORD'],
        :database => ENV['DB_NAME']
    )
    client    
end

# oneline command
# export DB_NAME=food_oms_db && export DB_HOST=localhost && export DB_PASSWORD= && export DB_USER=