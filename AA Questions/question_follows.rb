require_relative 'QuestionsDatabase'

class QuestionFollows

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM question_follows")
    data.map { |datum| QuestionFollows.new(datum) }
  end

  def self.find_by_id(id)
    qf = QuestionsDBConnection.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      users
    WHERE
      id = ?
    SQL
    return nil unless qf
    QuestionsDBConnection.new(qf.first)
  end


  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @questions_id = options['questions_id']
  end




end
