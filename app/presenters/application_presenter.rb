class ApplicationPresenter
  include ActionView::Helpers
  include Rails.application.routes.url_helpers
  include Refile::AttachmentHelper

  def initialize(object, user = nil)
    @object = object
    @user = user
  end

  def self.presents(name)
    define_method(name) do
      @object
    end
  end
end
