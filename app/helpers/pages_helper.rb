module PagesHelper
  def map(src)
    raw "<iframe width='450' height='450' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='#{src}&amp;output=embed&amp;iwloc=near'></iframe>"
  end
end
