class Question
  def self.find_by_id(id)
    q = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      users
    WHERE
      id = ?
    SQL
    return nil unless q.length > 0
    Question.new(q.first)
  end


  def initialize(options)
    @id = options['fname']
    @title = options['lname']
    @body = options['body']
    @user_id options['user_id']
  end

end
