module KidsHelper

  def current_kid
    @current_kid ||= Kid.find_by(params[:id])
  end

end
