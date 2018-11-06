class Replies
  def self.find_by_id(id)
    r = QuestionsDBConnection.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      replies
    WHERE
      id = ?
    SQL
    return nil unless r
    Replies.new(r.first)
  end



  def initialize(options)

    @subject = options['subject']
    @body = options['body']

  end



end
