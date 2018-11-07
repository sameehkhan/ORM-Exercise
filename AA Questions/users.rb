require_relative 'QuestionsDatabase'
require_relative 'question'
require_relative 'replies'


class Users


  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM users")
    data.map { |datum| Users.new(datum) }
  end

def self.find_by_id(id)
  users_data = QuestionsDBConnection.instance.execute(<<-SQL, id)
  SELECT
    *
  FROM
    users
  WHERE
    id = ?
  SQL
  return nil unless users_data.length > 0
  users_data
end

def self.find_by_name(fname,lname)
  users_data = QuestionsDBConnection.instance.execute(<<-SQL, fname, lname)
  SELECT
    *
  FROM
    users
  WHERE
    fname = ? AND
    lname = ?
  SQL
end

def initialize(options)
  @id = options['id']
  @fname = options['fname']
  @lname = options['lname']
end



def authored_questions
 Questions.find_by_author(@id)

end

def authored_replies
  Replies.find_by_user_id(@id)
end



end
