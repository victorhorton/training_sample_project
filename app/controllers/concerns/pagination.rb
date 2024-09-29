module Pagination
  extend ActiveSupport::Concern

  def limits
    [ 8, 16, 32 ]
  end

  def offset
    params[:page].nil? ? 0 * limit : (params[:page].to_i - 1) * limit
  end

  def limit
    puts limits.include?(params[:per_page].to_i)
    limits.include?(params[:per_page].to_i) ? params[:per_page].to_i : limits[0]
  end
end
