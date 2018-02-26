require_relative('../db/sql_runner.rb')

class Transaction

  attr_reader :id, :amount, :merchant_id, :tag_id, :trans_date

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @amount = options['amount']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @trans_date = options['trans_date']
    @budget = 1500
  end

  def save()
    sql = "INSERT INTO transactions
    (
      amount,
      merchant_id,
      tag_id,
      trans_date
      )
    VALUES
    ($1, $2, $3, $4)
    RETURNING *;"
    values = [@amount, @merchant_id, @tag_id, @trans_date]
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

  def Transaction.delete_by_id(id)
    sql = "DELETE FROM transactions
    WHERE id = $1;"
    result = SqlRunner.run(sql, [id])
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

  def Transaction.total_by_date(start_date, end_date)
    sql = "SELECT SUM(amount) FROM transactions
    WHERE trans_date BETWEEN $1 AND $2;"
    values = [start_date.to_s, end_date.to_s]
    total = SqlRunner.run(sql, values)
    return total[0]['sum'].to_f
  end

end
