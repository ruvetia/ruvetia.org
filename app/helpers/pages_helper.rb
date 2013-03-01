module PagesHelper
  def map(src)
    raw "<iframe width='100%' height='500' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='#{src}&amp;output=embed&amp;iwloc=near'></iframe>"
  end
end
