class QuestionLikes
  def self.find_by_id(id)
    ql = QuestionsDBConnection.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      users
    WHERE
      id = ?
    SQL
    return nil unless ql.length > 0
    QuestionLikes.new(ql.first)
  end



  def initialize(options)
    @fname = options['fname']
    @lname = options['lname']
  end



end
