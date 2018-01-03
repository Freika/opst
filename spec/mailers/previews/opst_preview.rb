# Preview all emails at http://localhost:3000/rails/mailers/opst
class OpstPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/opst/closing
  def closing
    OpstMailer.closing
  end

end
