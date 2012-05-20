class PageConstraint
  def matches?(request)
    Page.where(:path => request.params[:path]).first.present?
  end
end
