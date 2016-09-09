require "camping"

Camping.goes :CampingApp

module CampingApp::Controllers
  class Index < R "/"
    def get
      render :hello
    end
  end
end

module CampingApp::Views
  def hello
    p  MESSAGE
  end
end
