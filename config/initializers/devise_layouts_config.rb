JMistarzPortfolio::Application.configure do
  config.to_prepare do
    Devise::SessionsController.layout       "pages"
    Devise::RegistrationsController.layout  "pages"
    Devise::ConfirmationsController.layout  "pages"
    Devise::UnlocksController.layout        "pages"
    Devise::PasswordsController.layout      "pages"
  end
end