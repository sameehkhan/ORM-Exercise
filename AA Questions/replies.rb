require_relative 'QuestionsDatabase'

class Replies

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM replies")
    data.map { |datum| Replies.new(datum) }
  end

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
    @id = options['id']
    @subject = options['subject']
    @body = options['body']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @author_id = options['author_id']

  end



end
