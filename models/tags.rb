require_relative('../db/sql_runner.rb')

class Tag

  attr_reader :id, :tag_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @tag_name = options['tag_name']
  end

  def save()
    sql = "INSERT INTO tags
    (tag_name)
    VALUES
    ($1)
    RETURNING *;"
    tag = SqlRunner.run(sql, [@tag_name])
    @id = tag[0]['id'].to_i
  end

  def total()
    sql = "SELECT SUM(amount) FROM transactions
    WHERE tag_id = $1;"
    total = SqlRunner.run(sql, [@id])
    return total[0]['sum'].to_f
  end

  def Tag.show_all()
    sql = "SELECT * FROM tags;"
    tags = SqlRunner.run(sql)
    return tags.map { |tag| Tag.new(tag)  }
  end

  def Tag.delete_all()
    sql = "DELETE FROM tags;"
    result = SqlRunner.run(sql)
  end

end
