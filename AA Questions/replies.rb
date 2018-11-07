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

  def self.find_by_user_id(author_id)
    r = QuestionsDBConnection.instance.execute(<<-SQL, author_id)
    SELECT
      *
    FROM
      replies
    WHERE
      author_id = ?
    SQL
    return nil unless r.length > 0
    r
  end

  def self.find_by_question_id(question_id)
    r = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
    SELECT
      *
    FROM
      replies
    WHERE
      question_id = ?
    SQL
    return nil unless r.length > 0
    r
  end



  def initialize(options)
    @id = options['id']
    @subject = options['subject']
    @body = options['body']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @author_id = options['author_id']
  end

  # def parent_reply
  #   r = QuestionsDBConnection.instance.execute(<<-SQL)
  #   SELECT
  #     *
  #   FROM
  #     replies
  #   WHERE
  #     question_id = ?
  #   SQL
  #   return nil unless r.length > 0
  #   r
  # end

end
