class SqlFileMigration < ActiveRecord::Migration
  def up
    say @up_sql_file
    execute_file(@up_sql_file)
  end

  def down
    say @down_sql_file
    execute_file(@down_sql_file)
  end

  protected

  def set_migration(m)
    migration_filename = File.basename(m, '.rb')
    sql_file = "#{migration_filename}.sql"
    @up_sql_file = "db/sql/up/#{sql_file}"
    @down_sql_file = "db/sql/down/#{sql_file}"
  end

  private

  def execute_file(filename)
    IO.readlines(filename, ';').each do |statement|
      statement.strip!
      if (!statement.empty?)
        execute(statement)
      end
    end
  end
end