class Budget

  attr_accessor :weekly, :monthly, :yearly
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @weekly = options['weekly'].to_f
    @monthly = options['monthly'].to_f
    @yearly = options['yearly'].to_f
  end

  def save()
    sql = "INSERT INTO budget
    (
      weekly,
      monthly,
      yearly
      )
    VALUES
    ( $1, $2, $3)
    RETURNING *;"
    values = [@weekly, @monthly, @yearly]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE budget
    SET
    (weekly,
    monthly,
    yearly)
    =
    ($1, $2, $3)
    WHERE id = $4;"
    values = [@weekly, @monthly, @yearly, @id]
    result = SqlRunner.run(sql, values)
  end

  def Budget.find_by_id(id)
    sql = "SELECT * FROM budget
    WHERE id = $1;"
    result = SqlRunner.run(sql, [id.to_i])
    return nil if result.count == 0
    budget = Budget.new(result[0])
    return budget
  end

  def Budget.delete_all()
    sql = "DELETE FROM budget;"
    result = SqlRunner.run(sql)
  end

  def Budget.show_all()
    sql = "SELECT * FROM budget;"
    budget = SqlRunner.run(sql)
    return Budget.new(budget[0])
  end


end
