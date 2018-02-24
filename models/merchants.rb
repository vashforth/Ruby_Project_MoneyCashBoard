require_relative('../db/sql_runner.rb')

class Merchant

  attr_reader :id, :merchant_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_name = options['merchant_name']
  end

  def save()
    sql = "INSERT INTO merchants
    (
    merchant_name
    )
    VALUES
    ($1)
    RETURNING *;"
    merchant = SqlRunner.run(sql, [@merchant_name])
    @id = merchant[0]['id'].to_i
  end

  def Merchant.show_all()
    sql = "SELECT * FROM merchants;"
    merchants = SqlRunner.run(sql)
    return merchants.map { |merchant| Merchant.new(merchant) }
  end

  def Merchant.delete_all()
    sql = "DELETE FROM merchants;"
    result = SqlRunner.run(sql)
  end

end
