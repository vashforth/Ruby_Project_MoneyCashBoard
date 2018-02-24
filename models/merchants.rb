require_relative('../db/sql_runner.rb')
require('titleize')

class Merchant

  attr_reader :id, :merchant_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_name = options['merchant_name']
  end

  def save()
    return if Merchant.find_id_by_name(@merchant_name) != nil
    sql = "INSERT INTO merchants
    (
    merchant_name
    )
    VALUES
    (
      $1)
    RETURNING *;"
    merchant = SqlRunner.run(sql, [@merchant_name])
    @id = merchant[0]['id'].to_i
  end

  def Merchant.show_all()
    sql = "SELECT * FROM merchants;"
    merchants = SqlRunner.run(sql)
    return merchants.map { |merchant| Merchant.new(merchant) }
  end

  def Merchant.find_id_by_name(name)
    sql = "SELECT * FROM merchants
    WHERE merchant_name = $1;"
    result = SqlRunner.run(sql,[name.downcase()])
    merchant = result.map { |merchant| Merchant.new(merchant)}
    return nil if merchant == []
    return merchant[0].id
  end

  def Merchant.delete_all()
    sql = "DELETE FROM merchants;"
    result = SqlRunner.run(sql)
  end

end
