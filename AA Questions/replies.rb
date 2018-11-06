class Replies
  def self.find_by_id(id)
    r = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      users
    WHERE
      id = ?
    SQL
    return nil unless r.length > 0
    Replies.new(r.first)
  end



  def initialize(options)
    @subject = options['subject']
    @body = options['body']
  end



end
