class NewsFeedCell < Cell::Rails

  debugger 

  def index(args)
    @pages = ::Page.scoped
    render
  end

end
