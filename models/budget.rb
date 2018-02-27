class Budget

  attr_accessor :weekly, :monthly, :yearly
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @weekly = options['weekly']
    @monthly = options['monthly']
    @yearly = options['yearly']
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

  def Budget.delete_all()
    sql = "DELETE FROM budget;"
    result = SqlRunner.run(sql)

  end


end
