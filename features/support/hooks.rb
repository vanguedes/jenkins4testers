Before do
  @login_page = LoginPage.new
  @movie_page = MoviePage.new
  @sidebar = SideBarView.new

  page.current_window.resize_to(1440, 900)
end

Before("@login") do
  @login_page.go
  @login_page.with("tony@stark.com", "pwd123")
end

After do
  # if scenario.failed?
  temp_shot = page.save_screenshot("log/temp_shot.png")
  screenshot = Base64.encode64(File.open(temp_shot).read)
  embed(screenshot, "image/png", "Screenshot")
  # end
end
