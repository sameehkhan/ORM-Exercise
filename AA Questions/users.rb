class Users

def self.find_by_id(id)
  users_data = QuestionsDatabase.instance.execute(<<-SQL, id)
  SELECT
    *
  FROM
    users
  WHERE
    id = ?
  SQL
  return nil unless users_data.length > 0
  Users.new(users_data.first)
end

def self.find_by_id(fname,lname)
  users_data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
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


end
