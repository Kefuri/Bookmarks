require 'pg'

def truncate_tables
  p 'Wiping current data for tests... '

  connection = PG.connect(dbname: 'bookmark_manager_test')

  connection.exec("TRUNCATE bookmarks;")

end