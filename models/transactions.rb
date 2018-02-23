require_relative('../db/sql_runner.rb')

class Transaction

  attr_reader :id, :amount, :merchant_id, :tag_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @amount = options['amount']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
  end

  def save()
    sql = "INSERT INTO transactions
    (
      amount,
      merchant_id,
      tag_id
      )
    VALUES
    ($1, $2, $3)
    RETURNING *;"
    values = [@amount, @merchant_id, @tag_id]
    transaction = SqlRunner.run(sql, values)
    @id = transaction[0]['id'].to_i
  end

  def tag()
    sql = "SELECT * FROM tags
    WHERE id = $1;"
    tag = SqlRunner.run(sql, [@tag_id])
    return tag[0]['tag_name']
  end

  def merchant()
    sql = "SELECT * FROM merchants
    WHERE id = $1;"
    merchant = SqlRunner.run(sql, [@merchant_id])
    return merchant[0]['merchant_name']
  end

  def Transaction.show_all()
    sql = "SELECT * FROM transactions;"
    transactions = SqlRunner.run(sql)
    return transactions.map { |transaction| Transaction.new(transaction)  }
  end

  def Transaction.sum_all()
    sql = "SELECT SUM(amount) FROM transactions;"
    total = SqlRunner.run(sql)
    return total[0]['sum'].to_f
  end

  def Transaction.delete_all()
    sql = "DELETE FROM transactions;"
    result = SqlRunner.run(sql)
  end

end
