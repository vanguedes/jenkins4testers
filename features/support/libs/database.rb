require "pg"

class Database
  def initialize
    @connection = PG.connect(host: "localhost", dbname: "nflix", user: "postgres", password: "qaninja")
  end

  def delete_movie(title)
    @connection.exec("DELETE from public.movies where title = '#{title}';")
  end

  def insert_movie(movie)
    sql_script = "INSERT INTO public.movies (title, status, year, release_date, created_at, updated_at)" \
    " VALUES('#{movie["title"]}', '#{movie["status"]}', '#{movie["year"]}', '#{movie["release_date"]}', '2019-08-18 21:21:11.48+00', '2019-08-18 21:21:11.48+00');"

    @connection.exec(sql_script)
  end
end
