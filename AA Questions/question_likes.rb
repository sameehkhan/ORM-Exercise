require_relative 'QuestionsDatabase'


class QuestionLikes

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM question_likes")
    data.map { |datum| QuestionLikes.new(datum) }
  end


  def self.find_by_id(id)
    ql = QuestionsDBConnection.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      users
    WHERE
      id = ?
    SQL
    return nil unless ql
    QuestionLikes.new(ql.first)
  end



  def initialize(options)
    @fname = options['fname']
    @lname = options['lname']
  end



end
