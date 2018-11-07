require_relative 'QuestionsDatabase'

class Questions

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM questions")
    data.map { |datum| Questions.new(datum) }
  end
  #
  def self.find_by_id(id)
    q = QuestionsDBConnection.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      questions
    WHERE
      id = ?
    SQL
    return nil unless q.length > 0 
    Questions.new(q.first)
  end
  #
  def self.find_by_author(id)
    q = QuestionsDBConnection.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      questions
    WHERE
      user_id = ?
    SQL
    return nil unless q
    q
  end




  def initialize(options)
    @id = options['fname']
    @title = options['lname']
    @body = options['body']
    @user_id = options['user_id']
  end

end
