class QuestionFollows
  def self.find_by_id(id)
    qf = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      users
    WHERE
      id = ?
    SQL
    return nil unless qf.length > 0
    QuestionFollows.new(qf.first)
  end


  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @questions_id = options['questions_id']
  end




end
